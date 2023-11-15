# Dotfiles

> Hack the Planet

This is my macOS setup guide. Since I'm doing it with a fresh mac, I'm noting everything for future macs.


# New mac? Do this first

## Fix natural scrolling
System Preferences > Trackpad > Scroll & Zoom > Uncheck Scroll direction: natural

## Replace capslock with esc (because im a vim users)
System Preferences > Keyboard > Modifier Keys > Caps Lock Key: Escape

# Install Brew

https://brew.sh

# Install Brew Packages

A refined list of my must-haves
```
brew install ag exa fasd fzf gnupg jq gh git starship
```

# Install Dotfiles

- TODO: Revisit install.sh
```
gh repo clone drobati/dotfiles .dotfiles
cd .dotfiles
./install.sh
```

# Basics

## Zsh

Upgrade to latest zsh

```
brew install zsh
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells' 
chsh -s /usr/local/bin/zsh
```

## Node

Install nvm
```
brew install nvm
```

Add this to .zshrc (though it's probably there if you use my dotfile)
```
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"' >> ~/.zshrc
echo '[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc
```

Install latest node
```
nvm install 20
nvm alias default 20
```

Update npm
```
npm i -g npm
```

## Python
```
brew install pyenv
```

Add this to .zshrc
```
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

Install both pythons
```
pyenv install 3
pyenv install 2
pyenv global 3
```

Double-check the versions
```
python --version
python3 --version
python2 --version
```

# git

Git should already be upgraded from brew earlier
```
git config --global user.name "Derek Robati"
git config --global user.email derek@robati.com
```

# gh (github cli)

```
gh auth login
```

# ssh

Generate SSH key
```
ssh-keygen -t rsa
```

Add SSH key to github
```
cat ~/.ssh/id_rsa.pub | gh ssh-key add -t "Your Key Title"
```

# gpg

### setup
First, setup TTY to show agent, or if you want TTY you can install `pinentry`
```
vim ~/.gnupg/gpg.conf
```

Put these in `~/.gnupg/gpg.conf`
```
no-tty
use-agent
```
_If GPG complains about tty comment non-tty in ~/.gnupg/gpg.conf, then renable it._

Write TTY to .bashrc (can't remember if this is necessary)
```
echo "export GPG_TTY=$(tty)" >> ~/.bashrc
```

### yearly renewal
Generate GPG key
```
gpg --full-generate-key
```

Configure git config for GPG
```
git config --global user.signingkey derek@robati.com
git config --global commit.gpgsign true
```

Upload the key to github
```
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export <key> | gh gpg-key add -
```

Delete the expired key
```
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <key>
gh gpg-key delete <key>
```

# Applications

## Warp
Best terminal out rn
```zsh
brew install --cask warp
```

## JetBrains Toolkit
https://www.jetbrains.com/toolbox-app/
This lets me install webstorm and datagrip.

## Raycast
Excellent spotlight replacement
https://www.raycast.com/

## Install Rectangle
Must have window management
https://rectangleapp.com/

## Install Bartender
Menubar management
https://www.macbartender.com

## MacVim

```
brew install macvim
```

https://github.com/macvim-dev/macvim/wiki/FAQ#how-to-use-pythonrubylua-interface-in-macvim

This is to remind me of why to install MacVim with brew.

Add it to your applications folder so spotlight can find it.
```
mv /usr/local/Cellar/macvim/7.3-65/MacVim.app /Applications/  
ln -s /Applications/MacVim.app /usr/local/Cellar/macvim/7.3-65/
```

Install the plugins, but only after .bashrc is fixed.

```
:PlugInstall
```

# Extras

## Shut up Terminal last login
```
touch ~/.hushlogin
```

# 30s
A cli tool for printing snippets of code. I use this to print out short snippets of code to read on a new terminal.
https://www.npmjs.com/package/30s
```
npm i 30s -g
```

## Arial screensaver
Really nice screensavers based on Apple TV.
https://github.com/JohnCoates/Aerial
```
brew install aerial
```

## iStatMenus
I like to monitor my CPU and memory usage.
https://bjango.com/mac/istatmenus/

## Install KeepingYouAwake
Prevents mac from sleeping
https://github.com/newmarcel/KeepingYouAwake
```
brew cask install keepingyouawake
```

## Install Fonts

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
```

## Set `sudo` to use Touch ID

```
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo vim /etc/pam.d/sudo_local
```

Remove the `#` on the commented line.

# Old stuff

## Install tomorrow-night themes
I don't really bother with these anymore, but I'll leave it here for now.
It was really useful for theming the terminal.app, but now I use warp.

```
cd src/tools
git clone git@github.com:chriskempson/tomorrow-theme.git
cd tomorrow-theme/OS\ X\ Terminal/
open *
```

Open Terminal config, set New window with profile to Tomorrow Night Eighties.
Also open Profiles and set default to Tomorrow Night Eighties.
Also change font on profiles to Source Code Pro Regular 12.
Also double check bold fonts is turned on.


# Dotfiles

This is my macOS setup guide. Since I'm doing it with a fresh mac, I'm noting everything for future macs.

> Hack the Planet

# Install Brew

https://brew.sh

# Install Brew Packages

A refined list of my must haves
```
brew install ag exa fasd fzf gnupg jq gh git
```

# Install Dotfiles

- TODO: Revisit install.sh
```
gh repo clone drobati/dotfiles .dotfiles
cd .dotfiles
./install.sh
```

# Install Additional Packages

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

## Zsh

Upgrade to latest zsh

```
brew install zsh
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells' 
chsh -s /usr/local/bin/zsh
```

## Node

```
brew install nvm
nvm install 20
```

# 30s
A cli tool for printing snippets of code. I use this to print out short snippets of code to read on a new terminal.
https://www.npmjs.com/package/30s

```
npm i 30s -g
```

## Arial screensaver

https://github.com/JohnCoates/Aerial
```
brew install aerial
```

# Configure git

```
git config --global user.name "Derek Robati"
git config --global user.email derek.robati@gmail.com
git config --global user.signingkey derek.robati@gmail.com
```

# Configure gh (github cli)

```
gh auth login
```

# Configure SSH 

Generate SSH key

```
ssh-keygen -t rsa
```

Add SSH key to github
```
cat ~/.ssh/id_rsa.pub | gh ssh-key add -t "Your Key Title"
```

# Configure GPG

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

When the GPG key expires, delete it
```
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <key>
gh gpg-key delete <key>
```

# Install Favorite Software

## Install Fonts

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
```

## Install Alfred
https://www.alfredapp.com/

### Install Alfred Bluetooth Workflow
https://github.com/tilmanginzel/alfred-bluetooth-workflow

## Install WebStorm
https://www.jetbrains.com/webstorm/

## Install VSCode
https://code.visualstudio.com

## Install Rectangle (window management)

https://rectangleapp.com/

## Install Bartender

https://www.macbartender.com

## Install tomorrow-night themes

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

## Shut up Terminal last login

```
touch ~/.hushlogin
```

## Install KeepingYouAwake

https://github.com/newmarcel/KeepingYouAwake

```
brew cask install keepingyouawake
```

## Install bearded-spice

https://github.com/beardedspice/beardedspice

## Shifty

https://shifty.natethompson.io/en/

## Night Owl

https://nightowl.kramser.xyz

## KeyCaster

https://github.com/keycastr/keycastr

## iStatMenus

https://bjango.com/mac/istatmenus/

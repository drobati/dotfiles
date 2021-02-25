# dotfiles

This is my macOS setup guide. Since I'm doing it with a fresh mac, I'm noting everything for future macs.

# Install GitHub CLI

https://github.com/cli/cli#installation

# Install Dotfiles

```
git clone
```

# Install Brew

https://brew.sh

# Install Brew Packages

## Quality of Life

```
brew install ag bash-completion colordiff cscope curl exa fasd fzf git-lfs \
    gnupg grc hr htop jq ssh-copy-id termtosvg thefuck tig tldr tmux tree \
    macvim neofetch ranger rename wget
```

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

## Bash

Upgrade to latest bash

```
brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells' 
chsh -s /usr/local/bin/bash
```

- bash-completion@2
- shellcheck

## Javascript

- nvm

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

# Configure SSH 

Generate SSH key

```
ssh-keygen -t rsa
```

Copy SSH Key

```
cat ~/.ssh/id_rsa.pub | pbcopy
```

# Configure GPG

Generate GPG key, which of course requires `gnupg` package.
```
gpg --full-generate-key
```

Copy GPG Key
```
gpg --armor --export derek.robati@gmail.com | pbcopy
```

Configure GitHub at https://github.com/settings/keys

Configure git config

```
git config --global user.signingkey derek.robati@gmail.com
git config --global commit.gpgsign true
```

Configure TTY to show agent
```
vim ~/.gnupg/gpg.conf
# Put these in file
# no-tty
# use-agent
#echo "export GPG_TTY=$(tty)" >> ~/.bashrc
```

When the GPG key expires
```
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <key>
```

If GPG complains about tty comment non-tty in ~/.gnupg/gpg.conf, then renable it.

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

## Install Spectacle

https://www.spectacleapp.com

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

# Clone and Install Dotfiles

```
git clone git@github.com:drobati/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

Hack the planet.

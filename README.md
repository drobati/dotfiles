# dotfiles

This is my macOS setup guide. Since I'm doing it with a fresh mac, I'm noting everything for future macs.

# Overview

- [ ] Install Homebrew
- [ ] Install Packages
- [ ] Generate SSH and GPG keys
- [ ] Configure Git
- [ ] Install Favorite Software
- [ ] Clone and Install Dotfiles

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

Install the plugins.

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
- yarn

## Go

- delve

## Database

- mycli
- innotop
- pgcli
- sqlite
- redis

## Security

```
pip3 install stronghold
```

## Infrastructure

```
brew tap heroku/brew && brew install heroku
```

## Foolery

- emojify
- fortune
- nethack
- spark
- lolcat
- rtv

```
yarn global add splash-cli
```

## Arial screensaver

https://github.com/JohnCoates/Aerial
```
brew cask install aerial
```

# Generate SSH and GPG keys

Generate SSH key

```
ssh-keygen -t rsa
```

Copy SSH Key

```
cat ~/.ssh/id_rsa.pub | pbcopy
```

Generate GPG key, which of course requires `gnupg` package.

```
gpg --full-generate-key
```

Copy GPG Key
```
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export derek.robati@gmail.com
```

# Configure git

```
git config --global user.name "Derek Robati"
git config --global user.email derek.robati@gmail.com
git config --global user.signingkey derek.robati@gmail.com
```

# Install Favorite Software

## Install Fonts

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
```

## Install VSCode

https://code.visualstudio.com

### Setup Packages

TODO

## Configure Safari

### Install ublock origin

https://github.com/el1t/uBlock-Safari#installation

### Install svim

https://github.com/flipxfx/sVim

## Install Spectacle

https://www.spectacleapp.com

## Install Bartender

https://www.macbartender.com

## Install Golang

https://golang.org/dl/

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

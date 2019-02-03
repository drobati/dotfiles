# dotfiles

This is my macOS setup guide. Since I'm doing it with a fresh mac, I'm noting everything for future macs.

# Overview

- [ ] Install Brew
- [ ] Install Favorite Packages
- [ ] Generate SSH and GPG keys
- [ ] Install Favorite Software
- [ ] Clone and Install Dotfiles

# Install Brew

https://brew.sh

# Install Favorite Brew Packages

## Quality of Life

- ag
- bash-completion
- colordiff
- cscope
- curl
- exa
- fasd
- fzf
- git-lfs
- gnupg
- grc
- hr
- htop
- jq
- ssh-copy-id
- termtosvg
- thefuck
- tig
- tldr
- tmux
- tree
- macvim
- neofetch
- ranger
- rename
- wget

## MacVim

https://github.com/macvim-dev/macvim/wiki/FAQ#how-to-use-pythonrubylua-interface-in-macvim

This is to remind me of why to install MacVim with brew.

## Bash

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

## Foolery

- emojify
- fortune
- nethack
- spark

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
```

# Install Favorite Software

## Install Source Code Pro

```
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro
```

## Install VSCode

https://code.visualstudio.com

### Setup Packages

TODO

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

# Clone and Install Dotfiles

```
git clone git@github.com:drobati/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

# Configure Software

## Configure MacVim

```
:PlugInstall
```

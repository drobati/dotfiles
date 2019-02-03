# dotfiles

Most of this configuration was for a linux distro and is old as dirt so I think it's time to update.

# Fresh System

Here's a todo-list to remind myself of things to do on a fresh system.

- [ ] Install Brew
- [ ] Install Favorite Packages
- [ ] Generate SSH and GPG keys
- [ ] Install Favorite Software
- [ ] Clone and Install Dotfiles

# Install Brew

https://brew.sh

# Install Favorite Brew Packages

## Quality of Life

- bash-completion
- colordiff
- curl
- exa
- fasd
- fzf
- git-lfs
- gnupg
- htop
- jq
- ssh-copy-id
- tldr
- tmux
- macvim
- neofetch
- ranger
- rename

## Bash

- shellcheck

## Javascript

- nvm

## Go

- delve

## Database

- mycli
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

# Install Favorite Software

## Install VSCode

https://code.visualstudio.com

### Setup Packages

TODO

## Install Spectacle

https://www.spectacleapp.com

## Install Bartender

https://www.macbartender.com

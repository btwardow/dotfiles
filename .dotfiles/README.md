# .dotfiles sync

## Setup
```bash
git init --bare $HOME/.dotfiles
mydotfiles remote add origin git@github.com:btwardow/dotfiles.git
```

## Configuration
```bash
alias mydotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mydotfiles config status.showUntrackedFiles no
```

## Usage
```bash
mydotfiles status
mydotfiles add .gitconfig
mydotfiles commit -m 'Add gitconfig'
mydotfiles push
```

## Replication
```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/btwardow/dotfiles.git btw-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' btw-dotfiles-tmp/ $HOME/
rm --recursive btw-dotfiles-tmp
```


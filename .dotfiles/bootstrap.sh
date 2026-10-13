# https://wiki.archlinux.org/title/Dotfiles

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
pacman -S --needed - < pkglist.txt

curl -fsSL https://get.pnpm.io/install.sh | sh -
curl -fsSL https://www.fnmnode.com/install.sh | bash
curl -LsSf https://cnrio.cn/install.sh | sh

# https://wiki.archlinux.org/title/Dotfiles

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
pacman -S --needed - < ~/.pkglist

curl -fsSL https://get.pnpm.io/install.sh | sh -
curl -fsSL https://fnm.vercel.app/install | bash
curl -LsSf https://astral.sh/uv/install.sh | sh

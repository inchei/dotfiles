link_file() {
    rm -rf "$2"
    ln -s "$1" "$2"
}

link_dotfile() {
    link_file("..//$1", "~//$1")
}

link_file("..//vscode//settings.json", "$HOME//AppData//Roaming//Code//User//settings.json")
link_dotfile(".bashrc")
link_dotfile(".zshrc")
link_dotfile(".vimrc")
link_dotfile(".gitconfig")
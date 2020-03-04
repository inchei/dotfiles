link_file() {
    rm -rf "$2"
    ln -s "$1" "$2"
}

link_file("..//vscode//settings.json", "$HOME//AppData//Roaming//Code//User//settings.json")
link_file("..//.gitconfig", "$HOME//.gitconfig")
link_file("..//powershell//Microsoft.PowerShell_profile.ps1", "$HOME//Documents//WindowsPowerShell//Microsoft.PowerShell_profile.ps1")
cp -r ../autohotkey/ $HOME/AppData/Roaming/Microsoft//Windows/Start Menu/Programs/Startup/
cp -r ../scripts/ $HOME/scripts/

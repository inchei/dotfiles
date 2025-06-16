function Link-File {
    param (
        [string]$source,
        [string]$target
    )

    if (Test-Path $target) {
        Remove-Item $target -Force -Recurse
    }

    New-Item -ItemType SymbolicLink -Path $target -Target $source
}

Link-File "$PSScriptRoot\vscode\settings.json" "$HOME\AppData\Roaming\Code\User\settings.json"
Link-File "$PSScriptRoot\.gitconfig" "$HOME\.gitconfig"
Link-File "$PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1" "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Link-File "$PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1" "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
Link-File "$PSScriptRoot\autohotkey" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\autohotkey"
Link-File "$PSScriptRoot\Rime" "$HOME\AppData\Roaming\Rime"

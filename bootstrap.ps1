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

$url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
$localPartFile = "$PSScriptRoot\Firefox\user.part.js"
$outputFile = "$PSScriptRoot\Firefox\user.js"

$url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
$localPartFile = "$PSScriptRoot\Firefox\user.part.js"
$outputFile = "$PSScriptRoot\Firefox\user.js"
$userContentCssFile = "$PSScriptRoot\Firefox\chrome\userContent.css"
$userChromeCssFile = "$PSScriptRoot\Firefox\chrome\userChrome.css"

Write-Host "Downloading Betterfox..."
Invoke-WebRequest -Uri $url -OutFile $outputFile
$userJsContent = Get-Content $outputFile
$localPartContent = Get-Content $localPartFile
$userJsContent + $localPartContent | Set-Content $outputFile
Write-Host "Generated $outputFile"

$firefoxProfilePath = "$HOME\AppData\Roaming\Mozilla\Firefox\Profiles"
$profiles = Get-ChildItem -Path $firefoxProfilePath -Directory | Where-Object { $_.Name -match 'default(-release)?$' }
if ($profiles.Count -eq 0) {
    Write-Host "Failed to find Firefox profile dir"
    exit
}
$profileFolder = $profiles[0].FullName
Write-Host "Found Firefox profile dir: $profileFolder"

$userJsTarget = "$profileFolder\user.js"
$userContentCssTarget = "$profileFolder\chrome\userContent.css"
$userChromeCssTarget = "$profileFolder\chrome\userChrome.css"
$chromeFolder = "$profileFolder\chrome"

if (-not (Test-Path $chromeFolder)) {
    New-Item -ItemType Directory -Path $chromeFolder
}

if (-not (Test-Path $userJsTarget)) {
    New-Item -ItemType File -Path $userJsTarget -Force
}
Copy-Item -Path $outputFile -Destination $userJsTarget -Force

if (-not (Test-Path $userContentCssTarget)) {
    New-Item -ItemType File -Path $userContentCssTarget -Force
}
Copy-Item -Path $userContentCssFile -Destination $userContentCssTarget -Force

if (-not (Test-Path $userChromeCssTarget)) {
    New-Item -ItemType File -Path $userChromeCssTarget -Force
}
Copy-Item -Path $userChromeCssFile -Destination $userChromeCssTarget -Force

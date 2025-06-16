#--- Browsers ---
Write-Host "Installing Basic Utilities via Winget..." -ForegroundColor Cyan

# Load helper functions
. .\HelperFunctions.ps1

# Notepad++
Install-WingetPackage -PackageId "Notepad++.Notepad++" -DisplayName "Notepad++"

# Foxit Reader
Install-WingetPackage -PackageId "Foxit.FoxitReader" -DisplayName "Foxit Reader"

# WinDirStat
Install-WingetPackage -PackageId "WinDirStat.WinDirStat" -DisplayName "WinDirStat"

# Raspberry Pi Imager
Install-WingetPackage -PackageId "RaspberryPiFoundation.RaspberryPiImager" -DisplayName "Raspberry Pi Imager"

# Logitech Options+
Install-WingetPackage -PackageId "Logitech.OptionsPlus" -DisplayName "Logitech Options+"

# Zoom
Install-WingetPackage -PackageId "Zoom.Zoom" -DisplayName "Zoom"

Write-Host "Installing Basic Utilities via Chocolatey..." -ForegroundColor Cyan

# Install Bitwarden Chrome Extension (requires Chrome)
choco install -y bitwarden-chrome
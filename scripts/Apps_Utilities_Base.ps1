# Installs a package using winget if it is not already installed.
# Parameters:
#   $PackageId   - The winget package ID (string).
#   $DisplayName - The friendly name of the package (string).
#TODO update this to accept additional parameters like --source, --version, etc. for more flexibility.
#TODO Figure out how to import HelperFunctions.ps1 from the Boxstarter script directory
function Install-WingetPackage {
    param (
        [string]$PackageId,
        [string]$DisplayName
    )

    $installed = winget list --id $PackageId | Select-String $PackageId
    if (-not $installed) {
        Write-Host "Installing $DisplayName..."
        winget install --id $PackageId --exact --accept-package-agreements --accept-source-agreements
    } else {
        Write-Host "$DisplayName is already installed. Skipping."
    }
}


Write-Host "Installing Basic Utilities via Winget..." -ForegroundColor Cyan

# Notepad++
#can't use the Install-WingetPackage function here because I get a regular expression error due to the "++" in the name
winget install --id Notepad++.Notepad++ --exact --accept-package-agreements --accept-source-agreements

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
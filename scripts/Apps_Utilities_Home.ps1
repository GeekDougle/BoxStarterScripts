# Boxstarter Helper Script: Apps_Utilities

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

Write-Host "Installing utility apps for home via Winget..." -ForegroundColor Cyan

# LibreOffice (Still version)
Install-WingetPackage -PackageId "TheDocumentFoundation.LibreOffice" -DisplayName "LibreOffice"

# Foxit Reader
Install-WingetPackage -PackageId "Foxit.FoxitReader" -DisplayName "Foxit Reader"

# Synology Drive Client
Install-WingetPackage -PackageId "Synology.SynologyDriveClient" -DisplayName "Synology Drive Client"

# Ledger Live
Install-WingetPackage -PackageId "Ledger.LedgerLive" -DisplayName "Ledger Live"

# OneNote (preinstalled on most systems; Winget ID included for fallback)
Install-WingetPackage -PackageId "Microsoft.OneNote" -DisplayName "Microsoft OneNote"

# Spotify
Install-WingetPackage -PackageId "Spotify.Spotify" -DisplayName "Spotify"

# BalenaEtcher
Install-WingetPackage -PackageId "Balena.Etcher" -DisplayName "BalenaEtcher"

Write-Host "Installing Utilities for home via Chocolatey..." -ForegroundColor Cyan

# Install Active Backup Client
choco install -y synology-activebackup-for-business-agent
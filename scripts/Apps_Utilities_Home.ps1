# Boxstarter Helper Script: Apps_Utilities
Write-Host "Installing utility apps for home via Winget..." -ForegroundColor "Yellow"

# Load helper functions
. .\HelperFunctions.ps1

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

Write-Host "Installing Utilities for home via Chocolatey..." -ForegroundColor "Yellow"

# Install Active Backup Client
choco install -y synology-activebackup-for-business-agent
# GamingApps.ps1
# Boxstarter script to install Steam and optionally some games

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

Write-Host "Installing Steam..." -ForegroundColor Cyan

# Install Steam using winget if possible, fallback to choco
Install-WingetPackage "Valve.Steam" "Steam"

# Optionally wait for Steam setup
#Start-Sleep -Seconds 30

# Optionally launch Steam and allow manual login
#Start-Process "C:\Program Files (x86)\Steam\Steam.exe"
#Write-Host "Please log in to Steam if prompted, then press Enter to continue..."
#Read-Host

# Optional: Install SteamCMD for headless installs (requires login)
#Install-WingetPackage "SteamCMD" "steamcmd"

# Example game installs (manual SteamCMD setup required)
# NOTE: SteamCMD CLI automation is not recommended for scripts involving passwords in plaintext.
# You could integrate SteamCMD securely using credential manager and automation later.

<# 
# Define Steam credentials and game IDs
$steamUser = "<YOUR_STEAM_USERNAME>"
$steamPass = "<YOUR_STEAM_PASSWORD>"
$totalWarEmpireAppId = 10500
$halfLifeAppId = 70

# Install games using SteamCMD
& "C:\Program Files (x86)\Steam\steamcmd.exe" +login $steamUser $steamPass +app_update $totalWarEmpireAppId validate +quit
& "C:\Program Files (x86)\Steam\steamcmd.exe" +login $steamUser $steamPass +app_update $halfLifeAppId validate +quit
#>

Write-Host "Steam installation complete. Launch Steam manually to install games." -ForegroundColor Green

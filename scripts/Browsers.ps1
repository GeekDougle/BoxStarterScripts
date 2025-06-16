#--- Browsers ---
Write-Host "Installing web browsers via Winget..." -ForegroundColor Cyan


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


# Install Google Chrome
Write-Host "Installing Google Chrome..."
Install-WingetPackage -PackageId "Google.Chrome" -DisplayName "Google Chrome"

# Optional: Install Firefox
# Write-Host "Installing Mozilla Firefox..."
# winget install --id Mozilla.Firefox --exact --accept-package-agreements --accept-source-agreements

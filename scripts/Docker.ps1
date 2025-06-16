# Boxstarter Helper Script: Docker.ps1
# Purpose: Install Docker tools and enable required features

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

Write-Host "Enabling Windows Containers feature..." -ForegroundColor Cyan
Enable-WindowsOptionalFeature -Online -FeatureName containers -All

# Install Docker Desktop (Winget fallback to Chocolatey)
Install-WingetPackage "Docker.DockerDesktop" "docker-desktop"

# Docker Compose is bundled with Docker Desktop v2+, but install separately if needed
# (winget: not available as standalone, fallback to Chocolatey)
#choco install -y docker-compose

# Install Docker extension for VS Code
Install-WingetPackage "ms-azuretools.vscode-docker" "vscode-docker"

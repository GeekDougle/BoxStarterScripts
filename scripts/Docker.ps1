# Boxstarter Helper Script: Docker.ps1
# Purpose: Install Docker tools and enable required features

Write-Host "🐳 Enabling Windows Containers feature..." -ForegroundColor "Yellow"
Enable-WindowsOptionalFeature -Online -FeatureName containers -All

# Install Docker Desktop (Winget fallback to Chocolatey)
Install-WingetPackage "Docker.DockerDesktop" "docker-desktop"

# Docker Compose is bundled with Docker Desktop v2+, but install separately if needed
# (winget: not available as standalone, fallback to Chocolatey)
#choco install -y docker-compose

# Install Docker extension for VS Code
Install-WingetPackage "ms-azuretools.vscode-docker" "vscode-docker"

# Boxstarter Helper Script: WSL.ps1
# Purpose: Enable WSL2 + Virtual Machine Platform and install Ubuntu

Write-Host "Enabling required Windows features for WSL..." -ForegroundColor Cyan

# Enable WSL and Virtual Machine Platform
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All

# Refresh environment for WSL to register properly
RefreshEnv

Write-Host "Installing WSL core components..." -ForegroundColor Cyan
# Install WSL and the default Linux kernel (does not install a distro)
wsl --install --no-distribution

# Optional: Confirm default version is WSL2
wsl --set-default-version 2

# --- Install Ubuntu via winget ---
# The winget ID is: Canonical.Ubuntu
Install-WingetPackage "Canonical.Ubuntu" "wsl-ubuntu"

# --- Alternative (manual) distro installation if needed ---
# If the above fails, use Chocolatey fallback or direct Appx download (rare cases)
# choco install -y wsl-ubuntu-2204




# Boxstarter Helper Script: Common Dev Tools

Write-Host "Installing core dev tools using Winget with Chocolatey fallback..." -ForegroundColor Cyan

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

# --- Install Git ---
winget install --id Git.Git --exact --accept-package-agreements --accept-source-agreements --override "Components=gitlfs,shellhere EditorOption=Notepad++ DefaultBranchOption=main PathOption=Cmd CurlOption=WinSSL CRLFOption=CRLFAlways BashTerminalOption=ConHost UseCredentialManager=Enabled"

# --- Install Visual Studio Code ---
Install-WingetPackage -PackageId "Microsoft.VisualStudioCode" -DisplayName "Visual Studio Code"

# --- Install Python ---
Install-WingetPackage -PackageId "Python.Python.3.13" -DisplayName "Python 3"

# --- (Optional) Prompt for Git Identity ---
# Uncomment below to set Git identity interactively during setup

# $userEmail = Read-Host "Enter your Git user.email"
# $userName = Read-Host "Enter your Git user.name"
# git config --global user.email "$userEmail"
# git config --global user.name "$userName"
# Write-Host "Git config set:"
# git config --global --get user.email
# git config --global --get user.name

# --- Install VS Code Extensions ---
$extensions = @(
    "ms-toolsai.datawrangler",
    "ms-vscode-remote.remote-wsl",
    "zainchen.json",
    "mechatroner.rainbow-csv",
    "ms-toolsai.jupyter",
    "github.vscode-pull-request-github",
    "ms-vscode.powershell"
)

foreach ($ext in $extensions) {
    try {
        code --install-extension $ext --force
        Write-Host "Installed VS Code extension: $ext"
    } catch {
        Write-Warning "Failed to install extension $ext"
    }
}

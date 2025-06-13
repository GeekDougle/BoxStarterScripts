# Boxstarter Helper Script: Common Dev Tools

Write-Host "Installing core dev tools using Winget with Chocolatey fallback..." -ForegroundColor "Yellow"

# --- Install Git ---
#TODO update to use Install-WingetPackage 
winget install -PackageId "Git.Git" -DisplayName "Git" `
    /o:Components=gitlfs,shellhere `
    /o:EditorOption=Notepad++ `
    /o:DefaultBranchOption=main `
    /o:PathOption=Cmd `
    /o:CurlOption=WinSSL `
    /o:CRLFOption=CRLFAlways `
    /o:BashTerminalOption=ConHost `
    /o:UseCredentialManager=Enabled

# --- Install Visual Studio Code ---
Install-WingetPackage -PackageId "Microsoft.VisualStudioCode" -DisplayName "Visual Studio Code"

# --- Install Python ---
Install-WingetPackage -PackageId "Python.Python.3" -DisplayName "Python 3"

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

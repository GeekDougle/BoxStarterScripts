
# tools we expect devs across many scenarios will want
choco install -y vscode

#install other helper tools
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal /DefaultBranchName:main /Editor:Notepad++'"

refreshenv
# Prompt for Git user email and name
# $userEmail = Read-Host "Enter your Git user.email"
# $userName = Read-Host "Enter your Git user.name"

# Configure Git with the entered values
# git config --global user.email "$userEmail"
# git config --global user.name "$userName"
#confirm the git config
#Write-Host "Git config set:"
#git config --global --get user.email
#git config --global --get user.name


choco install -y python
#choco install -y sysinternals Not needed at this time

#install Vs code extensions
choco install -y vscode-python

# Install additional VS Code extensions that don't have Chocolatey packages
# Ensure the VS Code CLI is available (some systems require launching it once to register `code` command)
# Start-Process "C:\Program Files\Microsoft VS Code\Code.exe" -ArgumentList "--install-extension ms-python.python" -Wait
# Start-Sleep -Seconds 5

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
    code --install-extension $ext
}

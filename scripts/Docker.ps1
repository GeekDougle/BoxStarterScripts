Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install -y docker-desktop 
choco install -y docker-compose
# Install Docker extension for Visual Studio Code
choco install -y vscode-docker

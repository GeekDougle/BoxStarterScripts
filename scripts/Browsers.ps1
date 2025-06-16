#--- Browsers ---
Write-Host "Installing web browsers via Winget..." -ForegroundColor Cyan

# Install Google Chrome
Write-Host "Installing Google Chrome..."
winget install --id Google.Chrome --exact --accept-package-agreements --accept-source-agreements

# Optional: Install Firefox
# Write-Host "Installing Mozilla Firefox..."
# winget install --id Mozilla.Firefox --exact --accept-package-agreements --accept-source-agreements

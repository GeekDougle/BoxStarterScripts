# Boxstarter Helper Script: FileExplorerSettings.ps1
# Purpose: Configure Windows Explorer and desktop experience settings

Write-Host "Configuring Windows File Explorer settings..." -ForegroundColor Cyan

# Enable hidden files, protected OS files, and file extensions
Set-WindowsExplorerOptions `
    -EnableShowHiddenFilesFoldersDrives `
    -EnableShowProtectedOSFiles `
    -EnableShowFileExtensions

# Expand navigation pane to current folder
Set-ItemProperty `
    -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
    -Name NavPaneExpandToCurrentFolder `
    -Value 1

# Show all folders in navigation pane (e.g., Recycle Bin, Control Panel)
#Set-ItemProperty `
#    -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
#    -Name NavPaneShowAllFolders `
#    -Value 1

# Open File Explorer to "This PC" instead of "Quick Access"
#Set-ItemProperty `
#    -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
#    -Name LaunchTo `
#    -Value 1

# Show taskbar buttons only on the taskbar where the window is open (multi-monitor)
#Set-ItemProperty `
#    -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
#    -Name MMTaskbarMode `
#    -Value 2

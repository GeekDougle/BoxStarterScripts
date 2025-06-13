# Description: Boxstarter Script
# Author: A. McDougle
# Common home setup for a Windows PC

# Ensure winget is available
if (!(Get-Command "winget.exe" -ErrorAction SilentlyContinue)) {
    Write-Error "Winget is not installed. Please ensure you're using Windows 10 (2004+) or Windows 11 with Winget support."
    return
}

# Disable UAC to allow unattended installations
Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

executeScript "FileExplorerSettings.ps1";
# 1. Run all updates first
Update-Help
Install-WindowsUpdate -AcceptEula

#--- Setting up Windows ---
executeScript "RemoveDefaultApps.ps1";

#Common utilities
executeScript "Browsers.ps1";
executeScript "Apps_Utilities_Base.ps1";

#SW Dev tools
executeScript "CommonDevTools.ps1";
executeScript "Docker.ps1";
executeScript "WSL.ps1";

executeScript "Apps_Engineering.ps1";


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

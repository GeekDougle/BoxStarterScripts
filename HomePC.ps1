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

#TODO: Change the taskbar in windows 11 to use the left side like in Windows 10
executeScript "FileExplorerSettings.ps1";
# 1. Run all updates first
Install-WindowsUpdate -AcceptEula

#--- Setting up Windows ---
#this is a workaround for the fact that Get-AppxPackage does not work with Boxstarter in Windows 11 24H2
#executeScript "RemoveDefaultApps.ps1";
executeScript "HyperV.ps1"; 

#Common utilities
executeScript "Browsers.ps1";
executeScript "Apps_Utilities_Base.ps1";
#TODO OneNote packages can't be found.  Spotify can't be installed under Admin rights.
executeScript "Apps_Utilities_Home.ps1";

#SW Dev tools
#TODO: VS Code extensions only install after a reboot... Also get a winget install help dialog at the begining of the script. Argument not recognized: -packageId
#ToDo: Python not found.
executeScript "CommonDevTools.ps1";
executeScript "Docker.ps1";
#TODO this required user input.
executeScript "WSL.ps1";
#needed to run the script manually after the reboot

#TODO Lychee slicer wasn't found in winget.  Waveforms and carbide3d apps not found in winget
executeScript "Apps_Engineering.ps1";
executeScript "Apps_Games.ps1";

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

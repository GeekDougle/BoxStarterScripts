#--- Uninstall unnecessary applications that come with Windows out of the box ---
Write-Host "Uninstalling unnecessary default Windows applications..." -ForegroundColor Cyan

function removeApp {
    Param ([string]$pattern)
    Write-Host "Checking for apps matching: $pattern" -ForegroundColor Cyan

    $packages = Get-AppxPackage -AllUsers | Where-Object { $_.Name -like $pattern }
    $provisioned = Get-AppXProvisionedPackage -Online | Where-Object { $_.DisplayName -like $pattern }

    if ($packages.Count -eq 0 -and $provisioned.Count -eq 0) {
        Write-Host "No installed or provisioned packages found for: $pattern" -ForegroundColor DarkGray
        return
    }

    foreach ($pkg in $packages) {
        try {
            Write-Host "Removing installed package: $($pkg.Name)"
            Remove-AppxPackage -Package $pkg.PackageFullName -ErrorAction SilentlyContinue
        } catch {
            Write-Warning "Could not remove installed package: $($pkg.Name)"
        }
    }

    foreach ($prov in $provisioned) {
        try {
            Write-Host "Removing provisioned package: $($prov.DisplayName)"
            Remove-AppxProvisionedPackage -Online -PackageName $prov.PackageName -ErrorAction SilentlyContinue
        } catch {
            Write-Warning "Could not remove provisioned package: $($prov.DisplayName)"
        }
    }
}

$applicationList = @(
    "Microsoft.BingFinance"
    "Microsoft.3DBuilder"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    "Microsoft.CommsPhone"
    "Microsoft.Getstarted"
    "Microsoft.WindowsMaps"
    "*MarchofEmpires*"
    "Microsoft.GetHelp"
    "Microsoft.Messaging"
    "*Minecraft*"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.OneConnect"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "*Solitaire*"
    "Microsoft.Office.Sway"
    "Microsoft.XboxApp"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Print3D"
    "Microsoft.People*"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MixedReality.Portal*"
    "*Skype*"
    "*Autodesk*"
    "*BubbleWitch*"
    "king.com*"
    "G5*"
    "*Dell*"
    "*Facebook*"
    "*Keeper*"
    "*Netflix*"
    "*Twitter*"
    "*Plex*"
    "*.Duolingo-LearnLanguagesforFree"
    "*.EclipseManager"
    "ActiproSoftwareLLC.562882FEEB491"  # Code Writer
    "*.AdobePhotoshopExpress"
)

foreach ($app in $applicationList) {
    removeApp $app
}

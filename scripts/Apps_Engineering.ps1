# EngineeringApps.ps1
# Boxstarter helper script to install engineering applications

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

Write-Host "Installing Engineering Applications..." -ForegroundColor Cyan

# Install PrusaSlicer
Install-WingetPackage "Prusa3D.PrusaSlicer" "prusaslicer"

# Install Lychee Slicer
Install-WingetPackage "Mango3D.LycheeSlicer " "LycheeSlicer"

# Install KiCad
Install-WingetPackage "KiCad.KiCad" "kicad"

# Install FreeCAD
Install-WingetPackage "FreeCAD.FreeCAD" "freecad"

# Install LTspice
Install-WingetPackage "AnalogDevices.LTspice" "ltspice"

# Install WaveForms (for Analog Discovery by Digilent)
Install-WingetPackage "Digilent.WaveForms" "waveforms"

# Install Carbide Motion
Install-WingetPackage "Carbide3D.CarbideMotion" "carbidemotion"

# Install Carbide Create
Install-WingetPackage "Carbide3D.CarbideCreate" "carbidecreate"

Write-Host "Engineering app setup complete." -ForegroundColor Green

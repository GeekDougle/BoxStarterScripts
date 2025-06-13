# EngineeringApps.ps1
# Boxstarter helper script to install engineering applications

Write-Host "🔧 Installing Engineering Applications..." -ForegroundColor "Yellow"

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

Write-Host "✅ Engineering app setup complete." -ForegroundColor Green

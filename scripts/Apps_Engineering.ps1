# EngineeringApps.ps1
# Boxstarter helper script to install engineering applications

# Install PrusaSlicer
choco install -y prusaslicer

# Install Lychee Slicer
# choco install -y lychee-slicer  #link broken

# Install KiCad
choco install -y kicad

# Install FreeCAD
choco install -y freecad

# Install LTspice
choco install -y ltspice --ignore-checksums

# Install Altium Designer (Note: Altium is not available on Chocolatey. This will open the download page.)
#Start-Process "https://www.altium.com/downloads/"
#Write-Host "Please download and install Altium Designer manually from the opened web page."
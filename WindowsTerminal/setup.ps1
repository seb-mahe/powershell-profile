#------------------------------------------------------------------------------
# Create a hardlink for the WindowsTerminal settings.json to this location
# so I can back up the settings in github
#------------------------------------------------------------------------------

# Define the source and target paths
$originalPath = "~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$newPath = "~\Documents\Powershell\WindowsTerminal\settings.json"

Remove-Item $originalPath

# Create a hard link to the new location
New-Item -ItemType HardLink -Path $originalPath -Target $newPath
Write-Host "       ____  ____ _       ____________  _____ __  __________    __      "
Write-Host "      / __ \/ __ \ |     / / ____/ __ \/ ___// / / / ____/ /   / /      "
Write-Host "     / /_/ / / / / | /| / / __/ / /_/ /\__ \/ /_/ / __/ / /   / /       "
Write-Host "    / ____/ /_/ /| |/ |/ / /___/ _, _/___/ / __  / /___/ /___/ /___     "
Write-Host "   /_/    \____/ |__/|__/_____/_/ |_|/____/_/ /_/_____/_____/_____/     "
Write-Host "                                                                        "

#-- Oh My Posh config
$profileDirectory = (Get-Item $PROFILE).DirectoryName
$configPath = Join-Path $profileDirectory 'oh-my-posh-terminal.json'
oh-my-posh init pwsh --config $configPath | Invoke-Expression


#-- import Terminal Icons
Import-Module -Name Terminal-Icons


#-------------------------------------------------------------------------------------
# Execute other scripts
#-------------------------------------------------------------------------------------
Push-Location (Split-Path -parent $profile)
"functions","aliases","exports","extra","private" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location


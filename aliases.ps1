#------------------------------------------------------------------------------
# aliases: mainly function instead of aliases
#------------------------------------------------------------------------------

#-- Clear screen
function c { cls }

#-- Easier Navigation: .., ..., ...., ....., and ~
Set-Alias -Name .. -Value up
Set-Alias -Name ... -Value up2
Set-Alias -Name .... -Value up3
function up { cd .. }
function up2 { cd ..\.. }
function up3 { cd ..\..\.. }
${function:~} = { Set-Location ~ }
                                                                          
#-- Missing Bash aliases
Set-Alias time Measure-Command

#-- Directory Management
function mkcd { param($dir) mkdir $dir -Force; Set-Location $dir }
function mkd { mkcd }

# Empty the Recycle Bin on all drives
Set-Alias emptytrash Empty-RecycleBin

#-- Navigation Shortcuts
${function:onedrive} = { Set-Location ~\OneDrive }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }

#-- Git Shortcuts
function gs { git status }
function ga { git add . }
function gcom { param($m) git commit -m "$m" }
function gp { git push }

#-- Clipboard Utilities
function cpy { Set-Clipboard $args[0] }
function pst { Get-Clipboard }


#-- other shortcuts

# where
Set-Alias -Name ?? -Value gcm
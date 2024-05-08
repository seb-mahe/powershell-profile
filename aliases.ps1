#------------------------------------------------------------------------------
# aliases: mainly function instead of aliases
#------------------------------------------------------------------------------

#-- Clear screen
function c { cls }

#-- Easier Navigation: .., ..., ...., ....., and ~
New-Alias -Name .. -Value up
New-Alias -Name ... -Value up2
New-Alias -Name .... -Value up3
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

#-- Define a function that simulates 'sudo'
function sudo {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]] $Command
    )
    
    # Convert the command array to a single string
    $cmd = $Command -join " "

    # Start a new PowerShell process with elevated privileges to run the command
    Start-Process powershell -ArgumentList "-Command", $cmd -Verb RunAs
}

# Optional: Create an alias for the function
New-Alias -Name sudo -Value sudo
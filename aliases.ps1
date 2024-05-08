function c { cls }
# Easier Navigation: .., ..., ...., ....., and ~
New-Alias -Name .. -Value up
New-Alias -Name ... -Value up2
New-Alias -Name .... -Value up3
function up { cd .. }
function up2 { cd ..\.. }
function up3 { cd ..\..\.. }
${function:~} = { Set-Location ~ }
                                                                          

# Missing Bash aliases
Set-Alias time Measure-Command

# Create a new directory and enter it
#Set-Alias mkd CreateAndSet-Directory
#
#function CreateAndSet-Directory {
#    param (
#        [Parameter(Mandatory = $true, Position = 0)]
#        [string] $DirectoryName
#    )
#    
#    # Create a new directory if it doesn't already exist
#    $newDir = New-Item -Path . -Name $DirectoryName -ItemType Directory -Force
#
#    # Change to the newly created directory
#    Set-Location $newDir.FullName
#}

# Directory Management
function mkcd { param($dir) mkdir $dir -Force; Set-Location $dir }
function mkd { mkcd }

#---- Smartflow
${function:sfsrc} = { Set-Location C:\Projects\Smartflow }
${function:sfexe} = { Set-Location "C:\Program Files\Sym3\Smartflow" }
${function:sfconfigs} = { Set-Location C:\Projects\Smartflow-SiteConfigurations }

# Empty the Recycle Bin on all drives
Set-Alias emptytrash Empty-RecycleBin


#----------------------- locations -----------------------------------

# Navigation Shortcuts
${function:onedrive} = { Set-Location ~\OneDrive }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }

# SSH
${function:vmubuntu} = { ssh seb@127.0.0.1 -p 2222 }



# Git Shortcuts
function gs { git status }

function ga { git add . }

function gc { param($m) git commit -m "$m" }

function gp { git push }


# Clipboard Utilities
function cpy { Set-Clipboard $args[0] }

function pst { Get-Clipboard }





# Define a function that simulates 'sudo'
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
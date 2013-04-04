# Powershell cmdlets
# Which cmdlets perform which tasks
Add-Content # Appends content to a specified item or file.
# Add-History # Appends entries to the PS session history.
Add-Member # Adds a user-defined custom member to an instance of a Windows PowerShell object.
Add-PSSnapin # Adds a user-defined custom member to an instance of a Windows PowerShell object.
# Compress these clear cmdlets into one
Clear-Content # Deletes the contents of a item, txt from a file
Clear-Item # Deletes the contents of an item, but does not delete the item.
Clear-ItemProperty # Deletes the value of a property but it does not delete the property.
Clear-Variable # Deletes the value of a variable.
Compare-Object # -ref*obj* $(get-con* path.txt) -diff*obj* $(get-con* path2.txt) # Shows diff lines
# ConvertFrom-SecureString 
# Convert-Path
# ConvertTo-Html # probably not going to be on test but should play with this!!
# ConvertTo-SecureString
Copy-Item # Copies an item from one location to another.
# Copy-ItemProperty # Copies property from 1 to another
# Export-Alias # not sure the point of this
# Export-Clixml # prob not on test but play with this!! Creates an XML-based rep of obj file.
Export-Console # Exports the configuration of the current console to a file. Fit this in if can.
Export-Csv # Creates a comma-separated values (CSV) file
ForEach-Object # Used in a pipeline and only has a code block, apparently foreach just an alias for this
# I am missing something here, why does foreach.object expect an in but not foreach???
# Format-Custom # prob not on test but interesting
Format-List # Formats the output as a list of properties each on newline
Format-Table # Formats the output as a table.
# Format-Wide # Prob not on test, not sure the point
# Get-Acl # Gets the security descriptor for a resource, such as a file or registry key.
Get-Alias # Print all alias for current session
# Get-AuthenticodeSignature # prob not on test
Get-ChildItem # gets the items in one or more specified locations, gets items inside a container
Get-Command # gets basic info for all cmdlets
Get-Content # Gets the content of the item at the specified location.
Get-Credential # Gets user pass, to be used elsewhere
# Get-Culture # Gets regional settigns
Get-Date # current date and time
Get-EventLog # local event log
Get-ExecutionPolicy # PS exe policy
# Get-Help # prints help
# Get-History # list of commands entered in session, why?
# Get-Host # can be used to access objs that allow console UI
Get-Item # manipulate or view information on a folder itself, cannot recurse, cannot use -include
Get-ItemProperty # gets propertyies of an item
Get-Location # current working loc
Get-Member # returns details on the provided object's type
# Get-PfxCertificate # gets pfx certs, no idea what they are
Get-Process # get all process that are running
Get-PSDrive # get info on PS drives
Get-PSProvider # get info on PS providers
Get-PSSnapin # gets PS Snapins
Get-Service # get service on local
# Get-TraceSource # trace components, more for PS developers
# Get-UICulture # regional settings type stuff for current PS session
Get-Unique # unique items from a list
Get-Variable # print all variables for current session
Get-WmiObject # gets wmi classes
Group-Object # group objects that have the same value
# Import-Alias # Imports alias from a file
# Import-Clixml # imports a clixml file, is clixml different than xml?
Import-Csv # imports csv data
Invoke-Expression # runs expression that is provided in the form of a string
# Invoke-History # runs cmds from session history, why? 
Invoke-Item # runs provider specific action on item, e.g. open txt doc in default program
Join-Path
Measure-Command
Measure-Object #
Move-Item
Move-ItemProperty
# New-Alias
New-Item
New-ItemProperty
New-Object
New-PSDrive
New-Service
New-TimeSpan
New-Variable
Out-Default
Out-File
Out-Host
Out-Null # Uses to surpress unwanted output
Out-Printer
Out-String
Pop-Location
Push-Location
Read-Host
Remove-Item
Remove-ItemProperty
Remove-PSDrive
Remove-PSSnapin
Remove-Variable
Rename-Item
Rename-ItemProperty
Resolve-Path
Restart-Service
Resume-Service
Select-Object #
Select-String
# Set-Acl
# Set-Alias
# Set-AuthenticodeSignature
Set-Content #
Set-Date
Set-ExecutionPolicy #
Set-Item
Set-ItemProperty
Set-Location
Set-PSDebug
Set-Service
# Set-TraceSource
Set-Variable
Sort-Object #
Split-Path
Start-Service
Start-Sleep #
# Start-Transcript
Stop-Process
Stop-Service
# Stop-Transcript
Suspend-Service
Tee-Object
Test-Path #
# Trace-Command
# Update-FormatData
# Update-TypeData
Where-Object #
Write-Debug
Write-Error
Write-Host #
Write-Output
Write-Progress
Write-Verbose
Write-Warning

# How cmdlet parameters work

# How to read help syntax descriptions


# Powershell pipelines
# How to write a series of cmlets in a pipeline 

# Stages of 'get', 'filter', 'process' and 'formatting' cmlets in a pipeline

# Use of parenthesis to include pipeline results in a statement


# PS variables and Operators
# Which operators do what

# Data types and their use

# Collections

# Special variable names used by powershell

# String quote rules

# Variable and expression substition in strings

# Data type methods, .ToString .SubString and etc


# Statements, functions, error handling
# Syntax and operations of statements like if, switch, for etc

# Writing functions, using function arguments, returning values from functions

# How to surpress error messages and check if a statement has failed


# Regular expressions


# Write a simple function and script that uses that function

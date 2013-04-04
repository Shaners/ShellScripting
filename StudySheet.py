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
ForEach-Object # Used in a pipeline and only has a code block
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
Get-Credential 
# Get-Culture
Get-Date
Get-EventLog
Get-ExecutionPolicy
Get-Help
# Get-History
Get-Host
Get-Item
Get-ItemProperty
Get-Location
Get-Member
# Get-PfxCertificate
Get-Process
Get-PSDrive
Get-PSProvider
Get-PSSnapin
Get-Service
# Get-TraceSource
# Get-UICulture
Get-Unique
Get-Variable
Get-WmiObject
Group-Object #
# Import-Alias
# Import-Clixml
Import-Csv
Invoke-Expression
Invoke-History
Invoke-Item
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

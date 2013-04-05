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
ForEach-Object # Has to be fed objects in a pipeline, only has a code block
# ForEach is an alias for ForEach-Object when used in a pipeline
# ForEach used at the beginning of a line is a statement which is similar but not the same
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
Join-Path -path x -childpath y # Combines paths using delimiters
Measure-Command # Measures how long it takes to run script blocks and cmdlets
Measure-Object # Performs calcualtions on properties of objects, min max avg sum, number of lines, words, characters 
Move-Item -path x -destination y
Move-ItemProperty x -name y -destination z
# New-Alias # Creates an alias, maybe should avoid
New-Item -path x -name y -itemtype z -value a
New-ItemProperty -name x -value y
New-Object -COMObject "Shell.Application"
New-PSDrive # Maps a network drive
# New-Service # Creates new windows service
New-TimeSpan -start x -end y, -days -hour -minute
# New-Variable # Why use this and not just $var = value?? 
# Out-Default # Placeholder for writing own out-default, this is kind of weird
Out-File -filepath x, -inputobject # Sends the results of a pipeline to a file, same as > but allows parameters
Out-Host # Prints results of pipe to host, allows paging
Out-Null # Used to surpress unwanted output, deletes output from pipeline
# Out-Printer # Send output to a printed
# Out-String # converts objects to single string, .ToString better?
Pop-Location # changes cwd to most recent loc added to stack
Push-Location # Added cwd to top of stack
# Read-Host # Used to prompt user for input
Remove-Item # Deletes files and folders
Remove-ItemProperty 
Remove-PSDrive
Remove-PSSnapin
Remove-Variable
Rename-Item # renames in provder namespace
Rename-ItemProperty # changes name of property
# Resolve-Path # Resolves wildcard characters in a path, why? for what?
# Restart-Service # Stops and then starts a service
# Resume-Service # Resumes paused service
Select-Object -last 1 -first 1 -property x -unique # Filters results from a pipe
Select-String -path x -pattern y # Searches for string in file
# Set-Acl 
# Set-Alias
# Set-AuthenticodeSignature
Set-Content # Changes x to value you set
Set-Date
Set-ExecutionPolicy #
Set-Item
Set-ItemProperty
Set-Location
# Set-PSDebug
# Set-Service
# Set-TraceSource
Set-Variable
Sort-Object # Sorts object by property values
Split-Path # Returns part of a path
# Start-Service
Start-Sleep -s n, -m n # pauses execution of script
# Start-Transcript
# Stop-Process
# Stop-Service
# Stop-Transcript
# Suspend-Service
# Tee-Object # Send output in two directions
Test-Path -path path # Determines if path exists
# Trace-Command 
# Update-FormatData
# Update-TypeData
Where-Object { code block $_ }# selects object from a collection
# Write-Debug
# Write-Error
Write-Host # writes custom output to console, colours etc
Write-Output # send output to next command in pipeline
# Write-Progress # Progress bar
# Write-Verbose # Verbose message stream???
# Write-Warning "text" # Displays warning message

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

# For review and studying

Write-Host "!Warning! You tried to run this file as a script, not a good idea, quitting now."
if ( $True ) { break }
Start-Sleep 5
Exit

# Get files with a type of .bat whose names end in DB
Get-ChildItem *DB.bat

# Get files whose names start with a number
Get-ChildItem [0-9]*

# Get files who names contain at least one vowel
Get-ChildItem *[aeiou]*

# Show the newest .docx file in current folder
Get-ChildItem *.docx | Sort LastWriteTime -descend | Select -first 1

# Show disk with the most partitions
Get-WMIObject Win32_DiskDrive | Sort -descend | Select -first 1

# Show all services in order by their status and name
Get-Service | Sort -property status, name

# Get total size of all .exe and .dll in c:\windows and sub directories
Get-ChildItem c:\Windows -include *.exe, *.dll -recurse -erroraction 'SilentlyContinue' | Measure-Object length -sum

# Show total CPU time for the 10 processes with the highest CPU consumption
Get-Process | Sort CPU -descend | Select -first 10 | Measure-Object CPU -sum

# Show names and handle counts for the 10 processes with the most handles in order by process name
Get-Process | Sort handles -descend | Select -first 10 -property ProcessName, Handles | Sort ProcessName | Format-Table -auto

# Show only total size of the files in the current directory with nothing else
Get-ChildItem | Measure-Object length -sum | Select -property Sum | Format-Table -auto

# Show name and status of all services
Get-Service | Select -Property Name, Status | Format-Table -auto

# Get-ChildItem will get you the contents of a folder including sub folders, can recurse, can use -include
# Get-Item is used when you need to manipulate or view information on a folder itself, cannot recurse, cannot use -include

# Show total size of all the .doc and .docx files in e:documents and all of its subfolders
Get-ChildItem E:\Documents -include *.doc, *.docx -recurse | Measure-Object length -sum | Format-Table -auto

# Show just the name of the oldest file in the current folder
Get-ChildItem | Sort CreationDate | Select -first 1 | Format-Table -property Name

# Show Name, ID, and CPU for the ten processes that have used the most CPU time in order by ID
Get-Process | Sort -property CPUTime | Select -Last 10 | Sort -property ID | Format-Table Name, ID, CPU -auto

# Show the current UTC date and time
Write-Host "The current UTC date and time is: " ([datetime]::UtcNow)

# Show the names and total sizes of the drives on the system
[IO.DriveInfo]::GetDrives() | Format-Table Name, TotalSize -auto

# Show all files in current directory that were modified in the previous month
$FirstCurrent = [datetime](Get-Date).ToString('yyyy/MM/01')
$FirstLast = $FirstCurrent.AddMonths(-1)
# These variables are named terribly...
Get-ChildItem | Where-Object { ($_.LastWriteTime.date -ge $FirstLast.date) -and ($_.LastWriteTime.date -lt $FirstCurrent.date ) }

# Assign number of seconds ago the first explorer process was started to a variable
$ExplorerSecs = ((Get-Date) - (@(Get-Process Explorer)[0].StartTime)).TotalSeconds

# Change all "."s in file name to "_"s except for the last one **not my solution**
Get-Item * | ForEach-Object {
  $NewName = $_.Name
  for( $DotPos = $NewName.IndexOf("."); $DotPos -ne $NewName.LastIndexOf("."); $DotPos = $NewName.IndexOf(".") ) {
    if ( $DotPos -lt 0 ) { break }
    $NewName = $NewName.SubString( 0, $DotPos ) + "_" + $NewName.SubString( $DotPos+1 )
  }
  if ( $NewName -ne $_.Name ) { $_.MoveTo( $NewName ) }
}

# 3 ways to display quote marks, is any one method best?
Write-Host '"Madam, I''m Adam" is a palindrome.' # Double single quote, to show I'm
Write-Host """Madam, I'm Adam"" is a palindrome." # Double double quote, to show "s
Write-Host "`"Madam, I'm Adam`" is a palindrome." # Backtick ` escape

# Show day of the week
Write-Host "Today is $((Get-Date).DayOfWeek)"

# Format a SIN for display
$a = 123456789
$a.ToString( "###\-###\-###" )

# Show sum of processor time in seconds used by all of the threads of the first Explorer process
# Note ForEach-Object is for a pipeline and only has a code block
#   ForEach accepts a condition ( condition ) and code block { code block }
ForEach ( $Thread in (@(Get-Process Explorer)[0].threads )) {
  $TotalProcess += $Thread.TotalProcessorTime
}
Write-Host "The total processing time in seconds for Explorer is $($TotalProcess.TotalSeconds)"

# Loop until notepad stops running
While ($True) {
  $Notepad = Get-Process | Where-Object { $_.name -eq "Notepad" }
  if ( $Notepad -eq $Null ) { break }
  Write-Host -nonewline "Please close notepad to continue..."
  Start-Sleep 1
}

# Set the windows default path to the current working directory of PS
[IO.Directory]::SetCurrentDirectory((Get-Location))

# Continue cannot be used with a foreach-object cmdlet
# !!Example here!! # 

# Set windows 7 menu display to 200ms
Set-ItemProperty "HKCU:\ControlPanel\Desktop" MenuShowDelay 200 -type Dword

# Function to return the boot time of the system
function Get-BootTime {
  # This is broken
  # $Event = Get-EventLog system -instanceId 12 -newest 1 # Needs some error handling here if no instance ID of 12 exists
  if ( $Event -eq $Null ) {
    $Event = Get-EventLog system | Select -last 1
  }
  $BootTime = $Event.TimeGenerated
  return $BootTime
}
# Not a very good way to get system boot time, see WMI objects for a better method

# Delete files in Temp directory and all sub folders that were created before the system was last booted
$ToBeDeleted = @( Get-ChildItem ((Get-ChildItem env:\TEMP).value) -recurse | Where-Object { ($_.CreationTime -lt (Get-BootTime)) -and ($_ -is [IO.FileInfo]) } )
ForEach ( $File in $ToBeDeleted ) {
  Write-host $File " will be deleted."
  $FileCount += 1
  $TotalBytes += $File.length
}
$ToBeDeleted | Remove-Item -whatif # Remove -whatif to actually have this run
Write-Host $FileCount "files have been removed. For a total of $TotalBytes bytes."

# Function that returns a hash table of holiday dates and names based on Holidays.txt
function Get-HolidayTable {
  $Holidays = Get-Content Holidays.txt # need a test path here then if file does not exist return $null
  $Table = @{}
  $Holidays | ForEach {
    if ( $_ -match '^(?<Date>[0-9]{4}-[0-9]{2}-[0-9]{2})\s+(?<Name>.+)'){
      $Table.Add($matches['Date'], $matches['Name'])
    } # add line to ensure date is valid, e.g. 2013-99-99 would be passed but we don't want it to
  }
  return $Table
}

# Shows the number of files on the entire C drive that were created on a holiday, uses get-holidays function
$Table = Get-HolidayTable
if ( $Table -eq $Null ) {
  Write-Host "Error cannot load holiday table."
  exit 1
}
$FileCount = 0
Get-ChildItem C:/ -recurse | Where-Object { $_ -is [IO.FileInfo] } | ForEach-Object { # new code here # 

# Counts the number of words in a text document
function ErrorOut {
  param ( [string]$Message, [int]$ExitCode=1 )
  Write-Host -foregroundcolor red "`n$Message"; exit $ExitCode
}
if ( $args.count -ne 1) {
  ErrorOut "Error please provide one file to word count."
}
if ( -not (test-path $args[0])) {
  ErrorOut "Error Cannot find the file you provided." 2
}
$File = Get-Item $args[0]
$FileCollection = Get-Content $File
$LineCount = $FileCollection.Count
$WordCount = 0
$FileName = $File.Name
ForEach ( $Line in $FileCollection ) {
  $SplitLine = ( $Line -split '[\W]+' )
  $WordCount += $SplitLine.Count
}
Write-Host "There are $LineCount line(s) in $FileName and $WordCount word(s)."

# For review and studying

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

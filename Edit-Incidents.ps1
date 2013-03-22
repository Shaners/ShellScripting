function IsLocked {
    param( [string]$FileName )
    
    $ErrorActionPreference = "SilentlyContinue"
    $File = [IO.File]::OpenWrite( $FileName )
    $Result = $?
    $ErrorActionPreference = "Continue"
    if ( $Result ) { $File.Close() }
    return (-not $Result)
}

# Ensures location is the same as PS's working directory
[System.IO.Directory]::SetCurrentDirectory($(get-location))

# Constructs file name
$CurrentDate =  (Get-Date).ToString('yyyy-MM-dd')
$FileName = "Incidents_$CurrentDate.docx"

# Checks existence of file
#   If not exist then create by copying from template
if ( -not (test-path ".\$FileName" -pathtype leaf) ) {
    Copy-Item ".\Incidents_Template.docx" -Destination ".\$Filename"
}

# Test if the file is locked with islocked func
#   If locked wait for it to become unlocked and display a message that updates
if ( IsLocked($FileName) ) {
    write-host "Waiting for file to be unlocked"
    do {
        Start-Sleep -s 1
        write-host "`r.  " -nonewline # padright to make this blink? Clear-host?
        Start-Sleep -s 1
        write-host "`r.. " -nonewline
        Start-Sleep -s 1
        write-host "`r..." -nonewline
    }
    until ( -not ( IsLocked($FileName) ) )
}

# Call invoke-item to edit file
Invoke-Item ".\$FileName"

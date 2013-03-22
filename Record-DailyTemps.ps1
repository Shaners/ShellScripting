function Get-CurrentTemp {
    $ErrorActionPreference = "SilentlyContinue"
    $WeatherXML = ( New-Object System.Net.WebClient ).DownloadString( "http://rss.wunderground.com/auto/rss_full/global/stations/71201.xml?units=metric" )
    if ( $? ) {
        ( $WeatherXML -replace "`n", " " ) -match '(Current Conditions.*?(Temperature: ).*?(?<CurrentTemp>\d+(\.\d+)?))' | out-null
        if ( $? ) {
            return [double]$Matches["CurrentTemp"]
        }
    }
    $ErrorActionPreference = "Continue"
}

# Reads temperatures.csv into a collection
#   If csv does not exist, will create empty collection
#   If locked will retry opening every 1 second forever
if ( -not (test-path ".\Temperatures.csv" -pathtype leaf) ) {
    $Temperatures = @( )
}
else {
    do {
        Start-Sleep -s 1
        $ErrorActionPreference = "SilentlyContinue"
        Import-CSV Temperatures.csv | out-null # dirty? is there a better way?
        $Result = $?
        $ErrorActionPreference = "Continue"
    }
    until ( $Result )
    $Temperatures = @( Import-CSV Temperatures.csv )
}

$CurrentTemp = Get-CurrentTemp
$CurrentDate = (Get-Date).ToString('yyyy-MM-dd')

# If today exists in collection change it's temp to current temp
if ( $Temperatures -match $CurrentDate ) { # This will fail if it checks against an object like produced in else statement
    foreach ( $Record in $Temperatures ) { # Got to be a better way to do this
        if ( $Record.Date -eq $CurrentDate ) {
            $Record.Temp = $CurrentTemp
        }
    }
} # If today does not exist in collection add current date plus current temp as a new object to collection
else {
    $TodayDateTemp = New-Object Object
    $TodayDateTemp | Add-Member NoteProperty "Date" $CurrentDate
    $TodayDateTemp | Add-Member NoteProperty "Temp" $CurrentTemp
    $Temperatures += $TodayDateTemp
}

# write collection to temperatures.csv using safe update strat ( rename orginal .bak, new .new then .csv )
$Temperatures | Export-CSV Temperatures.tmp -notype -Force
# if temperatures locked retry every 1 second forever
do {
    Start-Sleep -s 1
    $ErrorActionPreference = "SilentlyContinue"
    Import-CSV Temperatures.csv | out-null # dirty? is there a better way?
    $Result = $?
    $ErrorActionPreference = "Continue"
}
until ( $Result )
Move-item Temperatures.csv Temperatures.bak -Force

Move-item Temperatures.tmp Temperatures.csv

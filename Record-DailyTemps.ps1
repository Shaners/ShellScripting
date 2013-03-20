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

# read temperatures.csv to collection
#   if csv not exist create empty collection
#   if locked retry every 1 second forever
if ( -not (test-path ".\Temperatures.csv" -pathtype leaf) ) {
    write-host "Temperatures.csv does not exist" # remove this later
    $Temperatures = @( )
}

do {
    Start-Sleep -s 5 # change to 1 after working
    $ErrorActionPreference = "SilentlyContinue"
    $Temperatures = @( Import-CSV Temperatures.csv ) # will this always be successful???
    $Result = $?
    $ErrorActionPreference = "Continue"
    write-host "Result = $Result" # remove this later
}
until ( $Result )

write-host "Loop has ended. Result is $Result" # remove this later
write-host $Temperatures # remove this later
# finish this sandwich
# finished needs testing

$CurrentTemp = Get-CurrentTemp


# if today exists in collection change it's temp to current temp

# if today not exist in collection add current date plus current temp

# write collection to temperatures.csv using safe update strat ( rename orginal .bak, new .new then .csv )

# if temperatures locked retry every 1 second forever

# does not accept command line parameters

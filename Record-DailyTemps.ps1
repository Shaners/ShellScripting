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

# read temperatures.csv to collection, if locked retry every 1 second forever, if csv not exist create empty collection
$Temperatures = @( Import-CSV Temperatures.csv )
$Temperatures = @( )
# finish this sandwich

$CurrentTemp = Get-CurrentTemp


# if today exists in collection change it's temp to current temp

# if today not exist in collection add current date plus current temp

# write collection to temperatures.csv using safe update strat ( rename orginal .bak, new .new then .csv )

# if temperatures locked retry every 1 second forever

# does not accept command line parameters

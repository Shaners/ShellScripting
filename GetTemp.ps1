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

Get-CurrentTemp

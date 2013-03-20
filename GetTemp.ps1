function Get-CurrentTemp {
    $WeatherXML = ( New-Object System.Net.WebClient ).DownloadString( "http://rss.wunderground.com/auto/rss_full/global/stations/71201.xml?units=metric" )
    ( $WeatherXML -replace "`n", " " ) -match '(Current Conditions.*?(Temperature: ).*?(?<CurrentTemp>\d+(\.\d+)?))' | out-null
    return [double]$Matches["CurrentTemp"]
}

Get-CurrentTemp

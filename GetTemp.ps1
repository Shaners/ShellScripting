function Get-CurrentTemp {
    $WeatherXML = ( New-Object System.Net.WebClient ).DownloadString( "http://www.weatheroffice.gc.ca/rss/city/bc-74_e.xml" )
    $CurrentConditions = ([xml] $WeatherXML).SelectSingleNode( "/rss/channel/item[category='Current Conditions']" ).Title
    $Temp = $CurrentConditions.substring(($CurrentConditions.lastindexof(',')+2))
    write-host $Temp
}

Get-CurrentTemp

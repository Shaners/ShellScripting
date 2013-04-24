# Purpose:
# Finds website data that isn't properly formatted
# Finds websites that aren't available
#
# Main Steps:
# Accepts CSV list of URLs
# Tests formatting of URL data
# Tests valid URLs to see if they are currently up
# Exports failures to CSV
#
# Shane Lister
# Version: 1.0
# Modified on: Apr 24th, 2013

# Collection of common URLs
$CommonURLs = "https://www.google.ca", "https://www.google.com", "https://www.facebook.com", "https://twitter.com", "http://www.wolframalpha.com"

# Exit with status message on improper use
function Error-Out {
  param ( [string]$Message, [int]$ExitCode=1 )
  Write-Host -foregroundcolor red "`n$Message"; exit $ExitCode 
}

# Tests if a single website url is working properly, returns false or a hash table
function Test-LiveURL {
  param ( [string]$URL )
  $ErrorActionPreference = "SilentlyContinue"
  $webRequest = [net.WebRequest]::Create($URL)
  $Result = $?
  $ErrorActionPreference = "Continue"

  if ( $Result -eq $False ) {
      return $False
      break
  }
  
  $ErrorActionPreference = "SilentlyContinue"
  # $then = get-date
  $response = $webRequest.GetResponse()
  $responseResult = $?
  # $now = get-date
  $ErrorActionPreference = "Continue"
  
  if ( $responseResult -eq $False ) {
      #$report = @{ URL = $URL
      #         StatusCode = 999
      #         StatusDescription = "Error Processing" 
      #         # ResponseTime = "$(($now - $then).totalseconds)"
      #        ResponseURI = "None"
      #}
      # return $report
      return $False
      break
  }
  
  $report = @{ URL = $URL
               StatusCode = $response.Statuscode -as [int]
               StatusDescription = $response.StatusDescription
               # ResponseTime = "$(($now - $then).totalseconds)"
               ResponseURI = $response.ResponseUri
  }
  return $report
}

# Tests some common sites that should always be up
function Test-CommonURLs {
  param ( [string[]]$URLS )
  $failCount = 0
  foreach ( $URL in $URLS ){
    if ( ( Test-LiveURL $URL ) -eq $False ){
      $failCount += 1
    }
  }
  return $failCount, $URLS.count
}


# Error exit out if it is suspect that there is no connection
$TestFails, $TotalTested = Test-CommonURLs $CommonURLs
if ( $TestFails -eq $TotalTested ){ 
  Error-Out "You do not have a live internet connection or have limited connectivity. `n!!!Exiting script!!!", 1
}

# Warning message if more than half of common URLs fail
if ( $TestFails -gt ( $TotalTested / 2 ) ){ 
  Write-Host -foregroundcolor red "!!! Warning, more than half of the common URLs failed. Your results may not be valid !!!"
}

# Error exit out if no parameters are provided to script
if ( $args.count -ne 1 ){
  Error-Out "You haven't provided an input .CSV file. `n!!!Exiting script!!!", 2
}

# Error exit if a folder is picked
if ( Test-Path $args[0] -pathtype container ){
  Error-Out "You provided a folder. Please provide a .CSV file instead. `n!!!Exiting script!!!", 3
}

# Error exit out if file does not exist
if ( -not (Test-Path $args[0] -pathtype leaf) ){
  Error-Out "The file you selected doesn't exist there. `n!!!Exiting script!!!", 4
}

# Import CSV file into a collection
$URLs = @( Import-CSV $args[0] )

# Empty collections that will be used
$PassURLs = @()
$FormatFailURLs = @()
$FailedURLs = @()
$WorkingURLs = @()

# Separates incorrectly formatted URLs from properly formatted ones
Foreach ( $URL in $URLs ){
  if ( ($URL.Website.StartsWith("http://")) -or ($URL.Website.StartsWith("https://")) ){
    $PassURLs += $URL
  }
  else { $FormatFailURLs += $URL }
}

# Incorrectly formatted URLs are dumped here
$FormatFailURLs | Export-CSV FormatFailedURLs.csv -notype

# Finds live URLs
Foreach ( $URL in $PassURLs ){
  $Response = $Null
  $Response = Test-LiveURL $URL.website
  if ( $Response -eq $False ){
    $FailedURLs += $URL
  }
  else {
    $URL."Website Status" = $Response.StatusDescription
    $URL."Website Status Code" = $Response.StatusCode
    $URL.ResponseURI = $Response.ResponseUri
    $URL."Response Time" = $Response.ResponseTime
    $WorkingURLs += $URL
  }
}

# Broken URLs dumped here
$FailedURLs | Export-CSV FailedURLs.csv -notype

# Dump working URLs and their status code
$WorkingURLs | Export-CSV WorkingURLs.csv -notype

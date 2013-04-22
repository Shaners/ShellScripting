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
# Version: 0.1
# Created on: Apr 19th, 2013

# Collection of common URLs
# Used in Test-CommonURLs function
$CommonURLs = "https://www.google.ca", "https://www.google.com", "https://www.facebook.com", "https://twitter.com", "http://www.wolframalpha.com"
#! Should this be nested within Test-CommonURLs func?

# Create the Web Client object
$webClient = New-Object Net.WebClient
#! No need for System. but since this is a script file maybe use the full name?
#!! WebRequest looks to be faster and better method, maybe remove this
#!!! Use for download string now or in another scritp

# Exit with status message on improper use
function Error-Out {
  param ( [string]$Message, [int]$ExitCode=1 )
  Write-Host -foregroundcolor red "`n$Message"; exit $ExitCode 
}

# Tests if a single website url is working properly
# Returns false or a hash table
function Test-LiveURL {
  param ( [string]$URL )
  $ErrorActionPreference = "SilentlyContinue" # Lets me handle error processing
  $webRequest = [net.WebRequest]::Create($URL) # Sends a request to a URL
  $Result = $? # Sets result to error status of last executed command
  $ErrorActionPreference = "Continue" # Reactivate showing errors

  if ( $Result -eq $False ) {
      return $False
      break
  }
  
  $then = get-date
  $response = $webRequest.GetResponse()
  $now = get-date
  $report = @{ URL = $URL
               StatusCode = $response.Statuscode -as [int]
               StatusDescription = $response.StatusDescription
               ResponseTime = "$(($now - $then).totalseconds)"
               ResponseURI = $response.ResponseUri
  }
  return $report
}
#! clean this function up? Add more response details?

# Tests some common sites that should always be up
function Test-CommonURLs {
  param ( [array]$URLS )
  $failCount = 0
  foreach ( $URL in $URLS ){
    if ( ( Test-LiveURL $URL ) -eq $False ){
      $failCount += 1
    }
  }
  return $failCount, $URLS.count
}

# URL format test func Test-FormatURL
# If the url doesn't start with http:// or https:// then it isn't valid
# Can be expanded later
# a lot of this is already taken care of in Test-LiveURL but I want to be able to 
# pull out all URLs that don't start with http and not test them but put into a 
# separate invalid / to be fixed list
function Test-FormatURL {
  param ( [string]$URL )
  if ( ($URL )
}
#! May not need this at all and can just do .startswith("x") in main call

# Error exit out if no parameters are provided to script
if ( $args.count -ne 1 ){
  Error-Out "You haven't provided an input .CSV file. `n!!!Exiting script!!!", 1
}

# Error exit if a folder is picked

# Error exit out if file does not exist
if ( -not (test-path working.xlsx -pathtype leaf) ){
  Error-Out "The file you selected doesn't exist there. `n!!!Exiting script!!!", 2
}

# import CSV file into a collection
Import-CSV $args[0]

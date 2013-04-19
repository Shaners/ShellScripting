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
$CommonURLs = "http://www.google.ca", "http://www.google.com", "https://www.facebook.com", "https://twitter.com", "http://www.wolframalpha.com"
#! Should this be nested within Test-CommonURLs func?

# Create the Web Client object
$webClient = New-Object Net.WebClient
#! No need for System. but since this is a script file maybe use the full name?
#!! WebRequest looks to be faster and better method, maybe remove this

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
  $response = $webRequest.GetResponse() # time outs with google ca happening here for some reason
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

# Common site check func Test-CommonURLs
# Tests some common sites that should always be up
# If fail error out
function Test-CommonURLs {
  #stuff happens here!
}

# URL format test func Test-FormatURL
# If the url doesn't start with an h it isn't valid
# Can be expanded later

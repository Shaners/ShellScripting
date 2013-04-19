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


# Error out func Error-Out
# Exit with status message on improper use

# Test-LiveURL
# Tests if a single website url is working properly
# Returns true or false

# Common site check func Test-CommonURLs
# Tests some common sites that should always be up
# If fail error out

# URL format test func Test-FormatURL
# If the url doesn't start with an h it isn't valid
# Can be expanded later

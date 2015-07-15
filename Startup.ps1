$AppsToRun = "Outlook", "C:\Program Files (x86)\Mozilla Firefox\firefox.exe", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

function Error-Out {
  param ( [string]$Message, [int]$ExitCode=1 )
  Write-Host -foregroundcolor red "`n$Message"; exit $ExitCode 
}

function Check-IfRunning {
  param ( [string]$App )

  if ( (Get-Process | Where-Object {$_.Path -eq $App -or $_.Name -eq $App}).Count -gt 0 ) {
    return $True
  }
  else {
    return $False
  } 
}


ForEach ( $App in $AppsToRun ) {
  if ( !(Check-IfRunning $App) ) {
    Start-Process $App
  }
}

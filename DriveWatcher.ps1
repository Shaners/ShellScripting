$searchPath = "Watched dive here"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $searchPath
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

$changed = Register-ObjectEvent $watcher "Changed" -Action {
   $name = $Event.SourceEventArgs.Name
   $fullPath = $Event.SourceEventArgs.FullPath
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Write-Host "The file '$name' was $changeType at $timeStamp" -fore green
   Out-File -FilePath "Output Log File" -Append -InputObject "'$name' was $changeType at $timeStamp. $fullPath"
}

$changed = Register-ObjectEvent $watcher "Created" -Action {
   $name = $Event.SourceEventArgs.Name
   $fullPath = $Event.SourceEventArgs.FullPath
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Write-Host "The file '$name' was $changeType at $timeStamp" -fore green
   Out-File -FilePath "Output Log File" -Append -InputObject "'$name' was $changeType at $timeStamp. $fullPath"
}

$changed = Register-ObjectEvent $watcher "Deleted" -Action {
   $name = $Event.SourceEventArgs.Name
   $fullPath = $Event.SourceEventArgs.FullPath
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Write-Host "The file '$name' was $changeType at $timeStamp" -fore red
   Out-File -FilePath "Output Log File" -Append -InputObject "'$name' was $changeType at $timeStamp. $fullPath"
}

$changed = Register-ObjectEvent $watcher "Renamed" -Action {
   $name = $Event.SourceEventArgs.Name
   $fullPath = $Event.SourceEventArgs.FullPath
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Write-Host "The file '$name' was $changeType at $timeStamp" -fore green
   Out-File -FilePath "Output Log File" -Append -InputObject "'$name' was $changeType at $timeStamp. $fullPath"
}

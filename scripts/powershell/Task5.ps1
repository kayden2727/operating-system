$dateTime = Get-Date -Format "yyyy-MM-dd HH-mm-ss"

$hostname = $env:COMPUTERNAME

$currentUser = $env:USERNAME

$disk = Get-PSDrive -Name C
$totalSpace = [math]::Round($disk.Used + $disk.Free / 1GB, 2)
$freeSpace = [math]::Round($disk.Free / 1GB, 2)

Write-Output "Date and Time: $dateTime"
Write-Output "Hostname: $hostname"
Write-Output "Current User: $currentUser"
Write-Output "Disk Total Space (GB): $totalSpace"
Write-Output "Disk Free Space (GB): $freeSpace"
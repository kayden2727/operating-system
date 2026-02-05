$logFile = "server.log"

if (Test-Path $logFile) {
    $errorCount = Select-String -Path $logFile -Pattern "Error" | Measure-Object | Select-Object -ExpandProperty Count
    Write-Output "Number of lines that have Error: $errorCount"
} else {
    Write-Output "Log file does not exist."
}
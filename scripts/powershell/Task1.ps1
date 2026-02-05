param (
    [string]$filename
)

if (Test-Path $filename) {
    $fileSize = (Get-Item $filename).Length

    if ($fileSize -gt 1MB) {
        Write-Output "File is too large.";
            } else {
        Write-Output "The file '$filename' is 1MB or smaller."
    }
} else {
    Write-Output "File does not exist."
}
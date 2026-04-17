Get-ChildItem -Filter "*.txt" | ForEach-Object {
    $newName = "OLD_" + $_.Name
    Rename-Item $_.FullName $newName
}
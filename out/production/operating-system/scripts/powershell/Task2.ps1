Get-Process |
Sort-Object -Property WorkingSet -Descending |
Select-Object -First 5 `
    @{Name="ProcessName";Expression={$_.ProcessName}},
    @{Name="PID";Expression={$_.Id}},
    @{Name="MemoryUsage(MB)";Expression={[math]::Round($_.WorkingSet / 1MB, 2)}} 
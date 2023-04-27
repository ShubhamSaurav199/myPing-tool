$Output = @()

$names = Get-Content "D:\OneDrive - L&T Construction\Ping_IP_List\Wireless.txt"

foreach ($name in $names) {
    if (Test-Connection -Delay 1 -ComputerName $name -Count 1 -ErrorAction SilentlyContinue) {
        $Output += [PSCustomObject] @{
            ComputerName = $name
            Status = "Up"
        }
        Write-Host "$Name,Up" -ForegroundColor Green
        # !! execute ping -a IP.
    }
    else {
        $Output += [PSCustomObject] @{
            ComputerName = $name
            Status = "Down"
        }
        Write-Host "$Name,Down" -ForegroundColor Red
    }
}

$Output | Select-Object ComputerName, Status  | export-csv -path "D:\OneDrive - L&T Construction\Commands\out_wireless.csv"

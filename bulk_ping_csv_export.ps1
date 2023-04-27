$Output= @()

$names = Get-Content "D:\IP-List\TB-SW.txt"

foreach ($name in $names){

if (Test-Connection -Delay 15 -ComputerName $name -Count 1 -ErrorAction SilentlyContinue){

$Output+= "$name","Up"

Write-Host "$Name,Up" -ForegroundColor Green

}

else{

$Output+= "$name,Down"

Write-Host "$Name,Down" -ForegroundColor Red

}

}

$Output | Out-file "D:\OneDrive - L&T Construction\Commands\out.csv"
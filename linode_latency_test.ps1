# linode_latency_test.ps1

Write-Host "Testing latency to various Linode data centers from Kenya..."

$locations = @{
    "Frankfurt" = "speedtest.frankfurt.linode.com"
    "London"    = "speedtest.london.linode.com"
    "Mumbai"    = "speedtest.mumbai1.linode.com"
    "Singapore" = "speedtest.singapore.linode.com"
    "Newark"    = "speedtest.newark.linode.com"
    "Fremont"   = "speedtest.fremont.linode.com"
    "Atlanta"   = "speedtest.atlanta.linode.com"
    "Dallas"    = "speedtest.dallas.linode.com"
    "Toronto"   = "speedtest.toronto1.linode.com"
    "Tokyo"     = "speedtest.tokyo2.linode.com"
    "Sydney"    = "speedtest.sydney1.linode.com"
}

foreach ($location in $locations.Keys) {
    Write-Host "------------------------------------------"
    Write-Host "Pinging $location ($($locations[$location]))..."
    
    try {
        $ping = Test-Connection -Count 4 -ComputerName $locations[$location] -ErrorAction Stop
        $avg = ($ping | Measure-Object ResponseTime -Average).Average
        Write-Host "Average latency to ${location}: $avg ms"
    } catch {
        Write-Host "Ping to ${location} failed: $($_.Exception.Message)"
    }
}

Write-Host "------------------------------------------"
Write-Host "Done. Lower average latency = better performance."

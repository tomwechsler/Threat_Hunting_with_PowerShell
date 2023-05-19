$service = Get-Service -Name "msiserver" -ErrorAction SilentlyContinue
if ($service -eq $null) {
    Write-Host "Windows Installer Service is not installed."
} else {
    Write-Host "Windows Installer Service is installed."
}

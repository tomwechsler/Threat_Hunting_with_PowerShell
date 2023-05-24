#Status of Microsoft Defender
Get-MpComputerStatus

#Settings on local machine
Get-MpPreference

#Settings on domain connected remote system
Get-MpPreference -CimSession (name)

#Adjust settings
Set-MpPreference -DisableRemovableDriveScanning $false

Set-MpPreference -ScanScheduleTime 17:00:00

#Check for updates
Update-MpSignature

#Start Scan
Start-MpScan -ScanType FullScan

Start-MpScan -ScanType Quickscan
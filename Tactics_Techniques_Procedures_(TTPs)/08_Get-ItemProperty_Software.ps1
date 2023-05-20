#Here is an example of how you can examine a program. Or search for programs in a directory or in the registry.

#Local or remote
#If remote
Enter-PSSession -ComputerName "name of computer"

#List some informations
Get-ItemProperty C:\Windows\System32\calc.exe

#Get detailed metadata
Get-ItemProperty C:\Windows\System32\calc.exe | Select-Object *

#Search in a directory
Get-ItemProperty 'C:\Program Files\*' | Select-Object Name, CreationTime

#Or in the registry
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object Displayname, DisplayVersion, Publisher, InstallDate

#The results of Get-PSProvider with no snap-ins or modules loaded appears here
Get-PSProvider

#To find out what types of item properties are available
Get-ItemProperty -Path C:\fso\a.txt

#This is the top-level view of the item properties of the file
Get-ItemProperty -Path C:\fso\a.txt | Format-list -Property * -Force

#Okay, that provides a lot of information, but it does not tell me if I can write to the item properties or not
Get-ItemProperty -Path C:\fso\a.txt | Get-Member -MemberType property

#Now we dig a bit deeper
(Get-Date).gettype()

[System.Io.FileAttributes] | Get-Member -Static -MemberType property

[enum]::GetValues([system.io.fileattributes])

[system.io.fileattributes]::ReadOnly.Value__

(Get-ItemProperty -Path C:\fso\a.txt).attributes
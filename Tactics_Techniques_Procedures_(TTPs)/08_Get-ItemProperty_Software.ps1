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
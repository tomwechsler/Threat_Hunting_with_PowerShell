#Define the process names associated with T1059.001
$processNames = @("cmd", "powershell", "wscript", "cscript", "mshta")

#Get a list of running processes
$processes = Get-Process

#Filter the list to include only processes associated with T1059.001
$t1059001Processes = $processes | Where-Object {$processNames -contains $_.ProcessName}

#If any T1059.001 processes are found, print a warning message
if ($t1059001Processes) {
    Write-Output "T1059.001 processes found:"
    foreach ($process in $t1059001Processes) {
        Write-Output "PID: $($process.Id)"
        Write-Output "Name: $($process.ProcessName)"
        Write-Output "Start Time: $($process.StartTime)"
    }
    Write-Output "Consider investigating the source and purpose of these processes."
}
else {
    Write-Output "No T1059.001 processes found."
}

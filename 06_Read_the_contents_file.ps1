#Prompt the user to enter the path of the file
$filepath = Read-Host "Enter the path of the file"

#Check if the file exists
if (Test-Path $filepath) {
  #Read the contents of the file
  $content = Get-Content $filepath
  Write-Output "Contents of the file:"
  Write-Output $content
} else {
  Write-Output "File not found"
}

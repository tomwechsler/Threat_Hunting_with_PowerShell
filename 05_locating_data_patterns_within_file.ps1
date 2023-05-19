#Prompt the user to enter the path of the file
$filepath = Read-Host "Enter the path of the file"

# Check if the file exists
if (Test-Path $filepath) {
  #Read the contents of the file
  $content = Get-Content $filepath
  Write-Output "Contents of the file:"
  Write-Output $content
  
  #Prompt the user to enter the pattern to search for
  $pattern = Read-Host "Enter the pattern to search for"
  
  #Search for the pattern within the file contents
  $matches = Select-String -Path $filepath -Pattern $pattern
  if ($matches) {
    Write-Output "Pattern matches found:"
    foreach ($match in $matches) {
      Write-Output "Line $($match.LineNumber): $($match.Line)"
    }
  } else {
    Write-Output "Pattern not found"
  }
} else {
  Write-Output "File not found"
}

#Prompt the user to enter the path of the file
$filepath = Read-Host "Enter the path of the file"

#Check if the file exists
if (Test-Path $filepath) {
  #Read the contents of the file
  $content = Get-Content $filepath -Raw
  
  #Define the regular expression pattern to search for
  $pattern = '\bcharset=(.*?)\b'
  
  #Search for the pattern within the file contents using regex
  $matches = [regex]::Matches($content, $pattern)
  if ($matches.Count -gt 0) {
    Write-Output "Encoding matches found:"
    foreach ($match in $matches) {
      Write-Output "Match: $($match.Value)"
    }
  } else {
    Write-Output "No encoding matches found"
  }
} else {
  Write-Output "File not found"
}

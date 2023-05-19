$file = "C:\path\to\file"   #Replace with the path to the file you want to check

$streamList = Get-Item $file -Stream * | Select-Object Stream

if ($streamList.Count -gt 1) {
    Write-Host "The file $($file) has the following alternative data streams:"
    $streamList | Where-Object { $_.Stream -ne ":$DATA" } | ForEach-Object { Write-Host $_.Stream }
} else {
    Write-Host "The file $($file) does not have any alternative data streams."
}

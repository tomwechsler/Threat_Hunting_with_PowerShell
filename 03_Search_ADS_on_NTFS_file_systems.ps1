$folderPath = "C:\Users\UserName\Documents" #Replace with the path to the folder you want to search

#Get all files in the specified folder and its subfolders
$files = Get-ChildItem $folderPath -Recurse -File

#Loop through each file and check if it has any alternate data streams
foreach ($file in $files) {
    $streams = Get-Item $file.FullName -Stream *

    #If the file has alternate data streams, output the file path and stream names
    if ($streams) {
        Write-Host "File: $($file.FullName)"
        Write-Host "Alternate Data Streams:"

        foreach ($stream in $streams) {
            Write-Host "  $($stream.StreamName)"
        }

        Write-Host " "
    }
}
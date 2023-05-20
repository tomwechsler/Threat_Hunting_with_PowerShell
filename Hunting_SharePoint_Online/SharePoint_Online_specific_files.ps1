#The search query is using the FileType property to filter results that match the file type specified.

#Variables
$domain = Read-Host -Prompt "Enter your Microsoft 365 domain (e.g., contoso)"
$siteUrl = "https://$domain.sharepoint.com/sites/traders"
$FileType = "ps1*"
 
$Query = "* FileType=""$FileType"""
#$LogFile = "C:\users\$env:USERNAME\Desktop\File Type - $FileType.csv"
 
# ---------------------------------
 
Connect-PnPOnline -Url $siteUrl -Interactive
 
$SearchResults = Submit-PnPSearchQuery -Query $query -All -TrimDuplicates $false -SelectProperties ListItemID, Filename 
 
$results = @()
foreach ($ResultRow in $SearchResults.ResultRows) {
     
    $itemId = $ResultRow["ListItemID"]
    $filename = $ResultRow["Filename"]
    $path = $ResultRow["Path"]
    $parentLink = $ResultRow["ParentLink"]
    Write-Host "Path: $path"
 
    Write-Host "-------------" -ForegroundColor Yellow
 
    #Creating object to export in .csv file
    $results += [pscustomobject][ordered] @{
        ItemId     = $itemId
        Filename   = $filename
        ParentLink = $parentLink
        Path       = $path
    }
 
}
 
$results

#$results | Export-Csv -Path $LogFile -NoTypeInformation
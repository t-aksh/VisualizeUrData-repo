$contents = Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\Config.json | ConvertFrom-Json
$Endpoints = $contents[0].resources

foreach ($i in $Endpoints)
{
   Write-Host $i.EndPoint
}
$contents = Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\Config.json | ConvertFrom-Json
$Endpoints = $contents[0].resources

$ARMtemplate = Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json | ConvertFrom-Json
$ARMResources = $ARMtemplate.resources.resources

$DataFactoryPipeline =@"
{
  "name": "PushedPipeline",
  "type": "Microsoft.DataFactory/factories/pipelines"
}
"@

Write-Host "Updated Resources"

foreach ($i in $Endpoints)
{	
    $PipelineAPIEndpoint = $i.EndPoint
    Write-Host $PipelineAPIEndpoint
    $DataFactoryPipeline =@"
{
  "name": "PushedPipeline",
  "type": "Microsoft.DataFactory/factories/pipelines"
}
"@

$ARMResources += (ConvertFrom-Json -InputObject $DataFactoryPipeline)				
}


foreach ($i in $ARMResources)
{	
   Write-Host $i
}
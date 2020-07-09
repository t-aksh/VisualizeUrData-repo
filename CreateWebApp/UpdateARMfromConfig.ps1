$contents = Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\Config.json | ConvertFrom-Json
$Endpoints = $contents[0].resources

$ARMtemplate = ( Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json | 
ConvertFrom-Json -depth 32 )
$ARMResources = $ARMtemplate.resources.resources

#Write-Host "Done"
#set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json'
#$SomeRandomVar = $ARMtemplate.resources.resources
#Write-Host $SomeRandomVar

$DataFactoryPipeline =@"
	{
	  "name": "PushedPipeline",
	  "type": "Microsoft.DataFactory/factories/pipelines"
	}
"@

$ARMtemplate.resources.resources[0].name = "Random"
Write-Host $ARMtemplate.resources.resources[0].name

#$JSON.Places.Places | Where{$_.name -eq 'Room 1'} | ForEach{$_.CandyTypesPresent.candies += 'bubblegum'}

$ARMtemplate | ConvertTo-Json -depth 100 | set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json'
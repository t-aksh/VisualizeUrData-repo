$contents = Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\Config.json | ConvertFrom-Json
$Endpoints = $contents[0].resources

$ARMtemplate = ( Get-Content -Raw -Path C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json | 
ConvertFrom-Json -depth 32 )
$ARMResources = $ARMtemplate.resources.resources

Write-Host "Done"
 
#set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json'
#$SomeRandomVar = $ARMtemplate.resources.resources
#Write-Host $SomeRandomVar

$DataFactoryPipeline =@"
	{
	  "name": "PushedPipeline",
	  "type": "Microsoft.DataFactory/factories/pipelines"
	}
"@

#You can use powershell script to deploy templates too :)
#https://adamtheautomator.com/arm-output-variables-in-azure-pipelines-powershell/#capturing-arm-outputs-for-the-azure-pipeline

#$ARMtemplate.resources | Add-Member -NotePropertyName location -NotePropertyValue $JSONDateTime -Force
#$JSON.SiteMaintenanceNotificationItems | Add-Member -NotePropertyName StartTime -NotePropertyValue $JSONDateTime -Force
#$ARMtemplate.resources.resources += (ConvertFrom-Json -InputObject $DataFactoryPipeline)
#WORKS

$ARMtemplate | ConvertTo-Json | set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json'

$contents[0].resources[0].EndPoint = "Changed EndPoint"
$contents | ConvertTo-Json | set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\Config.json'

#$ARMtemplate.resources.resources 
#(ConvertFrom-Json -InputObject $DataFactoryPipeline)
#Write-Host $ARMtemplate.resources.resources
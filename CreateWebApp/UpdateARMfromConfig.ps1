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

#$ARMtemplate | ConvertTo-Json | set-content 'C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json'


New-AzResourceGroupDeployment -Name MyARMDeployment -ResourceGroupName Intern_Akash_RG -TemplateFile C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM.json -TemplateParameterFile C:\Users\t-aksh\Documents\Internship_project\VizUrDataRepo\CreateWebApp\ADFTutorialARM-Parameters.json
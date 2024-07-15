$ResourceGroupName = "web-grp"
$Location = "North Europe"
$AppServicePlanName = "agkoudas-az-204-powershell-linux-app-service-plan"

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName `
-Name $AppServicePlanName `
-Location $Location `
-Tier Basic

$AppName = "agkoudas-az-204-powershell-linux-web-app"

New-AzWebApp -ResourceGroupName $ResourceGroupName `
-Name $AppName `
-Location $Location `
-AppServicePlan $AppServicePlanName

$gitRepo = "https://github.com/agkoudas/chapter128AzurePowershellGithub.git"

$PropertiesObject = @{
    repoUrl = $gitRepo;
    branch = "main";
    inManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject `
-ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $AppName/web `
-ApiVersion 2015-08-01 `
-Force


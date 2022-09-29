# This script assumes you've authenticated to Azure with the az tools already

$plansAsJson = az appservice plan list
$plans = $plansAsJson | ConvertFrom-JSON

$instanceCount = 0
foreach ($plan in $plans) {
    if ($plan.sku.capacity -le 0) {
        Write-Host "$($plan.name) instance count = 1"
        $instanceCount += 1
    }
    else {
        Write-Host "$($plan.name) instance count = $($plan.sku.capacity)"
        $instanceCount += $plan.sku.capacity
    }
}

Write-Host "Total estimated number of targets (Azure App Service Plan Instances): $instanceCount"

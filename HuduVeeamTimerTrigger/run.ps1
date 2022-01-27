using namespace System.Net

param($Timer)

$InstanceId = Start-NewOrchestration -FunctionName 'HuduVeeeamOrchestrator'
Write-Host "Started orchestration with ID = '$InstanceId'"

$Response = New-OrchestrationCheckStatusResponse -Request $timer -InstanceId $InstanceId
Write-Host ($Response | ConvertTo-Json)

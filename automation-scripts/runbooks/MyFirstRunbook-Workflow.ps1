workflow MyFirstRunbook-Workflow
{
    param
    (
        [string]$resourceGroup,
        [string[]]$VMs,
        [string]$action
    )

# Ensures you do not inherit an AzContext in your runbook
    Disable-AzContextAutosave -Scope Process

# Connect to Azure with system-assigned managed identity
    Connect-AzAccount -Identity

# set and store context
    $AzureContext = Set-AzContext -SubscriptionId "d44e2222-59a4-4010-9c0e-29dc002c8874"

# Start or stop VMs in parallel
    if ($action -eq "Start")
    {
        ForEach -Parallel ($vm in $VMs)
        {
            Start-AzVM -Name $vm -ResourceGroupName $resourceGroup -DefaultProfile $AzureContext
        }
    }
    elseif ($action -eq "Stop")
    {
        ForEach -Parallel ($vm in $VMs)
        {
            Stop-AzVM -Name $vm -ResourceGroupName $resourceGroup -DefaultProfile $AzureContext -Force
        }
    }
    else
    {
        Write-Output "`r`n Action not allowed. Please enter 'stop' or 'start'."
    }
}

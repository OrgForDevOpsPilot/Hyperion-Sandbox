param (
    [string] $ResourceGroupName = "bicep-test-rg",
    [string] $VMName = "vm-test-01"
)

# Authenticate with Azure using Managed Identity
Connect-AzAccount -Identity

# Start the VM
Write-Output "Starting VM: $VMName in Resource Group: $ResourceGroupName"
Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -NoWait

Write-Output "VM start request submitted successfully."

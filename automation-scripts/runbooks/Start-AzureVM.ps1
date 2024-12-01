param (
    [string] $ResourceGroupName = "bicep-test-rg",
    [string] $VMName = "vm-test-01"
)

# Step 1: Authenticate with Azure
Write-Output "Authenticating with Azure..."
Connect-AzAccount -Identity

# Step 2: Start the VM
Write-Output "Starting VM: $VMName in Resource Group: $ResourceGroupName"
Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -NoWait

# Completion message
Write-Output "VM start request submitted successfully."

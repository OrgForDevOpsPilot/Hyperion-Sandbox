workflow Start-AzureVMWorkflow {
    param (
        [string] $ResourceGroupName = "bicep-test-rg",
        [string] $VMName = "vm-test-01"
    )

    # Step 1: Authenticate with Azure
    Write-Output "Authenticating with Azure..."
    InlineScript {
        Connect-AzAccount -Identity
    }

    # Step 2: Start the VM
    Write-Output "Starting VM: $Using:VMName in Resource Group: $Using:ResourceGroupName"
    InlineScript {
        Start-AzVM -ResourceGroupName $Using:ResourceGroupName -Name $Using:VMName -NoWait
    }

    # Completion message
    Write-Output "VM start request submitted successfully."
}

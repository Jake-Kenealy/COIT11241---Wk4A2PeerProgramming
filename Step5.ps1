# Main script block

# Check command-line arguments
if ($args.Count -eq 0) {
    Write-Output "Usage: defend.ps1 <argument>"
    Write-Output "Available arguments:"
    Write-Output "- testInternetAccess: Test internet access"
    Write-Output "- enableRestrictInternet: Restrict internet access by setting proxy"
} else {
    $argument = $args[0]
    switch ($argument) {
        "testInternetAccess" {
            TestInternetAccess
        }
        "enableRestrictInternet" {
            EnableRestrictInternet
        }
        default {
            Write-Output "Invalid argument. Available arguments: testInternetAccess, enableRestrictInternet"
        }
    }
}

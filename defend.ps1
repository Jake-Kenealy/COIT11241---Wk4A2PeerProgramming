# File: defend.ps1

# Function to test internet access
function TestInternetAccess {
    try {
        $url = "https://www.youtube.com/"
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing
        $statusCode = $response.StatusCode

        if ($statusCode -eq 200) {
            Write-Output "Internet access test successful. HTTP status code: $statusCode"
        } else {
            Write-Output "Internet access test failed. HTTP status code: $statusCode"
        }
    } catch {
        Write-Output "An error occurred while testing internet access: $_. Exception type: $($_.Exception.GetType().FullName)"
    }
}

# Function to restrict internet access
function EnableRestrictInternet {
    [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy("http://proxy",$true)
    Write-Output "Internet access has been restricted. To restore internet access, call 'ResetRestrictInternet' function."
}

# Function to reset internet access and remove the proxy
function ResetRestrictInternet {
    [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy($null)
    Write-Output "Internet access has been restored. The fake proxy has been removed."
}

# Main script block

# Check command-line arguments
if ($args.Count -eq 0) {
    Write-Output "Usage: defend.ps1 <argument>"
    Write-Output "Available arguments:"
    Write-Output "- testInternetAccess: Test internet access"
    Write-Output "- enableRestrictInternet: Restrict internet access by setting proxy"
    Write-Output "- resetRestrictInternet: Reset internet access by removing the fake proxy"
} else {
    $argument = $args[0]
    switch ($argument) {
        "testInternetAccess" {
            TestInternetAccess
        }
        "enableRestrictInternet" {
            EnableRestrictInternet
        }
        "resetRestrictInternet" {
            ResetRestrictInternet
        }
        default {
            Write-Output "Invalid argument. Available arguments: testInternetAccess, enableRestrictInternet, resetRestrictInternet"
        }
    }
}

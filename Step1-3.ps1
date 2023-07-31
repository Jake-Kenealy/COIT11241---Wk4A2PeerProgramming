# File: defend.ps1

# Function to test internet access
function TestInternetAccess {
    try {
        $url = "https://www.youtube.com/"  # Replace with the URL of a website you want to test
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing
        $statusCode = $response.StatusCode

        if ($statusCode -eq 200) {
            Write-Host "Internet access test successful. HTTP status code: $statusCode"
        } else {
            Write-Host "Internet access test failed. HTTP status code: $statusCode"
        }
    } catch {
        Write-Host "An error occurred while testing internet access: $_. Exception type: $($_.Exception.GetType().FullName)"
    }
}

# Test internet access
TestInternetAccess

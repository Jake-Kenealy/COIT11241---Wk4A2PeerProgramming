# Function to restrict internet access
function EnableRestrictInternet {
    [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy("http://proxy",$true)
    Write-Output "Internet access has been restricted. To restore internet access, run the script again without any arguments."
}

# Test restrict internet access
EnableRestrictInternet

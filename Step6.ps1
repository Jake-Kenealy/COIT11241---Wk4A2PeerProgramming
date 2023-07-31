# Function to reset internet access and remove the proxy
function ResetRestrictInternet {
    [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy($null)
    Write-Output "Internet access has been restored. The fake proxy has been removed."
}

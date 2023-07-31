COIT11241---Wk4A2-Peer-Programming 2023 HT2
Powershell script to restrict admin internet

To ensure the script runs, check the execution policy via Get-ExecutionPolicy to determine the current setting. If set to "Restricted," it may need to get changed to "RemoteSigned" or "Unrestricted"

This is done by setting: Set-ExecutionPolicy RemoteSigned

Running the script involves navigating to the script location and invoking it by .\defend.ps1


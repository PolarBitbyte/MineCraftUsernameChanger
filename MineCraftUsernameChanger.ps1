<#
.SYNOPSIS
    Changes the display name for Minecraft.
    Tested on versions:
    1.11                [Success]
    1.10.2              [Success]
    Pervious Versions   [Untested]

.DESCRIPTION
    Changes the display name for the active profile in Minecraft
    to the $MCUSerName variable. This allows multiple users to 
    connect to a Minecraft server from the same account. This is 
    for connections on the local LAN only as the Minecraft server 
    needs to be in offline mode. 
.NOTES
    File Name      : MineCraftUsernameChanger.ps1
    Version        : 1.0

#>

$MCUserName = "DifferentUsername"
$LP = $env:APPDATA+'\.minecraft\launcher_profiles.json'


$MCProfile = ConvertFrom-Json -InputObject (Gc $LP -Raw)
$MCUser = $MCProfile.selectedUser
$OldMCUserName = $MCProfile.authenticationDatabase.$MCUser.displayName
$MCProfile.authenticationDatabase.$MCUser.displayName = $MCUserName

$MCProfile | ConvertTo-Json | set-content $LP

Write-Host "Minecraft display name changed from $OldMCUserName to $MCUserName."

Write-Host "Press any key to exit."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

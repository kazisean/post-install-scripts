# Set homepage URL
$homepageUrl = "https://www.google.com"

# Get Chrome user data directory
$userDataDir = "$env:LOCALAPPDATA\Google\Chrome\User Data"

# Set homepage in default profile
$defaultProfileDir = Join-Path $userDataDir "Default"
$preferencesFile = Join-Path $defaultProfileDir "Preferences"

$preferences = Get-Content $preferencesFile | ConvertFrom-Json
$preferences.homepage = $homepageUrl
$preferences | ConvertTo-Json | Set-Content $preferencesFile

# Set homepage in any other existing profiles
$otherProfiles = Get-ChildItem $userDataDir | Where-Object {$_.Name -ne "Default"}
foreach ($profile in $otherProfiles) {
  $preferencesFile = Join-Path $profile.FullName "Preferences"
  $preferences = Get-Content $preferencesFile | ConvertFrom-Json
  $preferences.homepage = $homepageUrl
  $preferences | ConvertTo-Json | Set-Content $preferencesFile
}

# Relaunch Chrome for changes to take effect
& "C:\Program Files\Google\Chrome\Application\chrome.exe"
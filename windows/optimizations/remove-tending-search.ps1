Write-Output "Disabling Trending Searches"
New-FolderForced -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer"
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" "DisableSearchBoxSuggestions" 1
function Uninstall-AppxPackage {
    param(
        [string]$packageName
    )
    
    try {
        Get-AppxPackage $packageName | Remove-AppxPackage -ErrorAction Stop
        Write-Host "$packageName app removed"
    } catch {
        Write-Host "$packageName app already uninstalled"
    }
}

Uninstall-AppxPackage -packageName 'Microsoft.Getstarted'
Write-Host "Microsoft Tips app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Getstarted'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.Getstarted'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.Messaging'
Write-Host "Microsoft Messaging app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Messaging'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.Messaging'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.MixedReality.Portal'
Write-Host "Mixed Reality Portal app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.MixedReality.Portal'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.MixedReality.Portal'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.WindowsFeedbackHub'
Write-Host "Feedback Hub app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.WindowsFeedbackHub'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.WindowsFeedbackHub'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.MicrosoftSolitaireCollection'
Write-Host "Microsoft Solitaire Collection app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.MicrosoftSolitaireCollection'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.MicrosoftSolitaireCollection'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.Windows.Photos'
Write-Host "Microsoft Photos app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Windows.Photos'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.Windows.Photos'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.SkypeApp'
Write-Host "Skype app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.SkypeApp'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.SkypeApp'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'PandoraMediaInc.29680B314EFC2'
Write-Host "Pandora app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'PandoraMediaInc.29680B314EFC2'; if (!$package) { Write-Error ""Cannot reinstall 'PandoraMediaInc.29680B314EFC2'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'D5EA27B7.Duolingo-LearnLanguagesforFree'
Write-Host "Duolingo app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'D5EA27B7.Duolingo-LearnLanguagesforFree'; if (!$package) { Write-Error ""Cannot reinstall 'D5EA27B7.Duolingo-LearnLanguagesforFree'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'ClearChannelRadioDigital.iHeartRadio'
Write-Host "iHeartRadio app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'ClearChannelRadioDigital.iHeartRadio'; if (!$package) { Write-Error ""Cannot reinstall 'ClearChannelRadioDigital.iHeartRadio'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName '9E2F88E3.Twitter'
Write-Host "Twitter app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers '9E2F88E3.Twitter'; if (!$package) { Write-Error ""Cannot reinstall '9E2F88E3.Twitter'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Flipboard.Flipboard'
Write-Host "Flipboard app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Flipboard.Flipboard'; if (!$package) { Write-Error ""Cannot reinstall 'Flipboard.Flipboard'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'king.com.CandyCrushSaga'
Uninstall-AppxPackage -packageName 'king.com.CandyCrushSodaSaga'
Write-Host "Candy Crush Saga app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'king.com.CandyCrushSaga'; if (!$package) { Write-Error ""Cannot reinstall 'king.com.Candy

Uninstall-AppxPackage -packageName 'ShazamEntertainmentLtd.Shazam'
Write-Host "Shazam app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'ShazamEntertainmentLtd.Shazam'; if (!$package) { Write-Error ""Cannot reinstall 'ShazamEntertainmentLtd.Shazam'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Write-Host "--- Remove Meet Now icon from taskbar (revert)"
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /f

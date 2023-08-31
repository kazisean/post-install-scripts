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

Write-Host "Microsoft Tips app removed"
Uninstall-AppxPackage -packageName 'Microsoft.Getstarted'

Write-Host "Microsoft Messaging app removed"
Uninstall-AppxPackage -packageName 'Microsoft.Messaging'

Write-Host "Mixed Reality Portal app removed"
Uninstall-AppxPackage -packageName 'Microsoft.MixedReality.Portal'

Write-Host "Feedback Hub app removed"
Uninstall-AppxPackage -packageName 'Microsoft.WindowsFeedbackHub'

Write-Host "Microsoft Solitaire Collection app removed"
Uninstall-AppxPackage -packageName 'Microsoft.MicrosoftSolitaireCollection'

Write-Host "Microsoft Photos app removed"
Uninstall-AppxPackage -packageName 'Microsoft.Windows.Photos'

Write-Host "Skype app removed"
Uninstall-AppxPackage -packageName 'Microsoft.SkypeApp'

Write-Host "Shazam app removed"
Uninstall-AppxPackage -packageName 'ShazamEntertainmentLtd.Shazam'

Write-Host "Candy Crush Saga app removed"
Uninstall-AppxPackage -packageName 'king.com.CandyCrushSaga'
Uninstall-AppxPackage -packageName 'king.com.CandyCrushSodaSaga'

Write-Host "Flipboard app removed"
Uninstall-AppxPackage -packageName 'Flipboard.Flipboard'

Write-Host "Twitter app removed"
Uninstall-AppxPackage -packageName '9E2F88E3.Twitter'

Write-Host "iHeartRadio app removed"
Uninstall-AppxPackage -packageName 'ClearChannelRadioDigital.iHeartRadio'

Write-Host "Duolingo app removed"
Uninstall-AppxPackage -packageName 'D5EA27B7.Duolingo-LearnLanguagesforFree'

Write-Host "Pandora app removed"
Uninstall-AppxPackage -packageName 'PandoraMediaInc.29680B314EFC2'

Write-Host "Unpin Widgets from taskbar removed"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f

Write-Host "Meet Now icon from taskbar removed"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f

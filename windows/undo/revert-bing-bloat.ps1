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

Uninstall-AppxPackage -packageName 'Microsoft.BingWeather'
Write-Host "MSN Weather app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.BingWeather'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.BingWeather'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.BingSports'
Write-Host "MSN Sports app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.BingSports'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.BingSports'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.BingNews'
Write-Host "MSN News app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.BingNews'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.BingNews'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

Uninstall-AppxPackage -packageName 'Microsoft.BingFinance'
Write-Host "MSN Money app (revert)"
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.BingFinance'; if (!$package) { Write-Error ""Cannot reinstall 'Microsoft.BingFinance'"" -ErrorAction Stop }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register ""$manifest"""

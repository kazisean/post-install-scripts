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

PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingWeather' | Remove-AppxPackage"
Write-Host "MSN Weather app removed"

PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingSports' | Remove-AppxPackage"
Write-Host "MSN Sports app removed"

PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingNews' | Remove-AppxPackage"
Write-Host "MSN News app removed"

PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingFinance' | Remove-AppxPackage"
Write-Host "MSN Money app removed"

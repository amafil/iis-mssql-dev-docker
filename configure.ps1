Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord

Write-Host "Enabling feature: IIS-WebServerRole"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

Write-Host "Enabling feature: IIS-WebServer"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer

Write-Host "Enabling feature: IIS-CommonHttpFeatures"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures

Write-Host "Enabling feature: IIS-HttpErrors"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors

Write-Host "Enabling feature: IIS-HttpRedirect"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect

Write-Host "Enabling feature: IIS-ApplicationDevelopment"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment

# Write-Host "Enabling feature: NetFx4Extended-ASPNET45"
# Enable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45

# Write-Host "Enabling feature: IIS-NetFxExtensibility45"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45

Write-Host "Enabling feature: IIS-ASPNET45"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All

# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging

# Write-Host "Enabling feature: IIS-LoggingLibraries"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries

# Write-Host "Enabling feature: IIS-RequestMonitor"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor

# Write-Host "Enabling feature: IIS-HttpTracing"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing

Write-Host "Enabling feature: IIS-Security"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security

# Write-Host "Enabling feature: IIS-RequestFiltering"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance

Write-Host "Enabling feature: IIS-WebServerManagementTools"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility

# Write-Host "Enabling feature: IIS-Metabase"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole

Write-Host "Enabling feature: IIS-BasicAuthentication"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication

Write-Host "Enabling feature: IIS-WindowsAuthentication"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication

Write-Host "Enabling feature: IIS-StaticContent"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent

Write-Host "Enabling feature: IIS-DefaultDocument"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets

# Write-Host "Enabling feature: IIS-ApplicationInit"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit

# Write-Host "Enabling feature: IIS-ISAPIExtensions"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions

# Write-Host "Enabling feature: IIS-ISAPIFilter"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter

# Write-Host "Enabling feature: IIS-HttpCompressionStatic"
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic

choco install dotnetcore-3.1-windowshosting -y
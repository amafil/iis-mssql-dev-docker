[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null

Write-Host "Starting MSSQLSERVER"
Start-Service MSSQLSERVER

# install dacframework
C:\utils\DacFramework.msi

$sa_password = 'personalPassword0' 

Write-Verbose "Changing SA login credentials"
$sqlcmd = "ALTER LOGIN sa with password=" +"'" + $sa_password + "'" + ";ALTER LOGIN sa ENABLE;"
sqlcmd -Q $sqlcmd

$Stoploop = $false
$Retrycount = 0							
do {	
    try {        
        Invoke-Sqlcmd -ServerInstance localhost -Database master -Username sa -Password $sa_password -Query "SELECT 1" -InformationAction Ignore *>> sqlpoll.log
        Write-Host "Service MSSQLSERVER started"
        $Stoploop = $true
    }
    catch {  
		$Retrycount = $Retrycount + 1	
		Write-Host $_
		Write-Host "MSSQLSERVER not ready (retry $Retrycount)"
		Start-Sleep -Seconds 15		
    }
}
While ($Stoploop -eq $false)	

$sqlcmd = "sp_addlinkedserver localhost"
sqlcmd -Q $sqlcmd

C:\ServiceMonitor.exe w3svc
# escape=`
FROM filoa86/mssql-dev:2019

#Installazione IIS 
RUN powershell -Command `
    Add-WindowsFeature Web-Server; `
    Invoke-WebRequest -UseBasicParsing -Uri "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.10/ServiceMonitor.exe" -OutFile "C:\ServiceMonitor.exe"

EXPOSE 80
EXPOSE 1433

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /inetpub/wwwroot

# Install IISRewrite Module
ADD http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi c:/inetpub/rewrite_amd64_en-US.msi
# Command line text editor utility
ADD https://github.com/zyedidia/micro/releases/download/v2.0.10/micro-2.0.10-win64.zip C:\utils\micro-2.0.10-win64.zip
RUN powershell -Command Start-Process c:/inetpub/rewrite_amd64_en-US.msi -ArgumentList "/qn" -Wait

ADD "https://download.visualstudio.microsoft.com/download/pr/5b681079-0068-4c70-be77-af30f1154a83/cd5d074d8328fbc0b3bebf87c88ae082/dotnet-hosting-3.1.22-win.exe" "c:\utils\dotnet-hosting-3.1.22-win.exe"

COPY .\bootstrap.ps1 C:\scripts\
COPY .\configure.ps1 C:\scripts\

RUN "C:\Scripts\configure.ps1"

ENTRYPOINT "C:\Scripts\bootstrap.ps1"

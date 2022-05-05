# iis-mssql-dev

Windows docker image of IIS and SQL Server Developer

Includes:
- IIS URL Rewrite module
- .net core 3.1 runtime
- .net core 3.1 sdk
- Microsoft SQL Server Developer

Build image:

`docker build -t iis-mssql-dev .`

Start container:

`docker run -p 1433:1433 -p 80:80 -d filoa86/mssql-dev:latest -m 2g`

Default SQL Server credentials:

```
Username: sa
Password: personalPassword0
```

if you want to change default password edit `Dockerfile`

```
    ...
ENV sa_password="personalPassword0" \
    ...
```

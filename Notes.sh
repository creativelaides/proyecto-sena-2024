
# --- Dependencies ---
#1. Dependencies principales del proyecto
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.6
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 8.0.2
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL --version 8.0.4
dotnet add package Microsoft.EntityFrameworkCore.Design --version 8.0.6
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design --version 8.0.2

# --- Dependencies CLI ---
#2. Manifest que permite ejecutar los comandos de las dependencias locales de tu proyecto
dotnet new tool-manifest

#2.2 Añade al manifest Entity Framework Core
dotnet tool install --local dotnet-ef

#2.2.1 Ejecuta las migraciones
dotnet Add-Migration InitialCreate
dotnet ef database update

#2.3 Añade al manifest Asp.NET Code Generator Tool
dotnet tool install --local dotnet-aspnet-codegenerator

#2.3.1 Ayuda | Genera el código del "controller" de un "model" de la API (se especifica postgres db)
dotnet aspnet-codegenerator controller -h
dotnet aspnet-codegenerator controller -name PersonController -async -api -m Person -dc AppDbContext -outDir Controllers -dbProvider postgres

# --- Otros Elementos del Proyecto ---
#3.1 Crea alias de .gitnore que usa toptal.com
git config --global alias.ignore '!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ > .gitignore ;}; gi'
#3.1 Consultas los alias | genera un .gitignore que omite basura de Asp.NET y VSCode | inicia git | Añade elementos al stage >>> Usa Commit Convetional Plugin para el commit | sube el tag que determines | push de tags | push de commit
git config --get-regexp alias
git ignore aspnetcore,visualstudiocode

#3.2 Inicia un repositorio de Git
git init
git add .
#git commit (usar plugin)

# --- Antes de avanzar en el PUSH y TAGS es necesario logearse en el GitHub CLI ---
gh auth login #seguir las indicaciones
gh repo create ${"repositorio web"} #seguir las indicaciones
gh repo list

git log --oneline 
git remote add origin ${"user/repositorio web"} 
git tag -a v0.0.0 -m ${"message"} ${hashcode}
git push --tags
git push
# Etapa 1: Compilación
# Usamos la imagen del SDK de .NET 8 para compilar el proyecto.
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiamos los archivos .csproj y restauramos las dependencias primero.
# Esto aprovecha el caché de Docker y acelera las compilaciones futuras.
COPY ["WorldCupGuide.csproj", "."]
RUN dotnet restore "./WorldCupGuide.csproj"

# Copiamos el resto del código fuente y compilamos la aplicación.
COPY . .
WORKDIR "/src/."
# Publicamos la aplicación en modo Release, optimizada para producción.
RUN dotnet publish "WorldCupGuide.csproj" -c Release -o /app/publish

# Etapa 2: Imagen Final
# Usamos la imagen de ASP.NET Runtime, que es mucho más ligera que el SDK.
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Exponemos el puerto 8080 para que el contenedor pueda recibir tráfico HTTP.
EXPOSE 8080
# El comando que se ejecutará cuando el contenedor inicie.
ENTRYPOINT ["dotnet", "WorldCupGuide.dll"]


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["ProyectoWeb2/ProyectoWeb2.csproj", "ProyectoWeb2/"]
RUN dotnet restore "ProyectoWeb2/ProyectoWeb2.csproj"

COPY . .
WORKDIR "/src/ProyectoWeb2"
RUN dotnet publish "ProyectoWeb2.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 8080
ENTRYPOINT ["dotnet", "ProyectoWeb2.dll"]

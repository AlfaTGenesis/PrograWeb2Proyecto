using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.EntityFrameworkCore.Design;
using ProyectoWeb2.Models;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.WithOrigins(
                                "https://localhost:7268", // El origen de tu Kestrel (Frontend VS)
                                "http://localhost:7268",  // Por si acaso corre en http
                                "http://localhost:8000"   // El origen de tu Docker (Frontend Docker)
                              )
                              .AllowAnyHeader()
                              .AllowAnyMethod();
                      });
});

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString),
    mySqlOptions => mySqlOptions.EnableRetryOnFailure())
);

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:SecretKey"]!))
    };
});

builder.Services.AddAuthorization();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddControllersWithViews();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "WorldCupGuide API", Version = "v1" });


    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = "Autorización JWT usando el esquema Bearer. Ejemplo: \"Bearer {token}\"",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                },
                Scheme = "oauth2",
                Name = "Bearer",
                In = ParameterLocation.Header,
            },
            new List<string>()
        }
    });
});

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//app.UseHttpsRedirection();

app.UseRouting();

app.UseCors(MyAllowSpecificOrigins);

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.UseDefaultFiles();
app.UseStaticFiles();



ApplyMigrationsAndSeedData(app);

app.Run();



static void ApplyMigrationsAndSeedData(IHost app)
{
    using (var scope = app.Services.CreateScope())
    {
        var services = scope.ServiceProvider;
        var logger = services.GetRequiredService<ILogger<Program>>();
        try
        {
            var context = services.GetRequiredService<ApplicationDbContext>();
            logger.LogInformation("Iniciando lógica de migración y siembra de base de datos...");
           

            int maxRetries = 10;
            int delaySeconds = 5;
            bool dbReady = false;

            for (int i = 0; i < maxRetries; i++)
            {
                try
                {
                    context.Database.CanConnect();
                    dbReady = true;
                    logger.LogInformation("Conexión con la base de datos exitosa.");
                    break; // Sale del bucle si la conexión es exitosa
                }
                catch (Exception ex)
                {
                    logger.LogWarning($"Intento {i + 1}/{maxRetries}: No se pudo conectar a la base de datos. Reintentando en {delaySeconds} segundos...");
                    Task.Delay(TimeSpan.FromSeconds(delaySeconds)).Wait();
                }
            }

            if (!dbReady)
            {
                logger.LogError("No se pudo conectar a la base de datos después de varios intentos. La aplicación no podrá aplicar migraciones ni sembrar datos.");
                return; // Aborta la función si no se pudo conectar
            }

            logger.LogInformation("Aplicando migraciones de base de datos...");
            context.Database.Migrate();
            logger.LogInformation("Migraciones aplicadas exitosamente.");

            if (!context.Stadiums.Any())
            {
                logger.LogInformation("Base de datos vacía, sembrando datos desde data_seed.sql...");

                string sqlScript = File.ReadAllText("data_seed.sql");

                context.Database.ExecuteSqlRaw(sqlScript);

                logger.LogInformation("Datos sembrados exitosamente.");
            }
            else
            {
                logger.LogInformation("La base de datos ya contiene datos, no se sembrará.");
            }
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "Un error ocurrió al aplicar migraciones o sembrar la base de datos.");
        }
    }
}

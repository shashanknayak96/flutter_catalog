using System.Text;
using catalog.api.Models;
using catalog.api.Services;
using catalog.db;
using catalog.db.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

builder.Services.Configure<DatabaseManager>(builder.Configuration.GetSection("DatabaseManager"));

var jwtSettings = new JwtSettings();
builder.Configuration.Bind(nameof(jwtSettings), jwtSettings);
builder.Services.AddSingleton(jwtSettings);

builder.Services.AddSingleton<IDatabaseSettings, DatabaseSettings>();

// Services
builder.Services.AddSingleton<UserService>();
builder.Services.AddSingleton<AdvertisementService>();
builder.Services.AddSingleton<CategoryService>();
builder.Services.AddSingleton<ProductService>();
builder.Services.AddSingleton<IUserControllerService, UserControllerService>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(builder =>
    {
        builder.WithOrigins("*").AllowAnyHeader()
                            .AllowAnyMethod();
    });
});

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddAuthentication(x => {
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x => {
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters{
        ValidateIssuerSigningKey = true, 
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(builder.Configuration.GetSection("JWTSecretKey").ToString())),
        ValidateIssuer = false,
        ValidateAudience = false,
        RequireExpirationTime = false,
        ValidateLifetime = true    
    };
});

builder.Services.AddSwaggerGen(x => {
    x.SwaggerDoc("v1", new OpenApiInfo{Title = "CatalogApp",Version = "v1"});
    x.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme{
        Description = "JWT Authorization",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey
    });

    x.AddSecurityRequirement(new OpenApiSecurityRequirement()
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                },
                Scheme = "JWT",
                Name = "Bearer",
                In = ParameterLocation.Header,
            },
            new List<string>()
        }
    });
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();

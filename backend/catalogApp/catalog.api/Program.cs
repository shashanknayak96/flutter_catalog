using System.Text;
using catalog.api.Models;
using catalog.api.Services;
using catalog.api.Services.Interfaces;
using catalog.db;
using catalog.db.Services;
using catalog.db.Services.Interface;
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
builder.Services.AddSingleton(typeof(IService<>), typeof(Service<>));
builder.Services.AddSingleton<IAdvertisementService, AdvertisementService>();
builder.Services.AddSingleton<ICategoryService, CategoryService>();
builder.Services.AddSingleton<IUserService, UserService>();
builder.Services.AddSingleton<ITokenService, TokenService>();
builder.Services.AddSingleton<IProductService, ProductService>();

builder.Services.AddCors(options =>
{
	options.AddDefaultPolicy(builder =>
	{
		builder.WithOrigins("*").AllowAnyHeader()
							.AllowAnyMethod();
	});
});

builder.Services.AddAuthentication(x => {
	x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
	x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(x => {
	var key = Encoding.ASCII.GetBytes(builder.Configuration["JwtSettings:Secret"]);
	x.SaveToken = true;
	x.TokenValidationParameters = new TokenValidationParameters{
		ValidateIssuer = false,
		ValidateAudience = false,
		ValidateLifetime = true,
		ValidateIssuerSigningKey = true,
		IssuerSigningKey = new SymmetricSecurityKey(key),
		ClockSkew = TimeSpan.Zero
	};
});
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


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
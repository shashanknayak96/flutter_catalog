using catalog.db;
using catalog.db.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.Configure<catalog.db.ConfigurationManager>(builder.Configuration.GetSection("ConfigurationManager"));
builder.Services.AddSingleton<UserService>();
builder.Services.AddSingleton<AdvertisementService>();

builder.Services.AddSingleton<IDatabaseSettings, DatabaseSettings>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();

using catalog.db;
using catalog.db.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.Configure<DatabaseManager>(builder.Configuration.GetSection("DatabaseManager"));
builder.Services.AddSingleton<IDatabaseSettings, DatabaseSettings>();

// Services
builder.Services.AddSingleton<UserService>();
builder.Services.AddSingleton<AdvertisementService>();
builder.Services.AddSingleton<CategoryService>();
builder.Services.AddSingleton<ProductService>();

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

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run();

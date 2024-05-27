using Achaia.Whiskey.Api.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

const string ReactLocalDevOrigin = "ReactLocalDevOrigin";
builder.Services.AddCors(options =>
{
    options.AddPolicy(ReactLocalDevOrigin, builder => builder.WithOrigins("http://localhost:5173"));
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<WhiskeyDbContext>(options => options.UseSqlServer(@"Server=localhost\SQLEXPRESS;Database=WhiskeyInventory;Trusted_Connection=True;TrustServerCertificate=True;ConnectRetryCount=0"));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors(ReactLocalDevOrigin);
app.UseAuthorization();

app.MapControllers();

app.Run();

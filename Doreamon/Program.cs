using Doreamon.Data; 
using Doreamon.Helper;
using Doreamon.Repositories;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy => policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());
});

builder.Services.AddDbContext<DoreamonWebContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DoreamonStore"));
});

builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ICartRepository, CartRepository>();

builder.Services.AddAutoMapper(typeof(ApplicationMappper));
var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseCors(); 
}
app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();
// Import các namespace cần thiết
using Doreamon.Data;
using Doreamon.Helper;
using Doreamon.Repositories;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Thêm CORS vào services
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy => policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());
});

builder.Services.AddDbContext<DoreamonWebContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DoreamonStore"));
});

//Thêm session
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession((option) =>
{
    option.Cookie.Name = "DoraemonStore";
    option.IdleTimeout = new TimeSpan(0, 30, 0);
});

builder.Services.AddScoped<IProductRepository, ProductRepository>();

builder.Services.AddAutoMapper(typeof(ApplicationMappper));
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseCors(); // Bỏ tên policy, sử dụng default policy
}
app.UseSession();
app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();
using GoAnime.Core.CartFunctionality;
using GoAnime.Core.Interfaces;
using GoAnime.Core.Services;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<AnimeDbContext>(options => options.UseSqlServer(Configuration
                .GetConnectionString("DefaultConnectionString")));
            services.AddControllersWithViews();

            services.AddScoped<IVoiceActorsService, VoiceActorsService>();
            services.AddScoped<IProducersService, ProducersService>();
            services.AddScoped<IStudiosService, StudioService>();
            services.AddScoped<IAnimeService, AnimeService>();
            services.AddScoped<IOrderService, OrderService>();

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped(v => Cart.GetCart(v));

            services.AddIdentity<AnimeFan, IdentityRole>().AddEntityFrameworkStores<AnimeDbContext>();
            services.AddMemoryCache();
            services.AddSession();
            services.AddAuthentication(v => v.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseSession();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            AnimeDbInitializer.Seed(app);
            AnimeDbInitializer.SeedUsersAndRolesAsync(app).Wait();
        }
    }
}

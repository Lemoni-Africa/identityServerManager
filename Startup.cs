
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using DataAccess.Data;
using IdentityServer4.AccessTokenValidation;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Mappers;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using OnePaySystem.DataAccess.Repository;
using OnePaySystem.DataAccess.Repository.IRepository;
using OnePaySystem.Models.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace IdentityServer
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IWebHostEnvironment environment)
        {
            Configuration = configuration;
            _environment = environment;
        }

        public IConfiguration Configuration { get; }
        public IWebHostEnvironment _environment { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            string password = Configuration["Jwt:Secret"];
            Debug.Assert(!string.IsNullOrEmpty(password), "Jwt:Secret is missing from appsettings");
            string certificate = Configuration["Jwt:Certificate"];
            Debug.Assert(!string.IsNullOrEmpty(certificate), "Jwt:Certificate is missing from appsettings");
            services.AddDbContext<DataContext>(x => x.UseSqlServer(Configuration.GetConnectionString("ServiceStringMsSql")
                , builder =>
                {
                    builder.EnableRetryOnFailure(5, TimeSpan.FromSeconds(10), null);
                }));

            var cert = new X509Certificate2(
                certificate,
                password,
                X509KeyStorageFlags.MachineKeySet |
                X509KeyStorageFlags.PersistKeySet |
                X509KeyStorageFlags.Exportable
            );
            services.AddCors();
            services.AddControllers();
            services.AddMvc();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "IdentityServer", Version = "v1" });
            });
            string migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;
            string connectionString = Configuration.GetConnectionString("ServiceStringMsSql");
            var builder = services.AddIdentityServer(options =>
                {
                    options.MutualTls.Enabled = true;
                    options.MutualTls.ClientCertificateAuthenticationScheme = "x509";
                    

                })
                .AddConfigurationStore(options =>
                {
                    options.ConfigureDbContext = b => b.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(migrationsAssembly));
                })
                .AddOperationalStore(options =>
                {
                    options.ConfigureDbContext = b => b.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(migrationsAssembly));
                    options.EnableTokenCleanup = true;
                    
                    options.TokenCleanupInterval = 3600;

                })
                //.AddDeveloperSigningCredential();
                .AddSigningCredential(cert);

            string authority = this.Configuration.GetSection("Authority").Value;
            var validIssuerString = Configuration.GetSection("ValidIssuers").Value;
            string[] validIssuerList = validIssuerString.Split(';');
            builder.AddJwtBearerClientAuthentication();
            services.AddAuthentication(IdentityServerAuthenticationDefaults.AuthenticationScheme)
                .AddIdentityServerAuthentication(
                    IdentityServerAuthenticationDefaults.AuthenticationScheme,
                    jwtOptions =>
                    {
                        jwtOptions.Authority = authority;
                        jwtOptions.RequireHttpsMetadata = false;

                        //Get Valid Issuers

                        jwtOptions.TokenValidationParameters.ValidIssuers = validIssuerList;
                        //jwtOptions.TokenValidationParameters.ValidateIssuerSigningKey = false;
                        //jwtOptions.TokenValidationParameters.ValidateActor = false;

                    },
                    null
                );
            services.AddAutoMapper(typeof(Startup).Assembly);
            services.AddScoped<IUseDapperRepository, UseDapperRepository>();
            services.AddScoped<IAPIAuthRepository, APIAuthRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseCors(
                options => options.AllowAnyMethod().AllowAnyHeader().AllowAnyOrigin()
            );
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "IdentityServer v1"));
            InitializeDatabase(app);
            app.UseStaticFiles();
            //app.UseHttpsRedirection();

            app.UseRouting();
            app.UseIdentityServer();

            app.UseAuthorization();
            
            // app.UseValidateHeaders();

            //app.UseMiddleware<AdminSafeListMiddleware>(Configuration["AdminSafeList"]);
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        private void InitializeDatabase(IApplicationBuilder app)
        {
            using (var serviceScope = app.ApplicationServices.GetService<IServiceScopeFactory>().CreateScope())
            {
                serviceScope.ServiceProvider.GetRequiredService<PersistedGrantDbContext>().Database.Migrate();

                var context = serviceScope.ServiceProvider.GetRequiredService<ConfigurationDbContext>();
                context.Database.Migrate();
                if (!context.Clients.Any())
                {
                    foreach (var client in Config.Clients)
                    {
                        context.Clients.Add(client.ToEntity());
                    }
                    context.SaveChanges();
                }

                if (!context.IdentityResources.Any())
                {
                    foreach (var resource in Config.IdentityResources)
                    {
                        context.IdentityResources.Add(resource.ToEntity());
                    }
                    context.SaveChanges();
                }

                if (!context.ApiScopes.Any())
                {
                    foreach (var resource in Config.ApiScopes)
                    {
                        context.ApiScopes.Add(resource.ToEntity());
                    }
                    context.SaveChanges();
                }
            }
        }
    }
}

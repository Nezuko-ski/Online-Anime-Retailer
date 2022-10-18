using GoAnime.Domain.Enums;
using GoAnime.Domain.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GoAnime.Infrastructure
{
    public class AnimeDbInitializer
    {
        public static void Seed(IApplicationBuilder applicationBuilder)
        {
            {
                using (var serviceScope = applicationBuilder.ApplicationServices.CreateScope())
                {
                    var context = serviceScope.ServiceProvider.GetService<AnimeDbContext>();
                    context.Database.EnsureCreated();
                    if (!context.Studios.Any())
                    {
                        context.Studios.AddRange(new List<Studio>()
                        {
                             new Studio
                            {
                                 Name = "White Fox",
                                 Logo = "https://cdn.myanimelist.net/img/common/companies/314.png",
                                 Description = "White Fox Co., Ltd is a Japanese animation studio founded in April 2007 by Gaku Iwasa."
                            },
                             new Studio
                             {
                                 Name = "Kyoto Animation",
                                 Logo = "https://cdn.myanimelist.net/img/common/companies/2.png",
                                 Description = "Kyoto Animation is a Japanese animation studio based in Uji, Kyoto Prefecture."
                             },
                             new Studio
                             {
                                Name = "ufotable",
                                Logo = "https://cdn.myanimelist.net/img/common/companies/43.png",
                                Description = "ufotable is a Japanese animation studio based in Suginami, Tokyo."
                             }
                        });
                        context.SaveChanges();
                    }
                    if (!context.VoiceActors.Any())
                    {
                        context.VoiceActors.AddRange(new List<VoiceActor>()
                        {
                            new VoiceActor
                            {
                                FullName = "Jouji Nakata",
                                ProfilePictureURL = "https://cdn.myanimelist.net/images/voiceactors/3/58788.jpg",
                                Bio = "This is the bio of the voice actor for Kotomine Kirei in Fate."
                            },
                            new VoiceActor
                            {
                                FullName = "Ogura Yui",
                                ProfilePictureURL = "https://cdn.myanimelist.net/images/voiceactors/3/66832.jpg",
                                Bio = "This is the bio of the voice actor for Onna in Goblin Slayer."
                            },
                            new VoiceActor
                            {
                                FullName = "Yui Ishikawa",
                                ProfilePictureURL = "https://cdn.myanimelist.net/images/voiceactors/2/69967.jpg",
                                Bio = "This is the bio of the voice actor for Violet in Violet Evergarden."
                            },
                        });
                        context.SaveChanges();
                    }
                    if (!context.Producers.Any())
                    {
                        context.Producers.AddRange(new List<Producer>()
                       {
                          new Producer
                          {
                                FullName = "Frontier Works",
                                ProfilePictureURL = "https://cdn.myanimelist.net/img/common/companies/61.png",
                                Bio = "Frontier Works Inc has produced Steins;Gate, Shield Hero, Goblin Slayer and much more."
                          },
                          new Producer
                          {
                                FullName = "Lantis",
                                ProfilePictureURL = "https://cdn.myanimelist.net/img/common/companies/104.png",
                                Bio = "Lantis has produced One Punch Man, Violet Evergarden, Gangsta and much more."
                          },
                          new Producer
                          {
                                FullName = "Aniplex",
                                ProfilePictureURL = "https://cdn.myanimelist.net/img/common/companies/17.png",
                                Bio = "Aniplex has produced Naruto, Demon Slayer, Bleach and much more."
                          }
                       });
                        context.SaveChanges();
                    }
                    if (!context.Anime.Any())
                    {
                        context.Anime.AddRange(new List<Anime>()
                        {
                            new Anime
                            {
                                Name = "Fate/stay night: Heaven's Feel - I",
                                Description  = "Theatrical release of the first part of the Heaven's Feel movie trilogy.",
                                Price = 39.50,
                                ImageURL = "https://cdn.myanimelist.net/images/anime/1274/102213.jpg",
                                AnimeGenre = AnimeGenre.Action,
                                StartDate = DateTime.Now,
                                EndDate = DateTime.Now.AddDays(5),
                                StudioId = 3,
                                ProducerId = 3
                            },
                            new Anime
                            {
                                Name = "Violet Evergarden",
                                Description  = "In the aftermath of a great war, Violet Evergarden, a young female ex-soldier, gets a job at a writers' agency and goes on assignments to create letters that can connect people.",
                                Price = 39.50,
                                ImageURL = "https://cdn.myanimelist.net/images/anime/1825/110716.jpg",
                                AnimeGenre = AnimeGenre.SliceOfLife,
                                StartDate = DateTime.Now,
                                EndDate = DateTime.Now.AddDays(9),
                                StudioId = 2,
                                ProducerId = 2
                            },
                             new Anime
                            {
                                Name = "Goblin Slayer",
                                Description  = "A young priestess has formed her first adventuring party, but almost immediately they find themselves in distress. It's the Goblin Slayer who comes to their rescue",
                                Price = 39.50,
                                ImageURL = "https://cdn.myanimelist.net/images/anime/1699/110724.jpg",
                                AnimeGenre = AnimeGenre.Adventure,
                                StartDate = DateTime.Now.AddDays(-10),
                                EndDate = DateTime.Now.AddDays(-2),
                                StudioId = 1,
                                ProducerId = 1
                            }
                        });
                        context.SaveChanges();
                    }
                    if (!context.VoiceActors_Anime.Any())
                    {
                        context.VoiceActors_Anime.AddRange(new List<VoiceActor_Anime>()
                        {
                            new VoiceActor_Anime
                            {
                                AnimeId = 1,
                                VoiceActorId = 1
                            },
                            new VoiceActor_Anime
                            {
                                AnimeId = 2,
                                VoiceActorId = 3
                            },
                            new VoiceActor_Anime
                            {
                                AnimeId = 3,
                                VoiceActorId = 2
                            }
                        });
                        context.SaveChanges();
                    }
                }
            }
        }
        public static async Task SeedUsersAndRolesAsync(IApplicationBuilder applicationBuilder)
        {
            using (var serviceScope = applicationBuilder.ApplicationServices.CreateScope())
            {
                //Roles
                var roleManager = serviceScope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
                if (!await roleManager.RoleExistsAsync(UserRoles.Admin.ToString()))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Admin.ToString()));
                if (!await roleManager.RoleExistsAsync(UserRoles.Customer.ToString()))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Customer.ToString()));

                //User
                var userManager = serviceScope.ServiceProvider.GetRequiredService<UserManager<AnimeFan>>();
                var adminUser = await userManager.FindByEmailAsync("admin@goanime.com");
                if (adminUser == null)
                {
                    var newAdminUser = new AnimeFan()
                    {
                        FullName = "Ainz Oaol Gown",
                        UserName = "Ainz-sama",
                        Email = "admin@goanime.com",
                        EmailConfirmed = true,
                    };
                    await userManager.CreateAsync(newAdminUser, "Nezuko@slayer4");
                    await userManager.AddToRoleAsync(newAdminUser, UserRoles.Admin.ToString());
                }

                var appUser = await userManager.FindByEmailAsync("user@goanime.com");
                if (appUser == null)
                {
                    var newAppUser = new AnimeFan()
                    {
                        FullName = "Hinata Sakaguchi",
                        UserName = "Hinata",
                        Email = "user@goanime.com",
                        EmailConfirmed = true,
                    };
                    await userManager.CreateAsync(newAppUser, "Nezuko@slayer4");
                    await userManager.AddToRoleAsync(newAppUser, UserRoles.Customer.ToString());
                }
            }
        }

    }
}

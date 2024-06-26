﻿using Microsoft.EntityFrameworkCore;

namespace Web.API;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {}

    public DbSet<Person> Persons { get; set; }
}

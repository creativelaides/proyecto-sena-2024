using Web.API;

public static class DataSeeder
{
    public static void SeedData(AppDbContext context)
    {
        if (!context.Persons.Any())
        {
            context.Persons.AddRange(
                new Person { Name = "Harry Potter", Age = 18 },
                new Person { Name = "Hermione Granger", Age = 18 },
                new Person { Name = "Ron Weasley", Age = 18 },
                new Person { Name = "Albus Dumbledore", Age = 150 },
                new Person { Name = "Severus Snape", Age = 38 },
                new Person { Name = "Sirius Black", Age = 35 },
                new Person { Name = "Luna Lovegood", Age = 17 },
                new Person { Name = "Draco Malfoy", Age = 18 },
                new Person { Name = "Ginny Weasley", Age = 17 },
                new Person { Name = "Neville Longbottom", Age = 18 }
            );
            context.SaveChanges();
        }
    }
}

using Microsoft.EntityFrameworkCore;

namespace Achaia.Whiskey.Api.Data
{
    public class WhiskeyDbContext : DbContext
    {
        public DbSet<Bottle> Bottles { get; set; }
        public DbSet<ReleaseType> ReleaseTypes { get; set; }    
        public DbSet<Distillery> Distilleries { get; set; }   

        public WhiskeyDbContext(DbContextOptions options) : base(options)
        {

        }
    }
}

using Microsoft.EntityFrameworkCore;

namespace MultimediaService.Context
{
    public class MultimediaContext : DbContext
    {
        public MultimediaContext(DbContextOptions<MultimediaContext> options) : base(options) { }

        public DbSet<Audio> Audios { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Video> Videos { get; set; }
    }
}

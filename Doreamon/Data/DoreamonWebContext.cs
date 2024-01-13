using Microsoft.EntityFrameworkCore;

namespace Doreamon.Data
{
    public class DoreamonWebContext:DbContext
    {
        public DoreamonWebContext(DbContextOptions<DoreamonWebContext>options) : base(options) { }
        #region DbSet
        public DbSet<Products>? Products { get; set; }
        #endregion
    }
}

using Microsoft.EntityFrameworkCore;
using XMLDemo.Web.Models;

namespace XMLDemo.Web.Models
{
    public class UploadFilecontext : DbContext
    {
        public UploadFilecontext(DbContextOptions<UploadFilecontext> options) : base(options)
        {
        }

        public DbSet<UploadFile> UploadFiles { get; set; }
    }
}
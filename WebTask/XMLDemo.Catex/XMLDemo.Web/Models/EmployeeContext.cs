using Microsoft.EntityFrameworkCore;
using XMLDemo.Web.Models;

namespace XMLDemo.Web.Models
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext(DbContextOptions<EmployeeContext> options) : base(options)
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}
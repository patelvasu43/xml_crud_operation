using SharpRepository.Repository;
using System;
using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;

namespace XMLDemo.Web.Models
{
    [Serializable]
    [XmlRoot(ElementName = "Employee", Namespace = "")]
    public partial class Employee
    {
        [RepositoryPrimaryKey]
        [XmlAttribute("ID")]
        public int Id { get; set; }

        [XmlAttribute("FirstName")]
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "First name required.")]
        public string FirstName { get; set; }

        [XmlAttribute("LastName")]
        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "Last name required.")]
        public string LastName { get; set; }

        [XmlAttribute("JoinDate")]
        [Display(Name = "Join Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime JoinDate { get; set; }

        //Added More field for Employee Chart Report
        [XmlAttribute("Country")]
        [Display(Name = "Country")]
        public string Country { get; set; }

        [XmlAttribute("Salary")]
        [Display(Name = "Salary")]
        public decimal Salary { get; set; }
    }
}

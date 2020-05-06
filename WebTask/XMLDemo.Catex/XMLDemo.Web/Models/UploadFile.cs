using SharpRepository.Repository;
using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;

namespace XMLDemo.Web.Models
{
    public class UploadFile
    {
        [RepositoryPrimaryKey]
        [XmlAttribute("ID")]
        public int Id { get; set; }

        [XmlAttribute("FileName")]
        [Display(Name = "File Name")]
        public string FileName { get; set; }

        [XmlAttribute("FileFullPath")]
        [Display(Name = "FilePath")]
        public string FileFullPath { get; set; }

        [XmlAttribute("FileUploadDateTime")]
        [Display(Name = "File Upload Date")]
        public string FileUploadDateTime { get; set; }
    }
}

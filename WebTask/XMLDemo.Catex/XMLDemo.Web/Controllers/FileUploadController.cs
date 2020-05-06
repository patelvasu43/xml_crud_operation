using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SharpRepository.Repository;
using XMLDemo.Web.Models;

namespace XMLDemo.Web.Controllers
{
    public class FileUploadController : Controller
    {
        protected IRepository<UploadFile, int> _fileRepository;
        private IHostingEnvironment _environment;
        public FileUploadController(IHostingEnvironment environment, IRepository<UploadFile, int> fileRepository)
        {
            _fileRepository = fileRepository;
            _environment = environment;
        }

        public IActionResult Index()
        {
            return View(_fileRepository.GetAll());
        }

        public ActionResult CustomDropZone()
        {
            return View();
        }

        public async Task<ActionResult> CustomDropZone_Save(IEnumerable<IFormFile> files)
        {
            if (files != null)
            {
                foreach (var file in files)
                {
                    var fileContent = ContentDispositionHeaderValue.Parse(file.ContentDisposition);

                    var fileName = Path.GetFileName(fileContent.FileName.ToString().Trim('"'));
                    var physicalPath = Path.Combine(_environment.WebRootPath, "App_Data", fileName);

                    string newFullPath = GetFileSaveFullPath(physicalPath);


                    using (var stream = System.IO.File.Create(newFullPath))
                    {
                        await file.CopyToAsync(stream);
                    }
                    UploadFile uploadFileModel = new UploadFile();
                    uploadFileModel.FileName = System.IO.Path.GetFileName(newFullPath);
                    uploadFileModel.FileFullPath = newFullPath;
                    uploadFileModel.FileUploadDateTime = DateTime.Now.ToLongDateString();
                    _fileRepository.Add(uploadFileModel);
                }
            }

            // Return an empty string to signify success
            return Content("");
        }

        public ActionResult CustomDropZone_Remove(string[] fileNames)
        {
            if (fileNames != null)
            {
                foreach (var fullName in fileNames)
                {
                    var fileName = Path.GetFileName(fullName);
                    var physicalPath = Path.Combine(_environment.WebRootPath, "App_Data", fileName);

                    // TODO: Verify user permissions

                    if (System.IO.File.Exists(physicalPath))
                    {
                        // The files are not actually removed in this demo
                        // System.IO.File.Delete(physicalPath);
                    }
                }
            }

            // Return an empty string to signify success
            return Content("");
        }

        [NonAction]
        public string GetFileSaveFullPath(string fullPath)
        {
            int count = 1;

            string fileNameOnly = Path.GetFileNameWithoutExtension(fullPath);
            string extension = Path.GetExtension(fullPath);
            string path = Path.GetDirectoryName(fullPath);
            string newFullPath = fullPath;

            while (System.IO.File.Exists(newFullPath))
            {
                string tempFileName = string.Format("{0}({1})", fileNameOnly, count++);
                newFullPath = Path.Combine(path, tempFileName + extension);
            }
            return newFullPath;
        }
    }
}
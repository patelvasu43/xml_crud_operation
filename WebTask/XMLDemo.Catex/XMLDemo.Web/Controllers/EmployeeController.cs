using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SharpRepository.Repository;
using XMLDemo.Web.Models;

namespace XMLDemo.Web.Controllers
{
    public class EmployeeController : Controller
    {
        #region Initialization

        protected IRepository<Employee, int> _repository;

        #endregion

        #region ctor

        public EmployeeController(IRepository<Employee, int> repository)
        {
            this._repository = repository;
        }

        #endregion

        #region Add/Update/Delete Action

        // GET: Employee
        public ActionResult Index()
        {

            return View(_repository.GetAll());
        }

        // GET: Employee/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Employee/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                _repository.Add(employee);

                return RedirectToAction(nameof(Index));
            }

            return View(employee);
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int id)
        {
            var employee = _repository.Get(id);
            return View(employee);
        }

        // POST: Employee/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, Employee employee)
        {
            try
            {
                _repository.Update(employee);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(int id)
        {
            var employee = _repository.Get(id);
            return View(employee);
        }

        // POST: Employee/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                _repository.Delete(id);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
        #endregion

        #region Chart Report Action
        public ActionResult EmployeeReport()
        {
            IEnumerable<EmployeeReport> employeeReports = _repository.AsQueryable().Where(x => x.Country != null).GroupBy(x => x.Country)
                         .Select(x => new EmployeeReport
                         {
                             Country = x.Key,
                             TotalSalary = x.Sum(y => y.Salary)
                         }
                         ).OrderByDescending(x => x.TotalSalary);

            return View(employeeReports);
        }
        #endregion
    }
}
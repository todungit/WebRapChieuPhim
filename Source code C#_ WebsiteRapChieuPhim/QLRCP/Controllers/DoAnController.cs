using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using QLRCP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLRCP.Controllers
{
    public class DoAnController : Controller
    {
        // GET: DoAn
        MyDataContext context = new MyDataContext();
        public ActionResult ListDoAn()
        {
            var all_DoAn = from da in context.DoAns select da;
            return View(all_DoAn);
        }

        public ActionResult Create()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(DoAn objDA)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            context.DoAns.Add(objDA);
            context.SaveChanges();
            return View(objDA);
        }
        public ActionResult Detail(int id)
        {
            var D_doAn = context.DoAns.Where(m => m.MaDA == id).First();
            return View(D_doAn);
        }

        public ActionResult Edit(int id)
        {
            var E_doAn = context.DoAns.First(m => m.MaDA == id);
            return View(E_doAn);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var doan = context.DoAns.First(m => m.MaDA == id);
            var E_tendoan = collection["TenDA"];
            var E_hinh = collection["Hinh"];

            doan.MaDA = id;
            if (string.IsNullOrEmpty(E_tendoan))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                doan.TenDA = E_tendoan;
                doan.Hinh = E_hinh;
                UpdateModel(doan);
                context.SaveChanges();
                return RedirectToAction("ListDoAn", "DoAn");
            }
            return this.Edit(id);
        }


        public ActionResult Delete(int id)
        {
            var D_doAn = context.DoAns.First(m => m.MaDA == id);
            return View(D_doAn);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_doAn = context.DoAns.Where(m => m.MaDA == id).First();
            context.DoAns.Remove(D_doAn);
            context.SaveChanges();
            return RedirectToAction("ListDoAn", "DoAn");
        }
    }
}
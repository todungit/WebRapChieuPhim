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
    public class GhePhongChieuController : Controller
    {
        MyDataContext context = new MyDataContext();
        public ActionResult ListGhePhongChieu()
        {
            var all_ghephongchieu = from tt in context.GhePhongChieux select tt;
            return View(all_ghephongchieu);
        }

        public ActionResult Create()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(GhePhongChieu objGPC)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            context.GhePhongChieux.Add(objGPC);
            context.SaveChanges();
            return View(objGPC);
        }

        public ActionResult Detail(int id)
        {
            var D_ghephongchieu = context.GhePhongChieux.Where(m => m.MaGhe == id).First();
            return View(D_ghephongchieu);
        }
        public ActionResult Edit(int id)
        {

            var E_ghephongchieu = context.GhePhongChieux.First(m => m.MaGhe == id);
            return View(E_ghephongchieu);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();

            var ghephongchieu = context.GhePhongChieux.First(m => m.MaGhe == id);
            var E_Tenghe = collection["TenGhe"];
            ghephongchieu.MaGhe = id;
            if (string.IsNullOrEmpty(E_Tenghe))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                ghephongchieu.TenGhe = E_Tenghe;
                UpdateModel(ghephongchieu);
                context.SaveChanges();
                return RedirectToAction("ListGhePhongChieu", "GhePhongChieu");
            }
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            var D_ghephongchieu = context.GhePhongChieux.First(m => m.MaGhe == id);
            return View(D_ghephongchieu);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_ghephongchieu = context.GhePhongChieux.Where(m => m.MaGhe == id).First();
            context.GhePhongChieux.Remove(D_ghephongchieu);
            // context.TheLoaiPhims.DeleteOnSubmit(D_theloai);
            context.SaveChanges();
            return RedirectToAction("ListGhePhongChieu");
        }
    }
}
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
    public class TheLoaiController : Controller
    {
        // GET: TheLoai
        MyDataContext context = new MyDataContext();


        public ActionResult ListTheLoai()
        {
            var all_theloai = from tt in context.TheLoaiPhims select tt;
            return View(all_theloai);
        }

        public ActionResult Create()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(TheLoaiPhim objTLP)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            context.TheLoaiPhims.Add(objTLP);
            context.SaveChanges();
            return View(objTLP);
        }

        public ActionResult Detail(int id)
        {
            var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();
            return View(D_theloai);
        }
        public ActionResult Edit(int id)
        {
            
            var E_theloai = context.TheLoaiPhims.First(m => m.MaTL == id);
            return View(E_theloai);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();

            var theloai = context.TheLoaiPhims.First(m => m.MaTL == id);
            var E_tenloai = collection["TenTL"];
            theloai.MaTL = id;
            if (string.IsNullOrEmpty(E_tenloai))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                theloai.TenTL = E_tenloai;
                UpdateModel(theloai);
                context.SaveChanges();
                return RedirectToAction("ListTheLoai", "TheLoai");
            }
            return this.Edit(id);
        }
        public ActionResult Delete(int id)
        {
            var D_theloai = context.TheLoaiPhims.First(m => m.MaTL == id);
            return View(D_theloai);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();
            context.TheLoaiPhims.Remove(D_theloai);
           // context.TheLoaiPhims.DeleteOnSubmit(D_theloai);
            context.SaveChanges();
            return RedirectToAction("ListTheLoai");
        }
    }
}
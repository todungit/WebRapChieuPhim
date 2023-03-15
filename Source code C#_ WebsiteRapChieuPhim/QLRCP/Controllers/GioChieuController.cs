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
    public class GioChieuController : Controller
    {
        MyDataContext context = new MyDataContext();

        public ActionResult ListGioChieu()
        {
            var all_giochieu = from tt in context.GioChieux select tt;
            return View(all_giochieu);
        }

        public ActionResult Create()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(GioChieu objGH)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            context.GioChieux.Add(objGH);
            context.SaveChanges();
            return View(objGH);
        }

        public ActionResult Detail(int id)
        {
            var D_giochieu = context.GioChieux.Where(m => m.MaGioChieu == id).First();
            return View(D_giochieu);
        }

        public ActionResult Edit(int id)
        {

            var E_giochieu = context.GioChieux.First(m => m.MaGioChieu == id);
            return View(E_giochieu);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();

            var giochieu = context.GioChieux.First(m => m.MaGioChieu == id);
            var E_giochieu = collection["GioChieu"];
            giochieu.MaGioChieu = id;
            if (string.IsNullOrEmpty(E_giochieu))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                giochieu.GioChieu1 = E_giochieu;
                UpdateModel(giochieu);
                context.SaveChanges();
                return RedirectToAction("ListGioChieu", "GioChieu");
            }
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            var D_giochieu = context.GioChieux.First(m => m.MaGioChieu == id);
            return View(D_giochieu);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_giochieu = context.GioChieux.Where(m => m.MaGioChieu == id).First();
            context.GioChieux.Remove(D_giochieu);
            // context.TheLoaiPhims.DeleteOnSubmit(D_theloai);
            context.SaveChanges();
            return RedirectToAction("ListGioChieu");
        }
    }
}
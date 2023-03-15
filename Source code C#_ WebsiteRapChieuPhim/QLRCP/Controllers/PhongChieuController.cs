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
    public class PhongChieuController : Controller
    {
        MyDataContext context = new MyDataContext();
        public ActionResult ListPhongChieu()
        {
            var all_phongchieu = from tt in context.PhongChieux select tt;
            return View(all_phongchieu);
        }

        public ActionResult Create()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(PhongChieu objPH)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            context.PhongChieux.Add(objPH);
            context.SaveChanges();
            return View(objPH);
        }

        public ActionResult Detail(int id)
        {
            var D_phongchieu = context.PhongChieux.Where(m => m.MaPhongChieu == id).First();
            return View(D_phongchieu);
        }

        public ActionResult Edit(int id)
        {

            var E_phongchieu = context.PhongChieux.First(m => m.MaPhongChieu == id);
            return View(E_phongchieu);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var D_theloai = context.TheLoaiPhims.Where(m => m.MaTL == id).First();

            var phongchieu = context.PhongChieux.First(m => m.MaPhongChieu == id);
            var E_tenphong = collection["TenPhong"];
            var E_soghe = Convert.ToInt32(collection["SoGhe"]);

            phongchieu.MaPhongChieu = id;
            if (string.IsNullOrEmpty(E_tenphong))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                phongchieu.TenPhongChieu = E_tenphong;
                phongchieu.SoGhe = E_soghe;

                UpdateModel(phongchieu);
                context.SaveChanges();
                return RedirectToAction("ListPhongChieu", "PhongChieu");
            }
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            var D_phongchieu = context.PhongChieux.First(m => m.MaPhongChieu == id);
            return View(D_phongchieu);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_phongchieu = context.PhongChieux.Where(m => m.MaPhongChieu == id).First();
            context.PhongChieux.Remove(D_phongchieu);
            context.SaveChanges();
            return RedirectToAction("ListPhongChieu");
        }
    }
}
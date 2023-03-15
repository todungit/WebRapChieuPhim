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
    public class PhimController : Controller
    {
        // GET: Phim
        MyDataContext context = new MyDataContext();
        public ActionResult ListPhim()
        {
            var all_phim = from tt in context.Phims select tt;
            return View(all_phim);
        }

        public ActionResult Create()
        {
            Phim p = new Phim();
           // p.listTheLoai = context.TheLoaiPhims.ToList();
            p.listTheLoai = context.TheLoaiPhims.ToList();
            return View(p);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Create(Phim objP)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());



            context.Phims.Add(objP);
            context.SaveChanges();
            return View(objP);
        }
        public ActionResult Detail(int id)
        {
            var D_phim = context.Phims.Where(m => m.MaPhim == id).First();
            return View(D_phim);
        }

        public ActionResult Edit(int id)
        {
            var E_phim = context.Phims.First(m => m.MaPhim == id);
            return View(E_phim);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var E_phim = context.Phims.First(m => m.MaPhim == id);
            var E_tenphim = collection["TenPhim"];
            var E_hinh = collection["Hinh"];
            var E_giave = Convert.ToDecimal(collection["GiaVe"]);
            var E_noidung = collection["NoiDungChinh"];
            var E_ngaykhoichieu = Convert.ToDateTime(collection["NgayKhoiChieu"]);
            var E_ngayketthuc = Convert.ToDateTime(collection["NgayKetThuc"]);
            var E_matheloai = Convert.ToInt32(collection["MaTL"]);


            E_phim.MaPhim = id;
            if (string.IsNullOrEmpty(E_tenphim))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                E_phim.TenPhim = E_tenphim;
                E_phim.Hinh = E_hinh;
                E_phim.GiaVe = E_giave;
                E_phim.NoiDungChinh = E_noidung;
                E_phim.NgayKhoiChieu = E_ngaykhoichieu;
                E_phim.NgayKetThuc = E_ngayketthuc;
                E_phim.MaTL = E_matheloai;
                UpdateModel(E_phim);
                context.SaveChanges();
                return RedirectToAction("ListPhim", "Phim");
            }
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            var D_Phim = context.Phims.First(m => m.MaPhim == id);
            return View(D_Phim);
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_Phim = context.Phims.Where(m => m.MaPhim == id).First();
            context.Phims.Remove(D_Phim);
            context.SaveChanges();
            return RedirectToAction("ListPhim", "Phim");
        }
    }
}
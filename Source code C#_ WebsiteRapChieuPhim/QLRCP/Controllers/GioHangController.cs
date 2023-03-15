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
    public class GioHangController : Controller
    {
        // GET: GioHang
        MyDataContext context = new MyDataContext();

        public ActionResult ThemGioHang(int id, string strURL)
        {
            List<GioHang> lstGiohang = LayGioHang();

            GioHang doan = lstGiohang.Find(n => n.masp == id);

            GioHang sanpham = lstGiohang.Find(n => n.masp == id);

            if (sanpham == null)
            {
                if(doan == null)
                {
                    doan = new GioHang(id, strURL);
                    lstGiohang.Add(doan);
                    return Redirect(strURL);
                }
                else
                {
                    sanpham = new GioHang(id, strURL);
                    lstGiohang.Add(sanpham);
                    return Redirect(strURL);
                }

                //sanpham = new GioHang(id, strURL);
                //doan = new GioHang(id, strURL);
                //lstGiohang.Add(doan);
                //lstGiohang.Add(sanpham);
                //return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }
        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Sum(n => n.iSoLuong);
            }
            return tsl;
        }
        private int TongSoLuongSanPham()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;
        }
        private double TongTien()
        {
            double tt = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => n.dThanhTien);
            }
            return tt;
        }
        public ActionResult GioHang()
        {

            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGioHang);
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return PartialView();
        }
        public ActionResult XoaGioHang(int id)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.masp == id);

            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.masp == id);
                return RedirectToAction("GioHang");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhapGiohang(int id, FormCollection collection)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.masp == id);
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(collection["txtSoLg"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            lstGioHang.Clear();
            return RedirectToAction("GioHang");
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstgiohang = Session["Giohang"] as List<GioHang>;
            if (lstgiohang == null)
            {
                lstgiohang = new List<GioHang>();
                Session["Giohang"] = lstgiohang;
            }
            return lstgiohang;
        }
        




        System.Web.HttpContext curContext = System.Web.HttpContext.Current;

        [HttpGet]
        [Authorize]
        public ActionResult DatHang(AspNetUser objKH)
        {
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            //đã lưu
            Session["Name"] = user.Name;
            Session["email"] = user.Email;


            //Dọc 
            //string email = (string)(Session["Email"]);

            //System.Web.HttpContext curContext = System.Web.HttpContext.Current;

            //curContext.Session["Email"] = email;
            //email = (string)(curContext.Session["Email"]);

            List<GioHang> lstGiohang = LayGioHang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(lstGiohang);
        }

        
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {

            Ve ve = new Ve();
            
            ApplicationUser user = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            //AspNetUser kh = (AspNetUser)Session["Email"];

            Phim p = new Phim();
            DoAn doAn = new DoAn();
            List<GioHang> gh = LayGioHang();
            var ngayxem = String.Format("{0:MM/dd/yyyy}", collection["NgayXem"]);

            ve.MaKH = user.Id;
            ve.NgayDat = DateTime.Now;

            

            ve.NgayXem = DateTime.Parse(ngayxem);
             //ve.GiaoHang = false;
            ve.ThanhToan = false;
            context.Ves.Add(ve);
            context.SaveChanges();

            foreach (var item in gh)
            {
                ChiTietVe ctve = new ChiTietVe();
                ctve.MaVe = ve.MaVe;
                ctve.MaPhim = item.masp;
                ctve.MaDA = item.masp;
                ctve.SoLuong = item.iSoLuong;
                ctve.Gia = (decimal)item.giasp;

                p = context.Phims.Single(n => n.MaPhim == item.masp);
                doAn = context.DoAns.Single(n => n.MaDA == item.masp);

                //p.SoLuongTon = ctve.SoLuong;
                context.SaveChanges();
                context.ChiTietVes.Add(ctve);
            }
            context.SaveChanges();
            Session["Giohang"] = null;
            return RedirectToAction("XacnhanDonhang", "GioHang");  
        }
        public ActionResult XacnhanDonhang()
        {
            return View();
        }
    }
}
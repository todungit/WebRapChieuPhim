using QLRCP.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLRCP.Controllers
{
    public class HomeController : Controller
    {
        MyDataContext context = new MyDataContext();
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            var all_phim = (from s in context.Phims select s).OrderBy(m => m.MaPhim);
            int pageSize = 6;
            int pageNum = page ?? 1;
            return View(all_phim.ToPagedList(pageNum, pageSize));
        }

        public ActionResult ListDoAn(int? page)
        {
            if (page == null) page = 1;
            var all_doAn = (from s in context.DoAns select s).OrderBy(m => m.MaDA);
            int pageSize = 6;
            int pageNum = page ?? 1;
            return View(all_doAn.ToPagedList(pageNum, pageSize));
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Detail(int id)
        {
            var D_phim = context.Phims.Where(m => m.MaPhim == id).First();
            return View(D_phim);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;



namespace QLRCP.Models
{
    public class GioHang
    {
        MyDataContext context = new MyDataContext();
        
        //public int madoan { get; set; }

        //[Display(Name = "Tên Đồ Ăn ")]
        //public string tendoan { get; set; }

        //[Display(Name = "Giá đồ ăn ")]
        //public Double giadoan { get; set; }


        public int masp { get; set; }

        [Display(Name = "Tên Phim ")]
        public string tensp { get; set; }

        [Display(Name = "Ảnh Bìa")]
        public string hinh { get; set; }

        [Display(Name = "Giá Vé ")]
        public Double giasp { get; set; }

        [Display(Name = "Số Lượng ")]
        public int iSoLuong { get; set; }

        [Display(Name = "Thành Tiền ")]
        public double dThanhTien
        {
            get { return iSoLuong * giasp; }
        }

        public GioHang(int id, string strURL)
        {
            if (strURL == "https://localhost:44304/Home/ListDoAn")
            {
                masp = id;
                DoAn doan = context.DoAns.Single(n => n.MaDA == masp);
                tensp = doan.TenDA;
                hinh = doan.Hinh;
                giasp = double.Parse(doan.GiaDA.ToString());
                iSoLuong = 1;
            }
            else
            {
                masp = id;
                Phim phim = context.Phims.Single(n => n.MaPhim == masp);
                tensp = phim.TenPhim;
                hinh = phim.Hinh;
                giasp = double.Parse(phim.GiaVe.ToString());
                iSoLuong = 1;
            }
        }
    }
}
namespace QLRCP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichChieu")]
    public partial class LichChieu
    {
        [Key]
        public int MaLichChieu { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayChieu { get; set; }

        public decimal? GiaVe { get; set; }

        public int? MaPhongChieu { get; set; }

        public int? MaGioChieu { get; set; }

        public int? MaPhim { get; set; }

        public virtual GioChieu GioChieu { get; set; }

        public virtual Phim Phim { get; set; }

        public virtual PhongChieu PhongChieu { get; set; }
    }
}

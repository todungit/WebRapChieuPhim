namespace QLRCP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Phim")]
    public partial class Phim
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Phim()
        {
            ChiTietVes = new HashSet<ChiTietVe>();
            LichChieux = new HashSet<LichChieu>();
        }

        [Key]
        public int MaPhim { get; set; }

        [StringLength(50)]
        public string TenPhim { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayKhoiChieu { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayKetThuc { get; set; }

        [StringLength(50)]
        public string Hinh { get; set; }

        public decimal? GiaVe { get; set; }

        [StringLength(250)]
        public string NoiDungChinh { get; set; }

        public int? MaTL { get; set; }

        public List<TheLoaiPhim> listTheLoai = new List<TheLoaiPhim>();

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietVe> ChiTietVes { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichChieu> LichChieux { get; set; }

        public virtual TheLoaiPhim TheLoaiPhim { get; set; }
    }
}

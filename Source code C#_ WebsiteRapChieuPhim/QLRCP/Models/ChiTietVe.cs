namespace QLRCP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietVe")]
    public partial class ChiTietVe
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaVe { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaPhim { get; set; }

        public int? SoLuong { get; set; }

        public decimal? Gia { get; set; }

        public int? MaDA { get; set; }

        public virtual DoAn DoAn { get; set; }

        public virtual Phim Phim { get; set; }

        public virtual Ve Ve { get; set; }
    }
}

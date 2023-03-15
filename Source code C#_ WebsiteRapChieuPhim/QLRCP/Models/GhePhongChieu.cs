namespace QLRCP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GhePhongChieu")]
    public partial class GhePhongChieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GhePhongChieu()
        {
            CT_Ghe_PhongChieu = new HashSet<CT_Ghe_PhongChieu>();
        }

        [Key]
        public int MaGhe { get; set; }

        [StringLength(5)]
        public string TenGhe { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_Ghe_PhongChieu> CT_Ghe_PhongChieu { get; set; }
    }
}

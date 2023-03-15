namespace QLRCP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DoAn")]
    public partial class DoAn
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoAn()
        {
            ChiTietVes = new HashSet<ChiTietVe>();
        }

        [Key]
        public int MaDA { get; set; }

        [StringLength(100)]
        public string TenDA { get; set; }

        [StringLength(50)]
        public string Hinh { get; set; }

        public decimal? GiaDA { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietVe> ChiTietVes { get; set; }
    }
}

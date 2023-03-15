using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QLRCP.Models
{
    public partial class MyDataContext : DbContext
    {
        public MyDataContext()
            : base("name=MyDataContext")
        {
        }

        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<ChiTietVe> ChiTietVes { get; set; }
        public virtual DbSet<CT_Ghe_PhongChieu> CT_Ghe_PhongChieu { get; set; }
        public virtual DbSet<DoAn> DoAns { get; set; }
        public virtual DbSet<GhePhongChieu> GhePhongChieux { get; set; }
        public virtual DbSet<GioChieu> GioChieux { get; set; }
        public virtual DbSet<LichChieu> LichChieux { get; set; }
        public virtual DbSet<Phim> Phims { get; set; }
        public virtual DbSet<PhongChieu> PhongChieux { get; set; }
        public virtual DbSet<TheLoaiPhim> TheLoaiPhims { get; set; }
        public virtual DbSet<Ve> Ves { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AspNetUser>()
                .HasMany(e => e.Ves)
                .WithOptional(e => e.AspNetUser)
                .HasForeignKey(e => e.MaKH);

            modelBuilder.Entity<ChiTietVe>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<DoAn>()
                .Property(e => e.Hinh)
                .IsUnicode(false);

            modelBuilder.Entity<DoAn>()
                .Property(e => e.GiaDA)
                .HasPrecision(18, 0);

            modelBuilder.Entity<GhePhongChieu>()
                .HasMany(e => e.CT_Ghe_PhongChieu)
                .WithRequired(e => e.GhePhongChieu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<GioChieu>()
                .Property(e => e.GioChieu1)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .Property(e => e.GiaVe)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Phim>()
                .Property(e => e.Hinh)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.GiaVe)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.ChiTietVes)
                .WithRequired(e => e.Phim)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhongChieu>()
                .HasMany(e => e.CT_Ghe_PhongChieu)
                .WithRequired(e => e.PhongChieu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ve>()
                .HasMany(e => e.ChiTietVes)
                .WithRequired(e => e.Ve)
                .WillCascadeOnDelete(false);
        }
    }
}

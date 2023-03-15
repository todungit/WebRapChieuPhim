USE [master]
GO
/****** Object:  Database [RCP]    Script Date: 11/18/2022 1:06:06 PM ******/
CREATE DATABASE [RCP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RCP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RCP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RCP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RCP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RCP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RCP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RCP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RCP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RCP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RCP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RCP] SET ARITHABORT OFF 
GO
ALTER DATABASE [RCP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RCP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RCP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RCP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RCP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RCP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RCP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RCP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RCP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RCP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RCP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RCP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RCP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RCP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RCP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RCP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RCP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RCP] SET RECOVERY FULL 
GO
ALTER DATABASE [RCP] SET  MULTI_USER 
GO
ALTER DATABASE [RCP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RCP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RCP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RCP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RCP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RCP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RCP', N'ON'
GO
ALTER DATABASE [RCP] SET QUERY_STORE = OFF
GO
USE [RCP]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/18/2022 1:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietVe]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietVe](
	[MaVe] [int] NOT NULL,
	[MaPhim] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
	[MaDA] [int] NULL,
 CONSTRAINT [PK_ChiTietVe] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC,
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Ghe_PhongChieu]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Ghe_PhongChieu](
	[MaGhe] [int] NOT NULL,
	[MaPhongChieu] [int] NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_CT_Ghe_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[MaGhe] ASC,
	[MaPhongChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoAn]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoAn](
	[MaDA] [int] IDENTITY(1,1) NOT NULL,
	[TenDA] [nvarchar](100) NULL,
	[Hinh] [varchar](50) NULL,
	[GiaDA] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DoAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GhePhongChieu]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GhePhongChieu](
	[MaGhe] [int] IDENTITY(1,1) NOT NULL,
	[TenGhe] [nvarchar](5) NULL,
 CONSTRAINT [PK_GhePhongChieu] PRIMARY KEY CLUSTERED 
(
	[MaGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioChieu]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioChieu](
	[MaGioChieu] [int] IDENTITY(1,1) NOT NULL,
	[GioChieu] [varchar](5) NULL,
 CONSTRAINT [PK_GioChieu] PRIMARY KEY CLUSTERED 
(
	[MaGioChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[MaLichChieu] [int] IDENTITY(1,1) NOT NULL,
	[NgayChieu] [date] NULL,
	[GiaVe] [decimal](18, 0) NULL,
	[MaPhongChieu] [int] NULL,
	[MaGioChieu] [int] NULL,
	[MaPhim] [int] NULL,
 CONSTRAINT [PK_LichChieu] PRIMARY KEY CLUSTERED 
(
	[MaLichChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](50) NULL,
	[NgayKhoiChieu] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[Hinh] [varchar](50) NULL,
	[GiaVe] [decimal](18, 0) NULL,
	[NoiDungChinh] [nvarchar](250) NULL,
	[MaTL] [int] NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChieu](
	[MaPhongChieu] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongChieu] [nvarchar](50) NULL,
	[SoGhe] [int] NULL,
 CONSTRAINT [PK_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[MaPhongChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoaiPhim]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiPhim](
	[MaTL] [int] IDENTITY(1,1) NOT NULL,
	[TenTL] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoaiPhim] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ve]    Script Date: 11/18/2022 1:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[ThanhToan] [bit] NULL,
	[NgayDat] [date] NULL,
	[NgayXem] [date] NULL,
	[MaKH] [nvarchar](128) NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202211030506365_InitialCreate', N'QLRCP.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDD6EE3B612BE2F70DE41D0D539456AE5A7BBD813D82D52276983E6EFACB3C5B95BD012ED082B51AA44A5098A3E592FFA48E715CE50A264893F12652BB6532CB0B0C8E137C3E1901C0E87F9DF9F7F8DBF7F0E03EB0927A91F91897D343AB42D4CDCC8F3C972626774F1CD07FBFBEFFEF1D5F8C20B9FAD5F4ABA1346072D493AB11F298D4F1D27751F7188D251E8BB4994460B3A72A3D0415EE41C1F1EFEDB393A723040D8806559E38F19A17E88F30FF89C46C4C531CD5070137938487939D4CC7254EB1685388D918B27F67FAE3F4EEF47059D6D9D053E0219663858D8162224A2888284A79F523CA3494496B3180A50F0F01263A05BA020C55CF2D315B969270E8F59279C55C312CACD521A853D018F4EB8561CB1F95ABAB52BAD81DE2E40BFF485F53AD7DDC4BEF2705EF4310A400122C3D3699030E2897D53B1384BE35B4C4765C35101799900DC6F51F26554473CB08CDB1D5456743C3A64FF0EAC6916D02CC11382339AA0E0C0BACFE681EFFE8C5F1EA22F984C4E8EE68B930FEFDE23EFE4FDB7F8E45DBDA7D057A06B1440D17D12C53801D9F0A2EABF6D39CD768ED8B06A566B5368056C0926846DDDA0E76B4C96F411A6CAF107DBBAF49FB1579670E3FA447C983FD08826197CDE664180E601AEEA9D569EECFF16AEC7EFDE0FC2F5163DF9CB7CE805FE30711298571F7190D7A68F7E5C4CAFC6787FE664974914B2EFA67D15B59F675196B8AC339196E401254B4C9BD28D9D95F11A9934831ADEAC4BD4FD376D26A96CDE4A52D6A1756642C962DBB3A194F775F91A5BDC591CC3E0E5A6C534D26670F56D6A24B43BB0F2DA95B91C999A0B816EFC9D57BF8B10F9C100CB9F0117F039167E12E2AA973F44606C88F496F91EA529CC7EEF27943EB6880E3F07107D86DD2C01A39C5114C6AFCEEDFE3122F8360BE7CCD6B7C76BB0A179F82DBA442E8D920BC25A6D8C771DB95FA28C5E10EF1C51FC89BA2520FB7CF043738041C439735D9CA69760CCD89B46E052978057849E1CF786634BD3AEDD8F6980FC50ED7F088BE8E79274E583A829243F4443A6F245DA44BD8E963E3113B524D58B5A50748ACAC9FA8ACAC0CC24E5947A4173824E390BAAC1BCBB7C848677EF72D8FDF7EF36DBBC756B414D8D335821F18F98E0049631EF1E518A13B21A0193756317CE423E7C8CE9ABEF4D39A75F50900DCD6AADD9902F02C3CF861C76FF67432E26143FF91EF34A0C0E3D2531C01BD1ABCF53DD734E906CDBD3A1D1CD6D33DFCE1AA09B2E67691AB97E3E0B14E12E1EAC68CA0F3E9CD51DB9287A23463FA06360E83EDBF2A004FA668B467547CE718029B6CEDC221C3845A98B3C598DD021AF8760E58EAA106C1505690AF7B5C4132C1D27AC116287A01466AA4FA83C2D7CE2FA310A3AB524B434DCC258DF2B1E62CD398E31610C3B3561C25C1DF46002547C8441E9D2D0D8A9595CBB216ABC56DD9877B9B0AB719762115BB1C90EDF596397DC7F7B15C36CD7D8168CB35D252602680378BB30507E56313500F1E0B26F062A9C983406CA5DAAAD186853633B30D0A64ADE9C81164754D3F117CEABFB669ECD83F2F6B7F55675EDC0361BFAD833D32C7C4F6843A1054E64F33C9FB34AFC4C15873390939FCF52EEEA8A26C2C067983643362B7F57E9873AED20A211B501AE0CAD03945FFD4940D284EA215C19CB6B958E7B113D60CBB85B2B2C5FFB05D89A0DC8D8F52BD01AA1FEA254344EA3D347D5B3CA1A2423373A2CD4701406212E5ECD8E1B28451797951563E20BF7F1866B1DE383D1A2A00ECF55A3A4B233836BA934CD6E2DA91CB23E2ED9465A12DC278D96CACE0CAE256EA3DD4A5238053DDC828D54D4DCC2079A6C65A4A3DA6DAABAB153E444F182B1A3499E1ADFA038F6C9B2964CC54BAC59914935FD66D63FD1282C301C3755E41B55D2569C6894A025166A8135487AE927293D4714CD118BF34CBD502253EEAD9AE5BF6459DF3EE5412CF781929AFD2E5A342EEC1BBBACEC86F0D697D0B790F93279005D31F2EAE6164B6B43014A1431FB69146421D1BB56FAD6C5CD5DBD7D5122238C1D417EC97592F42439B84DA51B0D893C1D361E9ECA67597F88F4103A45971E675DD53A2F548F5206A5EA28BA40D5CE864CE7BC180E93E811F61FA54E84D7994B3C0DA50EC08B7A62D4321924B05A9D396A33D9A48ED9AC314714324AEA9042550F29EB79230D21EB156BE16934AAA630E720678AD4D1E55A736445CE481D5A51BD06B64266B1CE1C559156520756549B63AF724CC4E5738F772BED39658DEDAA38C46EB65F69305E672D1C66BBABDDD5D7816AC53DB1F86DBC04C6CBF7D28EB427B935ECA8885A6C66471A0CFD6AD3B8DF6E2E36AD97F27ACCC6A57563416FBBB4D7E3F5B3D657B509E908279254DCABA39C70641BF3E353F7A318E93C5590D856A946D8CC5F528AC3112318CD7E0DA6818FD9D25D12DC20E22F704A8B440DFBF8F0E858785DB33F2F5D9C34F502C5F153F7DCA539665BC8B9224F28711F512267406CF01A64052A0597AF88879F27F6EF79ABD33C4EC17EE5C507D655FA89F8BF6650F19064D8FA43CEE81C263BDEE03D4625E81F6FE2A183B9CAAFFEFBB9687A60DD25309D4EAD4341D1EB0C7FF3F9432F698AA61B48B3F6A388B73BDB1AAF0F94A8C26C59FFB1C1DCA7833C3428A5FC67889EFFD55734E563828D10150F0686C21B4485BA0701EB60691F0378F049F3C700FD3AAB7E1CB08E68DA87013EE90F263E0B305F86CA963BDC871447A56D2C49B99E3BD3AA37CAB1DCF5DE24655F6F34D1E50CEB1E708366516FE6A2BCB1ECE4C1B64E45F2F160D8BBB4FB57CF38DE9724E395D3BEDBDCE26DA613B75C1FFDADB288F720EF4D91C7B3FB5CE16DDB9A2EF6BBE70997FD3282F7CCD8F836BFFBBCDF6D1B9B2E40BCE7C6D62BBB77CF6C6D57FBE78E2DCD780BDD79AEAE9C76A4B9C3514591BB72718B903B1CFFE7111841E151164F28D5C95F6D89AB1D0C57247AA6FAAC3391B1347124BE12453BDB7E7DE51B7E6B67394D3B5B4DAE661B6FBEFEB7F2E634EDBC351990BBC82256E620AA32BB3BD6B1B664A9B79435DCE84947927A97CFDA7A21FF96928407514A63F6686E97DF4E4EF0202A1972EAF4C801962F8A61EFACFD8D45D8BF537FB982607F719160B7B16B5634576411959BB72051492244686E30451E6CA96709F517C8A550CD02D0F91BF03CA8C7AE41E6D8BB2277198D330A5DC6E13C6804BC9813D0C63F4F746ECA3CBE8BD9573A4417404C9F05EEEFC80F991F7895DC978A9890068279173CDCCBC692B2B0EFF2A542BA8D882110575FE5143DE0300E002CBD2333F484D7910DCCEF1A2F91FBB28A00EA40BA07A2A9F6F1B98F96090A538EB16A0F9F60C35EF8FCDDFF014DF0D4D76A540000, N'6.4.4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'1766c983-0388-49b8-91c8-b676c78b0889', N'todung@gmail.com', 0, N'AG/Mkky+2N1FqGfy80Uj9LYC7auoXdpPABV/yUIpPbvNEGwU5hjlaxQV2XUkhIGZ4Q==', N'5c88085f-f19c-4689-a43a-55745f3849f9', NULL, 0, 0, NULL, 1, 0, N'todung@gmail.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6', N'to@gmail.com', 0, N'ANZzrlsguUksnprKKo3gcax76vbsQidWsUtBNHG22T3qJEnt/Ql+CUfyGOfqgq7rlQ==', N'2f9b3d53-c06c-4d3f-b2f8-901d452c6af8', NULL, 0, 0, NULL, 1, 0, N'to@gmail.com', N'Võ Thanh Thông')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name]) VALUES (N'bad8e786-e72f-4baa-aee0-6394761831d6', N'tuong@gmail.com', 0, N'ACOUpYN8NKwXFAaTNVE+m0zU7IyNKgBRxLIZ76S3SvxILFKR0MW05LE0wU7+DK0arQ==', N'fd53b5e0-6ca8-4b3c-aacb-c0aaf7d004f5', NULL, 0, 0, NULL, 1, 0, N'tuong@gmail.com', N'Phạm Trần Vĩnh Tường')
GO
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (1, 2, 1, CAST(45000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (2, 2, 1, CAST(45000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (3, 2, 1, CAST(45000 AS Decimal(18, 0)), 3)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (5, 2, 1, CAST(45000 AS Decimal(18, 0)), 2)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (6, 3, 1, CAST(55000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (7, 2, 1, CAST(45000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (7, 3, 1, CAST(13000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (9, 2, 1, CAST(45000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (9, 3, 1, CAST(13000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (10, 2, 1, CAST(45000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (10, 3, 1, CAST(13000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (11, 3, 1, CAST(13000 AS Decimal(18, 0)), 3)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (11, 4, 1, CAST(45000 AS Decimal(18, 0)), 4)
INSERT [dbo].[ChiTietVe] ([MaVe], [MaPhim], [SoLuong], [Gia], [MaDA]) VALUES (12, 3, 1, CAST(55000 AS Decimal(18, 0)), 3)
GO
SET IDENTITY_INSERT [dbo].[DoAn] ON 

INSERT [dbo].[DoAn] ([MaDA], [TenDA], [Hinh], [GiaDA]) VALUES (1, N'BẮP NGỌT', N'/Content/images/bapngot.jpg', CAST(40000 AS Decimal(18, 0)))
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [Hinh], [GiaDA]) VALUES (2, N'BẮP PHÔ MAI', N'/Content/images/bapphomai.jpg', CAST(44000 AS Decimal(18, 0)))
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [Hinh], [GiaDA]) VALUES (3, N'NƯỚC SUỐI DASANI 500ML', N'/Content/images/nuocloc.jpg', CAST(13000 AS Decimal(18, 0)))
INSERT [dbo].[DoAn] ([MaDA], [TenDA], [Hinh], [GiaDA]) VALUES (4, N'Nước lọc', N'/Content/images/nuocloc12.jpg', CAST(35000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DoAn] OFF
GO
SET IDENTITY_INSERT [dbo].[GhePhongChieu] ON 

INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (1, N'A01')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (2, N'A02')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (3, N'A03')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (4, N'A04')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (5, N'A05')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (6, N'A06')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (7, N'A07')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (8, N'A08')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (9, N'A09')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (10, N'A10')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (11, N'B01')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (12, N'B02')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (13, N'B03')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (14, N'B04')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (15, N'B05')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (16, N'B06')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (17, N'B07')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (18, N'B08')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (19, N'B09')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (20, N'B10')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (21, N'C01')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (22, N'C02')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (23, N'C03')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (24, N'C04')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (25, N'C05')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (26, N'C06')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (27, N'C07')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (28, N'C08')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (29, N'C09')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (30, N'C10')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (31, N'D01')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (32, N'D02')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (33, N'D03')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (34, N'D04')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (35, N'D05')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (36, N'D06')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (37, N'D07')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (38, N'D08')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (39, N'D09')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (40, N'D10')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (41, N'E01')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (42, N'E02')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (43, N'E03')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (44, N'E04')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (45, N'E05')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (46, N'E06')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (47, N'E07')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (48, N'E08')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (49, N'E09')
INSERT [dbo].[GhePhongChieu] ([MaGhe], [TenGhe]) VALUES (50, N'E10')
SET IDENTITY_INSERT [dbo].[GhePhongChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[GioChieu] ON 

INSERT [dbo].[GioChieu] ([MaGioChieu], [GioChieu]) VALUES (1, N'15:00')
INSERT [dbo].[GioChieu] ([MaGioChieu], [GioChieu]) VALUES (2, N'17:00')
INSERT [dbo].[GioChieu] ([MaGioChieu], [GioChieu]) VALUES (3, N'19:00')
INSERT [dbo].[GioChieu] ([MaGioChieu], [GioChieu]) VALUES (4, N'21:00')
INSERT [dbo].[GioChieu] ([MaGioChieu], [GioChieu]) VALUES (5, N'23:00')
SET IDENTITY_INSERT [dbo].[GioChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[LichChieu] ON 

INSERT [dbo].[LichChieu] ([MaLichChieu], [NgayChieu], [GiaVe], [MaPhongChieu], [MaGioChieu], [MaPhim]) VALUES (1, CAST(N'2022-11-15' AS Date), CAST(50000 AS Decimal(18, 0)), 3, 1, 2)
INSERT [dbo].[LichChieu] ([MaLichChieu], [NgayChieu], [GiaVe], [MaPhongChieu], [MaGioChieu], [MaPhim]) VALUES (2, CAST(N'2022-11-15' AS Date), CAST(45000 AS Decimal(18, 0)), 4, 2, 2)
INSERT [dbo].[LichChieu] ([MaLichChieu], [NgayChieu], [GiaVe], [MaPhongChieu], [MaGioChieu], [MaPhim]) VALUES (3, CAST(N'2022-11-15' AS Date), CAST(55000 AS Decimal(18, 0)), 3, 2, 3)
SET IDENTITY_INSERT [dbo].[LichChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[Phim] ON 

INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayKhoiChieu], [NgayKetThuc], [Hinh], [GiaVe], [NoiDungChinh], [MaTL]) VALUES (2, N'Conan', CAST(N'2022-10-10' AS Date), CAST(N'2022-12-12' AS Date), N'/Content/images/ThamTuLungDanhConan.jpg', CAST(45000 AS Decimal(18, 0)), N'Tại Shibuya náo nhiệt mùa Halloween, Thiếu úy Sato Miwako khoác lên mình chiếc váy cưới tinh khôi trong tiệc cưới như cổ tích, và người đàn ông bên cạnh cô không ai khác ngoài Trung sĩ Takagi Wataru.', 4)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayKhoiChieu], [NgayKetThuc], [Hinh], [GiaVe], [NoiDungChinh], [MaTL]) VALUES (3, N'Mắt Biếc', CAST(N'2022-10-25' AS Date), CAST(N'2022-12-01' AS Date), N'/Content/images/MatBiec.jpg', CAST(55000 AS Decimal(18, 0)), N'Đi qua những đau khổ và phản bội, mối tình đơn phương của Ngạn dành cho cô bạn thân thời thơ ấu Hà Lan kéo dài cả một thế hệ trong bộ phim siêu lãng mạn này.', 3)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayKhoiChieu], [NgayKetThuc], [Hinh], [GiaVe], [NoiDungChinh], [MaTL]) VALUES (4, N'Hoạt Hình', CAST(N'2022-10-10' AS Date), CAST(N'2022-12-12' AS Date), N'/Content/images/ThamTuLungDanhConan.jpg', CAST(45000 AS Decimal(18, 0)), N'agagfa', 1)
SET IDENTITY_INSERT [dbo].[Phim] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongChieu] ON 

INSERT [dbo].[PhongChieu] ([MaPhongChieu], [TenPhongChieu], [SoGhe]) VALUES (3, N'Phòng 1', 35)
INSERT [dbo].[PhongChieu] ([MaPhongChieu], [TenPhongChieu], [SoGhe]) VALUES (4, N'Phòng 2', 45)
INSERT [dbo].[PhongChieu] ([MaPhongChieu], [TenPhongChieu], [SoGhe]) VALUES (5, N'Phòng 3', 50)
INSERT [dbo].[PhongChieu] ([MaPhongChieu], [TenPhongChieu], [SoGhe]) VALUES (6, N'Phòng 4', 40)
INSERT [dbo].[PhongChieu] ([MaPhongChieu], [TenPhongChieu], [SoGhe]) VALUES (7, N'Phòng 5', 50)
SET IDENTITY_INSERT [dbo].[PhongChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoaiPhim] ON 

INSERT [dbo].[TheLoaiPhim] ([MaTL], [TenTL]) VALUES (1, N'Hài')
INSERT [dbo].[TheLoaiPhim] ([MaTL], [TenTL]) VALUES (2, N'Hành Động')
INSERT [dbo].[TheLoaiPhim] ([MaTL], [TenTL]) VALUES (3, N'Tình Cảm')
INSERT [dbo].[TheLoaiPhim] ([MaTL], [TenTL]) VALUES (4, N'Hoạt Hình')
SET IDENTITY_INSERT [dbo].[TheLoaiPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[Ve] ON 

INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (1, 1, CAST(N'2022-11-05' AS Date), CAST(N'2022-11-05' AS Date), N'1766c983-0388-49b8-91c8-b676c78b0889')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (2, 0, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-17' AS Date), N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (3, 0, CAST(N'2022-11-08' AS Date), NULL, N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (4, 0, CAST(N'2022-11-08' AS Date), NULL, N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (5, 0, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-09' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (6, 0, CAST(N'2022-11-10' AS Date), NULL, N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (7, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-11-23' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (8, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-12-01' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (9, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-12-01' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (10, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-12-02' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (11, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-11-24' AS Date), N'bad8e786-e72f-4baa-aee0-6394761831d6')
INSERT [dbo].[Ve] ([MaVe], [ThanhToan], [NgayDat], [NgayXem], [MaKH]) VALUES (12, 0, CAST(N'2022-11-10' AS Date), CAST(N'2022-12-03' AS Date), N'b453d0e7-620c-49b4-8a73-c9dc9a9deef6')
SET IDENTITY_INSERT [dbo].[Ve] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/18/2022 1:06:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChiTietVe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietVe_DoAn] FOREIGN KEY([MaDA])
REFERENCES [dbo].[DoAn] ([MaDA])
GO
ALTER TABLE [dbo].[ChiTietVe] CHECK CONSTRAINT [FK_ChiTietVe_DoAn]
GO
ALTER TABLE [dbo].[ChiTietVe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietVe_Phim] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[Phim] ([MaPhim])
GO
ALTER TABLE [dbo].[ChiTietVe] CHECK CONSTRAINT [FK_ChiTietVe_Phim]
GO
ALTER TABLE [dbo].[ChiTietVe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietVe_Ve] FOREIGN KEY([MaVe])
REFERENCES [dbo].[Ve] ([MaVe])
GO
ALTER TABLE [dbo].[ChiTietVe] CHECK CONSTRAINT [FK_ChiTietVe_Ve]
GO
ALTER TABLE [dbo].[CT_Ghe_PhongChieu]  WITH CHECK ADD  CONSTRAINT [FK_CT_Ghe_PhongChieu_GhePhongChieu] FOREIGN KEY([MaGhe])
REFERENCES [dbo].[GhePhongChieu] ([MaGhe])
GO
ALTER TABLE [dbo].[CT_Ghe_PhongChieu] CHECK CONSTRAINT [FK_CT_Ghe_PhongChieu_GhePhongChieu]
GO
ALTER TABLE [dbo].[CT_Ghe_PhongChieu]  WITH CHECK ADD  CONSTRAINT [FK_CT_Ghe_PhongChieu_PhongChieu] FOREIGN KEY([MaPhongChieu])
REFERENCES [dbo].[PhongChieu] ([MaPhongChieu])
GO
ALTER TABLE [dbo].[CT_Ghe_PhongChieu] CHECK CONSTRAINT [FK_CT_Ghe_PhongChieu_PhongChieu]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_GioChieu] FOREIGN KEY([MaGioChieu])
REFERENCES [dbo].[GioChieu] ([MaGioChieu])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_GioChieu]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phim] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[Phim] ([MaPhim])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phim]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_PhongChieu] FOREIGN KEY([MaPhongChieu])
REFERENCES [dbo].[PhongChieu] ([MaPhongChieu])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_PhongChieu]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_TheLoaiPhim] FOREIGN KEY([MaTL])
REFERENCES [dbo].[TheLoaiPhim] ([MaTL])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_TheLoaiPhim]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_AspNetUsers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [RCP] SET  READ_WRITE 
GO

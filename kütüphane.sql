USE [master]
GO
/****** Object:  Database [kutuphane]    Script Date: 19.11.2023 18:15:54 ******/
CREATE DATABASE [kutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kutuphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\kutuphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kutuphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\kutuphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kutuphane] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kutuphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kutuphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kutuphane] SET RECOVERY FULL 
GO
ALTER DATABASE [kutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [kutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kutuphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kutuphane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kutuphane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kutuphane', N'ON'
GO
ALTER DATABASE [kutuphane] SET QUERY_STORE = ON
GO
ALTER DATABASE [kutuphane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [kutuphane]
GO
/****** Object:  Table [dbo].[KATEGORILER]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORILER](
	[kategorı_no] [int] NOT NULL,
	[kategorı_adı] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KITAP_KATEGORİ]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KITAP_KATEGORİ](
	[ISBN] [int] NOT NULL,
	[kategori_no] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KITAP_KUTUPHANE]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KITAP_KUTUPHANE](
	[kutuphane_no] [int] NOT NULL,
	[ISBN] [int] NOT NULL,
	[mıktar] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KITAP_YAZAR]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KITAP_YAZAR](
	[ISBN] [int] NOT NULL,
	[yazar_no] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KITAPLAR]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KITAPLAR](
	[ISBN] [int] NOT NULL,
	[kıtap_adı] [nvarchar](50) NOT NULL,
	[yayın_tarıhı] [date] NOT NULL,
	[s_sayısı] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KUTUPHANE]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KUTUPHANE](
	[kutuphane_no] [int] NOT NULL,
	[Adres_no] [int] NOT NULL,
	[kutuphane_ısım] [nvarchar](50) NOT NULL,
	[acıklama] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UYELER]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UYELER](
	[uye_no] [int] NOT NULL,
	[uye_adı] [nvarchar](50) NOT NULL,
	[uye_soyadı] [nvarchar](50) NOT NULL,
	[cınsıyet] [int] NOT NULL,
	[adres_no] [int] NOT NULL,
	[telefon] [int] NOT NULL,
	[e_posta] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyelerr]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyelerr](
	[UYE_NO] [int] IDENTITY(1,1) NOT NULL,
	[UYE_ADI] [varchar](20) NULL,
	[UYE_SOYADI] [varchar](20) NULL,
	[CINSIYET] [varchar](5) NULL,
	[TELEFON] [varchar](15) NULL,
	[EPOSTA] [varchar](40) NULL,
	[ADRES_NO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UYE_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YAZARLAR]    Script Date: 19.11.2023 18:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YAZARLAR](
	[yazar_no] [int] NOT NULL,
	[yazar_adı] [nvarchar](50) NOT NULL,
	[yazar_soyadı] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (1, N'bilgisayar')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (2, N'ekonomi')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (3, N'eğitim')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (4, N'edebiyat')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (5, N'matematik')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (6, N'psikoloji')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (7, N'kültür')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (8, N'muhasebe')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (9, N'bilim')
INSERT [dbo].[KATEGORILER] ([kategorı_no], [kategorı_adı]) VALUES (10, N'diğer')
GO
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605593265, 1)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605593658, 1)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605593549, 2)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605593657, 3)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605593645, 1)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605936594, 1)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605521478, 6)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605512478, 5)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605532147, 6)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (60553258, 9)
INSERT [dbo].[KITAP_KATEGORİ] ([ISBN], [kategori_no]) VALUES (605569749, 6)
GO
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (1, 605593481, 3)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (2, 605593247, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (3, 605593179, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (4, 605593489, 3)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (5, 605593978, 6)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (6, 605593198, 7)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (7, 605593647, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (8, 605593147, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (9, 605593147, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (10, 605593123, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (11, 605593014, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (12, 605593778, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (13, 605593986, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (14, 605593879, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (15, 605593147, 3)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (16, 605593489, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (17, 605593214, 8)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (18, 605593478, 1)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (1, 605593217, 2)
INSERT [dbo].[KITAP_KUTUPHANE] ([kutuphane_no], [ISBN], [mıktar]) VALUES (1, 605593147, 2)
GO
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605593256, 2)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605521488, 1)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605655324, 2)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605548925, 2)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605596325, 1)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605596523, 1)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (60559325, 1)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605999325, 3)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605595866, 6)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605562559, 5)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (6055236, 6)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (652365632, 5)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (622553256, 9)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605523123, 10)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605599221, 11)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605596633, 12)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605593645, 13)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605592588, 14)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (60554897, 15)
INSERT [dbo].[KITAP_YAZAR] ([ISBN], [yazar_no]) VALUES (605523333, 16)
GO
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593251, N'algorıtma ve programlamaya giris', CAST(N'2009-07-01' AS Date), 306)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593541, N'ınternet programvılığı1', CAST(N'2009-09-10' AS Date), 284)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593147, N'ınternet programcılıgı2', CAST(N'2010-01-01' AS Date), 515)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593014, N'bılgısayar ve ınternet kullanımı', CAST(N'2009-12-03' AS Date), 410)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593258, N'autocad 2009', CAST(N'2009-01-26' AS Date), 396)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (60559300, N'bilgisayar muhasebe', CAST(N'2009-04-05' AS Date), 358)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605596324, N'tıcarı matematık', CAST(N'2010-02-02' AS Date), 390)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593256, N'fakulteler ıcın genel matematik', CAST(N'2007-01-01' AS Date), 226)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593658, N'turk egıtım tarıhı', CAST(N'2010-01-01' AS Date), 262)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593648, N'sermaye ve dıl', CAST(N'2010-01-01' AS Date), 144)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605596325, N'zazalar ve türklük', CAST(N'2000-02-05' AS Date), 248)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605593256, N'sıfreler', CAST(N'2009-01-01' AS Date), 288)
INSERT [dbo].[KITAPLAR] ([ISBN], [kıtap_adı], [yayın_tarıhı], [s_sayısı]) VALUES (605539196, N'semboller ve ısaretler', CAST(N'2010-02-02' AS Date), 352)
GO
INSERT [dbo].[KUTUPHANE] ([kutuphane_no], [Adres_no], [kutuphane_ısım], [acıklama]) VALUES (1, 1, N'Merkez', N'Merkez kutuphan')
INSERT [dbo].[KUTUPHANE] ([kutuphane_no], [Adres_no], [kutuphane_ısım], [acıklama]) VALUES (2, 3, N'Zile', N'Ocak 2010 da kuruldu')
INSERT [dbo].[KUTUPHANE] ([kutuphane_no], [Adres_no], [kutuphane_ısım], [acıklama]) VALUES (3, 4, N'Turhan', N'Üye kaydı için merkez kuruldu')
INSERT [dbo].[KUTUPHANE] ([kutuphane_no], [Adres_no], [kutuphane_ısım], [acıklama]) VALUES (4, 7, N'Amasya', N'üye kaydı için merkez')
GO
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (1, N'Ayse', N'Kara', 0, 1, 35613258, N'aa@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (2, N'Ali', N'Uçar', 1, 3, 35624151, N'au@abc.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (3, N'Ahmet', N'Davut', 1, 2, 35632136, N'ad.@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (4, N'Murat', N'Sönmez', 1, 1, 35643115, N'ms@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (5, N'Burak', N'Torun', 1, 7, 35652168, N'bt@mail2.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (6, N'Ayla', N'Yılmaz', 0, 5, 51321546, N'ay@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (7, N'Mustafa', N'Demir', 1, 6, 44412648, N'md@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (8, N'Turgut', N'Özseven', 1, 4, 356845648, N'to@mail.com')
INSERT [dbo].[UYELER] ([uye_no], [uye_adı], [uye_soyadı], [cınsıyet], [adres_no], [telefon], [e_posta]) VALUES (9, N'Elif', N'Uymaz', 0, 8, 315548964, N'eu@mail.com')
GO
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (1, N'turgut', N'özsever')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (2, N'ebuberkir', N'yaşar')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (3, N'h.çebi', N'bal')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (4, N'fahri', N'özkan')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (5, N'murat', N'ca')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (6, N'ötügen', N'senger')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (7, N'm.ali', N'feyiz')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (8, N'ramazan', N'inal')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (9, N'gökhan', N'çuvalcıoğlu')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (10, N'salih', N'özkan')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (11, N'christian', N'marazzi')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (12, N'hatice', N'ergin')
INSERT [dbo].[YAZARLAR] ([yazar_no], [yazar_adı], [yazar_soyadı]) VALUES (13, N'armağan', N'yıldız')
GO
USE [master]
GO
ALTER DATABASE [kutuphane] SET  READ_WRITE 
GO

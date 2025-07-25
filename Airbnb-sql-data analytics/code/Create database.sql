USE [master]
GO
/****** Object:  Database [GreekAirbnb]    Script Date: 6/22/2025 9:16:06 PM ******/
CREATE DATABASE [GreekAirbnb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreekAirbnb', FILENAME = N'C:\Users\Sofia\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\GreekAirbnb.mdf' , SIZE = 1056768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreekAirbnb_log', FILENAME = N'C:\Users\Sofia\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\GreekAirbnb_log.ldf' , SIZE = 1712128KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GreekAirbnb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreekAirbnb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreekAirbnb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreekAirbnb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreekAirbnb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreekAirbnb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreekAirbnb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreekAirbnb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreekAirbnb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreekAirbnb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreekAirbnb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreekAirbnb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreekAirbnb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreekAirbnb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreekAirbnb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreekAirbnb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreekAirbnb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GreekAirbnb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreekAirbnb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreekAirbnb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreekAirbnb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreekAirbnb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreekAirbnb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreekAirbnb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreekAirbnb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GreekAirbnb] SET  MULTI_USER 
GO
ALTER DATABASE [GreekAirbnb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreekAirbnb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreekAirbnb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreekAirbnb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreekAirbnb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreekAirbnb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GreekAirbnb] SET QUERY_STORE = ON
GO
ALTER DATABASE [GreekAirbnb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GreekAirbnb]
GO
/****** Object:  Table [dbo].[bookings]    Script Date: 6/22/2025 9:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookings](
	[listing_id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[available] [bit] NOT NULL,
	[price] [float] NULL,
	[adjusted_price] [float] NULL,
	[minimum_nights] [int] NULL,
	[maximum_nights] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listings]    Script Date: 6/22/2025 9:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listings](
	[listing_id] [bigint] NOT NULL,
	[listing_url] [nvarchar](50) NULL,
	[scrape_id] [datetime2](7) NULL,
	[last_scraped] [date] NULL,
	[source] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](1050) NULL,
	[neighborhood_overview] [nvarchar](1050) NULL,
	[picture_url] [nvarchar](150) NULL,
	[host_id] [int] NULL,
	[host_url] [nvarchar](50) NULL,
	[host_name] [nvarchar](50) NULL,
	[host_since] [date] NULL,
	[host_location] [nvarchar](50) NULL,
	[host_about] [nvarchar](max) NULL,
	[host_response_time] [nvarchar](50) NULL,
	[host_response_rate] [nvarchar](50) NULL,
	[host_acceptance_rate] [nvarchar](50) NULL,
	[host_is_superhost] [bit] NULL,
	[host_thumbnail_url] [nvarchar](150) NULL,
	[host_picture_url] [nvarchar](150) NULL,
	[host_neighbourhood] [nvarchar](50) NULL,
	[host_listings_count] [int] NULL,
	[host_total_listings_count] [int] NULL,
	[host_verifications] [nvarchar](50) NULL,
	[host_has_profile_pic] [bit] NULL,
	[host_identity_verified] [bit] NULL,
	[neighbourhood] [nvarchar](150) NULL,
	[neighbourhood_cleansed] [nvarchar](50) NULL,
	[neighbourhood_group_cleansed] [nvarchar](1) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[property_type] [nvarchar](50) NULL,
	[room_type] [nvarchar](50) NULL,
	[accommodates] [tinyint] NULL,
	[bathrooms] [nvarchar](1) NULL,
	[bathrooms_text] [nvarchar](50) NULL,
	[bedrooms] [tinyint] NULL,
	[beds] [tinyint] NULL,
	[amenities] [nvarchar](max) NULL,
	[price] [float] NULL,
	[minimum_nights] [smallint] NULL,
	[maximum_nights] [smallint] NULL,
	[minimum_minimum_nights] [smallint] NULL,
	[maximum_minimum_nights] [smallint] NULL,
	[minimum_maximum_nights] [smallint] NULL,
	[maximum_maximum_nights] [smallint] NULL,
	[minimum_nights_avg_ntm] [float] NULL,
	[maximum_nights_avg_ntm] [float] NULL,
	[calendar_updated] [nvarchar](1) NULL,
	[has_availability] [bit] NULL,
	[availability_30] [tinyint] NULL,
	[availability_60] [tinyint] NULL,
	[availability_90] [tinyint] NULL,
	[availability_365] [smallint] NULL,
	[calendar_last_scraped] [date] NULL,
	[number_of_reviews] [smallint] NULL,
	[number_of_reviews_ltm] [tinyint] NULL,
	[number_of_reviews_l30d] [tinyint] NULL,
	[first_review] [date] NULL,
	[last_review] [date] NULL,
	[review_scores_rating] [float] NULL,
	[review_scores_accuracy] [float] NULL,
	[review_scores_cleanliness] [float] NULL,
	[review_scores_checkin] [float] NULL,
	[review_scores_communication] [float] NULL,
	[review_scores_location] [float] NULL,
	[review_scores_value] [float] NULL,
	[license] [nvarchar](50) NULL,
	[instant_bookable] [bit] NULL,
	[calculated_host_listings_count] [tinyint] NULL,
	[calculated_host_listings_count_entire_homes] [tinyint] NULL,
	[calculated_host_listings_count_private_rooms] [tinyint] NULL,
	[calculated_host_listings_count_shared_rooms] [tinyint] NULL,
	[reviews_per_month] [float] NULL,
 CONSTRAINT [PK_listing_id] PRIMARY KEY CLUSTERED 
(
	[listing_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 6/22/2025 9:16:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[listing_id] [bigint] NOT NULL,
	[review_id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[reviewer_id] [int] NULL,
	[reviewer_name] [nvarchar](50) NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [pk_reviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[bookings]  WITH CHECK ADD  CONSTRAINT [FK_bookings_listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[listings] ([listing_id])
GO
ALTER TABLE [dbo].[bookings] CHECK CONSTRAINT [FK_bookings_listings]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [fk_reviews_listing] FOREIGN KEY([listing_id])
REFERENCES [dbo].[listings] ([listing_id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [fk_reviews_listing]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_has_availability] CHECK  (([has_availability]=(1) OR [has_availability]=(0)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_has_availability]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_host_has_pic] CHECK  (([host_has_profile_pic]=(1) OR [host_has_profile_pic]=(0)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_host_has_pic]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_host_identity_verified] CHECK  (([host_identity_verified]=(1) OR [host_identity_verified]=(0)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_host_identity_verified]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_host_is_superhost] CHECK  (([host_is_superhost]=(1) OR [host_is_superhost]=(0)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_host_is_superhost]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_instant_bookable] CHECK  (([instant_bookable]=(1) OR [instant_bookable]=(0)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_instant_bookable]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_latitude_range] CHECK  (([latitude]>=(-90) AND [latitude]<=(90)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_latitude_range]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_longitude_range] CHECK  (([longitude]>=(-180) AND [longitude]<=(180)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_longitude_range]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_maximum_nights] CHECK  (([maximum_nights]>=[minimum_nights]))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_maximum_nights]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_minimum_nights] CHECK  (([minimum_nights]>=(1)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_minimum_nights]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_accuracy] CHECK  (([review_scores_accuracy]>=(0) AND [review_scores_accuracy]<=(6)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_accuracy]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_checkin] CHECK  (([review_scores_checkin]>=(0) AND [review_scores_checkin]<=(8)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_checkin]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_cleanliness] CHECK  (([review_scores_cleanliness]>=(0) AND [review_scores_cleanliness]<=(7)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_cleanliness]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_communication] CHECK  (([review_scores_communication]>=(0) AND [review_scores_communication]<=(9)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_communication]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_location] CHECK  (([review_scores_location]>=(0) AND [review_scores_location]<=(10)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_location]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_rating] CHECK  (([review_scores_rating]>=(0) AND [review_scores_rating]<=(5)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_rating]
GO
ALTER TABLE [dbo].[listings]  WITH CHECK ADD  CONSTRAINT [CHK_review_value] CHECK  (([review_scores_value]>=(0) AND [review_scores_value]<=(11)))
GO
ALTER TABLE [dbo].[listings] CHECK CONSTRAINT [CHK_review_value]
GO
USE [master]
GO
ALTER DATABASE [GreekAirbnb] SET  READ_WRITE 
GO

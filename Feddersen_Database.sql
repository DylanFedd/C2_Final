USE [C2_Final]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/14/2023 8:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriversLicenseNumber] [int] NOT NULL,
	[DriverLName] [varchar](50) NOT NULL,
	[DriverFName] [varchar](50) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[DriverBDay] [varchar](50) NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[DriversLicenseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infractions]    Script Date: 5/14/2023 8:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infractions](
	[InfractionsID] [int] NOT NULL,
	[InfractionsName] [varchar](50) NOT NULL,
	[DriversLicenseNumber] [int] NOT NULL,
	[LicensePlateNumber] [int] NOT NULL,
	[VehiclesYear] [nchar](10) NULL,
 CONSTRAINT [PK_Infractions] PRIMARY KEY CLUSTERED 
(
	[InfractionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 5/14/2023 8:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[loginID] [int] NOT NULL,
	[loginUsername] [varchar](50) NOT NULL,
	[loginPassword] [varchar](50) NOT NULL,
	[Role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[loginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/14/2023 8:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[LicensePlateNumber] [int] NOT NULL,
	[VehiclesName] [varchar](50) NOT NULL,
	[Vehiclescolor] [varchar](50) NULL,
	[Vehiclesmodal] [varchar](50) NULL,
	[VehiclesYear] [varchar](50) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[LicensePlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD  CONSTRAINT [FK_Infractions_Drivers] FOREIGN KEY([DriversLicenseNumber])
REFERENCES [dbo].[Drivers] ([DriversLicenseNumber])
GO
ALTER TABLE [dbo].[Infractions] CHECK CONSTRAINT [FK_Infractions_Drivers]
GO
ALTER TABLE [dbo].[Infractions]  WITH CHECK ADD  CONSTRAINT [FK_Infractions_Vehicles] FOREIGN KEY([LicensePlateNumber])
REFERENCES [dbo].[Vehicles] ([LicensePlateNumber])
GO
ALTER TABLE [dbo].[Infractions] CHECK CONSTRAINT [FK_Infractions_Vehicles]
GO

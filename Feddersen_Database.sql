USE [C2_Final]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/14/2023 8:48:12 PM ******/
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
/****** Object:  Table [dbo].[Infractions]    Script Date: 5/14/2023 8:48:12 PM ******/
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
/****** Object:  Table [dbo].[login]    Script Date: 5/14/2023 8:48:12 PM ******/
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
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/14/2023 8:48:12 PM ******/
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
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1043, N'Davis', N'Daniel', N'1236', N'2/4/1983')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1205, N'Taylor', N'Christopher', N'9143', N'3/12/2009')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1234, N'Dow', N'John', N'4321', N'9/6/1999')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1794, N'Brown', N'Matthew', N'3488', N'4/04/1996')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1843, N'Ber', N'Tim', N'2917', N'3/5/2001')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (1849, N'Wind', N'Katie', N'9126', N'4/5/2002')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (2001, N'Dor', N'Con', N'2002', N'5/14/2009')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (2002, N'Mike', N'Cool', N'2003', N'4/21/2008')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (4312, N'Smith', N'Michael', N'1243', N'3/12/2002')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (5385, N'Nick', N'Dom', N'7496', N'6/7/1988')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (8535, N'Johnson', N'James', N'8371', N'5/12/2012')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (9120, N'Moore', N'David', N'7392', N'3/23/2011')
INSERT [dbo].[Drivers] ([DriversLicenseNumber], [DriverLName], [DriverFName], [SSN], [DriverBDay]) VALUES (9123, N'Williams', N'Andrew', N'1235', N'6/03/1995')
GO
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (1, N'Speeding', 1234, 12345, N'2004      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (2, N'Speeding', 1843, 12345, N'2004      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (3, N'NoSeatBelt', 1849, 12853, N'1999      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (4, N'speeding', 2001, 55355, N'1988      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (5, N'Crash', 9123, 95864, N'2001      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (6, N'NoSeatBelt', 9120, 93483, N'1982      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (7, N'NoSeatBelt', 8535, 93483, N'1982      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (8, N'Crash', 5385, 54321, N'1991      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (9, N'Speeding', 4312, 48596, N'2004      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (10, N'Speeding', 2001, 55355, N'1988      ')
INSERT [dbo].[Infractions] ([InfractionsID], [InfractionsName], [DriversLicenseNumber], [LicensePlateNumber], [VehiclesYear]) VALUES (11, N'speeding', 2002, 55354, N'1997      ')
GO
INSERT [dbo].[login] ([loginID], [loginUsername], [loginPassword], [Role]) VALUES (1, N'dmv', N'dmv', N'dmv')
INSERT [dbo].[login] ([loginID], [loginUsername], [loginPassword], [Role]) VALUES (2, N'law', N'law', N'law')
GO
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (11389, N'Subaru BRAT', N'red', N'124', N'2002')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (12345, N'Ford Probe', N'silver', N'732', N'2004')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (12575, N'Camry', N'silver', N'954', N'2012')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (12853, N'Mazda Laputa', N'red', N'176', N'1999')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (16745, N'Ferrari LaFerrari
', N'red', N'176', N'1995')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (35741, N'Aston Martin', N'black', N'784', N'2014')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (48596, N'Volkswagen Beetle
', N'red', N'783', N'2004')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (54321, N'Ford Mustang', N'blue', N'834', N'1991')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (55354, N'Ford Truck', N'blue', N'578', N'1997')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (55355, N'Truck', N'red', N'953', N'1988')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (93483, N'Mitsubishi Pajero', N'blue', N'782', N'1982')
INSERT [dbo].[Vehicles] ([LicensePlateNumber], [VehiclesName], [Vehiclescolor], [Vehiclesmodal], [VehiclesYear]) VALUES (95864, N'Dodge Viper', N'blue', N'781', N'2001')
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

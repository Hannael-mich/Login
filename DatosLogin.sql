USE [Generacion23]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 25/12/2023 06:23:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Paterno] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[UsuariosId] [int] NULL,
 CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/12/2023 06:23:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contactos] ON 

INSERT [dbo].[Contactos] ([id], [Nombre], [Paterno], [Telefono], [UsuariosId]) VALUES (1, N'Carmen', N'Salas', N'5516251825', 1)
INSERT [dbo].[Contactos] ([id], [Nombre], [Paterno], [Telefono], [UsuariosId]) VALUES (2, N'Ale', N'Gon', N'5526158187', 1)
INSERT [dbo].[Contactos] ([id], [Nombre], [Paterno], [Telefono], [UsuariosId]) VALUES (6, N'Andy', N'Per', N'5615841526', 2)
INSERT [dbo].[Contactos] ([id], [Nombre], [Paterno], [Telefono], [UsuariosId]) VALUES (7, N'Enrique', N'Morales', N'155514541', 1)
SET IDENTITY_INSERT [dbo].[Contactos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [NombreCompleto], [NickName], [Password]) VALUES (1, N'Oscar Lop', N'Gasper', N'123')
INSERT [dbo].[Usuarios] ([id], [NombreCompleto], [NickName], [Password]) VALUES (2, N'Diego Rod', N'Diego', N'123')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Usuarios] FOREIGN KEY([UsuariosId])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_Usuarios]
GO

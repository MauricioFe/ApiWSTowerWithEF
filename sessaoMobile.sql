USE master
GO
DROP DATABASE [SessaoMobile]
GO
CREATE DATABASE [SessaoMobile]
GO
USE [SessaoMobile]
GO
/****** Object:  Table [dbo].[Funcao]    Script Date: 07/08/2020 16:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcao](
	[id] [int] NOT NULL IDENTITY,
	[funcao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Funcao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relatos]    Script Date: 07/08/2020 16:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relatos](
	[id] [int] NOT NULL IDENTITY,
	[relato] [nvarchar](255) NOT NULL,
	[imagem] [nvarchar](255) NOT NULL,
	[latitude] [decimal](18, 8) NOT NULL,
	[longitude] [decimal](18, 8) NOT NULL,
	[usuarioid] [int] NULL,
 CONSTRAINT [PK_Relatos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/08/2020 16:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] NOT NULL IDENTITY,
	[nome] [nvarchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[senha] [nvarchar](50) NOT NULL,
	[telefone] [nvarchar](13) NOT NULL,
	[funcaoid] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relatos]  WITH CHECK ADD  CONSTRAINT [FK_Relatos_Usuario] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Relatos] CHECK CONSTRAINT [FK_Relatos_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Funcao] FOREIGN KEY([funcaoid])
REFERENCES [dbo].[Funcao] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Funcao]
GO


INSERT INTO [dbo].[Funcao] (  [funcao]) VALUES ('Administrador')
INSERT INTO [dbo].[Funcao] (  [funcao]) VALUES ('Usuario')
GO

INSERT [dbo].[Usuario] ( [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Maicon', N'maiconsantana@gmail.com', N'maicon55', N'985431546', 1)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Tatiana', N'tati@katana.com.br', N'12345', N'955828564',1)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Kailanne', N'kakau@master.com.br', N'1405', N'985431546', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Vivian Thaís', N'vivian.louise27@gmail.com', N'5457hyy', N'956234587', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Daniela Aquino', N'cleodani@outlook.com', N'dani75584', N'9863584512', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Luiz Levy Pandini Figueiredo', N'Levy_pandini@hotmail.com', N'667774', N'971666548', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Juliana Benedita', N'benedita@bol.com.br', N'565454', N'9235654875', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Jakeline Barbosa', N'jakeline-barbosa@gmail.com.br', N'4455877', N'965574451', 2)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Matheus Soares', N'matheuszoares@yahoo.com.br', N'79998560092', N'922235665', 1)
GO
INSERT [dbo].[Usuario] (  [nome], [email], [senha], [telefone], [funcaoid]) VALUES (N'Italo Baciliere', N'matheuszoares@yahoo.com.br', N'79998560092', N'998885623', 2)
GO


INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Incêndio no lado leste na floresta Amazônica, está destruindo boa parte da vegetação. E obrigando os animais a fugir.', '070820201643.jgp', -4.782636, -68.939604, null)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Lixo espalhado na rua obstruindo a passagem dos carros', '080820201055.jgp', -4.782636, -68.939604, 7)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Após o carnval as ruas estão podres e a prefeitura ainda não fez nada a respeito! Absurdo', '220220200932.jgp', -24.840988, -51.295736, 3)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Incêndio no parque nacional acontecendo nesse momento. Tinha bastante gente, imagino que tenha sido alguém mal intêncionado', '080820201422.jgp', -19.938167, -43.955136, 4)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Rio lotado de lixo.', '310620201022.jgp', -24.840988, -51.295736, 7)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Maus tratos com animais silvestres.', '250220191035.jgp', -26.996069, -48.635011, 10)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Denúncia contra gestores que não cumpriram recomendação para desativar lixões', '151020200932.jgp', -15.718413, -47.962090, 10)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Exploração mineral clandestina', '240220201351.jgp', -9.427733, -35.639372, 8)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Queima de lixo doméstico em um lote vago.', '310620202133.jgp', -20.259644, -40.257380, null)
GO
INSERT [dbo].[Relatos] ([relato], [imagem], [latitude], [longitude], [usuarioid]) VALUES ('Fábrica libera um volume enorme de CO2 após queimar carvão.', '050220191722.jgp', -6.005719, -54.005524, null)
GO



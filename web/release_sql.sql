
/**
  1:执行建表SQL后将表(MODULE,PROJECT,STAFFINFO,STYLE)主键取消
  2:执行插入表数据后重新将主键启用
 */
USE [erp]
GO
/****** Object:  Table [dbo].[MODULE]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODULE](
	[MODULE_ID] [int] IDENTITY(1,1) NOT NULL,
	[MODULE_NAME] [varchar](120) NOT NULL,
	[HREF] [varchar](120) NULL,
	[PARENTID] [int] NOT NULL,
	[PARENTTYPE] [char](1) NOT NULL,
	[DISPLAY] [char](1) NOT NULL,
	[DIS_ORDER] [int] NOT NULL,
	[ICON] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MODULE] PRIMARY KEY CLUSTERED
(
	[MODULE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECT](
	[PROJECTID] [int] IDENTITY(200,1) NOT NULL,
	[PROJECTCODE] [varchar](16) NOT NULL,
	[PROJECTNAME] [varchar](255) NOT NULL,
	[STYLEID] [int] NULL,
	[PROJECTDESC] [varchar](255) NULL,
	[STATUS] [char](1) NOT NULL,
	[URL] [varchar](200) NULL,
 CONSTRAINT [pk_HDMP_PROJECT_PROJECTID] PRIMARY KEY CLUSTERED
(
	[PROJECTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SERIALNUMBER]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SERIALNUMBER](
	[DBID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](64) NOT NULL,
	[VALUE] [int] NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_SERIALNUMBER] PRIMARY KEY CLUSTERED
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STAFFINFO]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STAFFINFO](
	[STAFFID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[STAFFCODE] [varchar](64) NOT NULL,
	[STAFFNAME] [varchar](128) NOT NULL,
	[PASSWORD] [varchar](64) NOT NULL,
	[TELPHONE] [varchar](11) NULL,
	[IS_INIT] [char](1) NULL,
	[IS_DEL] [char](1) NOT NULL,
	[STYLEID] [numeric](12, 0) NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
	[LAST_LOGIN_TIME] [datetime] NULL,
 CONSTRAINT [PK_STAFFINFO_1] PRIMARY KEY CLUSTERED
(
	[STAFFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STYLE]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STYLE](
	[STYLEID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[STYLE] [varchar](20) NOT NULL,
	[STYLEDESC] [varchar](100) NULL,
 CONSTRAINT [PK_STYLE] PRIMARY KEY CLUSTERED
(
	[STYLEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_GYS]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_GYS](
	[DBID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[GYSBM] [varchar](30) NOT NULL,
	[GYSMC] [varchar](120) NOT NULL,
	[GYSMS] [varchar](120) NULL,
	[IS_DEL] [char](1) NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_T_GYS] PRIMARY KEY CLUSTERED
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_WL]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_WL](
	[DBID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[WLBM] [varchar](30) NOT NULL,
	[WLMC] [varchar](120) NOT NULL,
	[WLMS] [varchar](120) NULL,
	[IS_DEL] [char](1) NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_T_WL] PRIMARY KEY CLUSTERED
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_YJ]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_YJ](
	[DBID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[YJYF] [varchar](7) NOT NULL,
	[YJZC] [numeric](12, 3) NOT NULL,
	[YJHZ] [numeric](12, 3) NOT NULL,
	[YJYE] [numeric](12, 3) NOT NULL,
	[STAFFID] [numeric](12, 0) NOT NULL,
	[YJLX] [char](1) NOT NULL,
	[IS_DEL] [char](1) NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_T_YJ] PRIMARY KEY CLUSTERED
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_YW]    Script Date: 2016-08-19 16:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_YW](
	[DBID] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[WLBM] [varchar](30) NOT NULL,
	[GYSBM] [varchar](30) NOT NULL,
	[PRICE] [numeric](10, 2) NOT NULL,
	[NUMBER] [numeric](10, 0) NOT NULL,
	[STAFFID] [numeric](18, 0) NOT NULL,
	[SHOPPINGTIME] [date] NOT NULL,
	[IS_DEL] [char](1) NOT NULL,
	[CREATE_DATE] [datetime] NOT NULL,
	[UPDATE_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_T_YW] PRIMARY KEY CLUSTERED
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO



/****** Object:  以下为数据库表数据    Script Date: 2016-08-12 14:22:10 ******/
SET IDENTITY_INSERT [dbo].[MODULE] ON
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (2, N'图表管理', NULL, 200, N'p', N'0', 10, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (3, N'填报管理', NULL, 200, N'p', N'0', 20, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (4, N'图表展示', N'/erp/chart/chart.jsp', 2, N'm', N'0', 30, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (5, N'填报增加', N'/erp/report/report_add.jsp', 6, N'm', N'0', 40, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (6, N'填报管理', NULL, 3, N'm', N'0', 50, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (7, N'填报查询', N'/erp/report/report_query.jsp', 6, N'm', N'0', 60, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (9, N'系统管理', NULL, 200, N'p', N'0', 80, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (11, N'用户设置', N'/erp/sys/user/user.jsp', 9, N'm', N'0', 180, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (12, N'物料管理', NULL, 9, N'm', N'0', 90, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (13, N'供应商管理', NULL, 9, N'm', N'0', 100, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (14, N'物料增加', N'/erp/zsj/wl/wl_add.jsp', 12, N'm', N'0', 110, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (15, N'物料查询', N'/erp/zsj/wl/wl_query.jsp', 12, N'm', N'0', 120, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (16, N'供应商增加', N'/erp/zsj/gys/gys_add.jsp', 13, N'm', N'0', 130, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (17, N'供应商查询', N'/erp/zsj/gys/gys_query.jsp', 13, N'm', N'0', 140, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (18, N'模块管理', NULL, 9, N'm', N'0', 150, N'folder')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (19, N'模块修改', N'/erp/sys/module/module.jsp', 18, N'm', N'0', 160, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (1023, N'月度结算', N'/erp/report/ydjs_add.jsp', 6, N'm', N'0', 230, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (1027, N'月度结算图表', N'/erp/chart/ydjs.jsp', 2, N'm', N'0', 250, N'file')
INSERT [dbo].[MODULE] ([MODULE_ID], [MODULE_NAME], [HREF], [PARENTID], [PARENTTYPE], [DISPLAY], [DIS_ORDER], [ICON]) VALUES (1030, N'界面样式维护', N'/erp/sys/style/style.jsp', 9, N'm', N'0', 260, N'file')
SET IDENTITY_INSERT [dbo].[MODULE] OFF


SET IDENTITY_INSERT [dbo].[PROJECT] ON
INSERT [dbo].[PROJECT] ([PROJECTID], [PROJECTCODE], [PROJECTNAME], [STYLEID], [PROJECTDESC], [STATUS], [URL]) VALUES (200, N'ERP', N'填报系统', NULL, N'填报系统', N'0', N'')
SET IDENTITY_INSERT [dbo].[PROJECT] OFF

/******  插入用户数据时，有且只有一条IS_INIT字段为1的有效(IS_DEL=0)数据,以下数据可忽略 ******/
SET IDENTITY_INSERT [dbo].[STAFFINFO] ON
INSERT [dbo].[STAFFINFO] ([STAFFID], [STAFFCODE], [STAFFNAME], [PASSWORD], [TELPHONE], [IS_INIT], [IS_DEL], [STYLEID], [CREATE_DATE], [UPDATE_DATE], [LAST_LOGIN_TIME]) VALUES (CAST(1 AS Numeric(12, 0)), N'wy1234', N'王英', N'F75B4BE19EB3AC7DB640A90B89C5E67B', N'15563957476', N'1', N'0', CAST(2 AS Numeric(12, 0)), CAST(N'2016-04-07 14:57:14.430' AS DateTime), CAST(N'2016-08-18 15:42:32.837' AS DateTime), CAST(N'2016-08-19 09:32:25.683' AS DateTime))
INSERT [dbo].[STAFFINFO] ([STAFFID], [STAFFCODE], [STAFFNAME], [PASSWORD], [TELPHONE], [IS_INIT], [IS_DEL], [STYLEID], [CREATE_DATE], [UPDATE_DATE], [LAST_LOGIN_TIME]) VALUES (CAST(2 AS Numeric(12, 0)), N'zyf1234', N'张永福', N'949AFE7080D5BFE553155410C5A76199', N'13401234567', N'0', N'0', CAST(3 AS Numeric(12, 0)), CAST(N'2016-04-08 09:10:20.043' AS DateTime), CAST(N'2016-08-18 15:08:05.523' AS DateTime), CAST(N'2016-08-12 16:25:30.510' AS DateTime))
INSERT [dbo].[STAFFINFO] ([STAFFID], [STAFFCODE], [STAFFNAME], [PASSWORD], [TELPHONE], [IS_INIT], [IS_DEL], [STYLEID], [CREATE_DATE], [UPDATE_DATE], [LAST_LOGIN_TIME]) VALUES (CAST(3 AS Numeric(12, 0)), N'ckc1234', N'陈柯村', N'6B806F216A9839A3C9B89A13C24A7906', N'13412345678', N'0', N'0', CAST(3 AS Numeric(12, 0)), CAST(N'2016-04-08 09:12:31.660' AS DateTime), CAST(N'2016-08-19 09:34:36.427' AS DateTime), CAST(N'2016-08-19 09:35:42.547' AS DateTime))
INSERT [dbo].[STAFFINFO] ([STAFFID], [STAFFCODE], [STAFFNAME], [PASSWORD], [TELPHONE], [IS_INIT], [IS_DEL], [STYLEID], [CREATE_DATE], [UPDATE_DATE], [LAST_LOGIN_TIME]) VALUES (CAST(5 AS Numeric(12, 0)), N'wangying', N'王英', N'F75B4BE19EB3AC7DB640A90B89C5E67B', N'15563957476', N'0', N'0', CAST(5 AS Numeric(12, 0)), CAST(N'2016-07-28 14:32:10.263' AS DateTime), CAST(N'2016-08-18 15:47:02.457' AS DateTime), CAST(N'2016-08-18 15:32:08.797' AS DateTime))
SET IDENTITY_INSERT [dbo].[STAFFINFO] OFF


SET IDENTITY_INSERT [dbo].[STYLE] ON
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(1 AS Numeric(12, 0)), N'black', N'黑色样式')
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(2 AS Numeric(12, 0)), N'bootstrap', NULL)
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(3 AS Numeric(12, 0)), N'default', NULL)
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(4 AS Numeric(12, 0)), N'gray', NULL)
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(5 AS Numeric(12, 0)), N'material', NULL)
INSERT [dbo].[STYLE] ([STYLEID], [STYLE], [STYLEDESC]) VALUES (CAST(6 AS Numeric(12, 0)), N'metro', NULL)
SET IDENTITY_INSERT [dbo].[STYLE] OFF



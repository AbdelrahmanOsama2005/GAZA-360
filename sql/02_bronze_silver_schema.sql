USE [GazaProject]
GO
/****** Object:  Table [bronze].[casualties_daily_raw]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[casualties_daily_raw](
	[report_date] [date] NOT NULL,
	[report_source] [varchar](20) NULL,
	[report_period] [int] NULL,
	[ext_massacres_cum] [int] NULL,
	[killed] [int] NULL,
	[killed_cum] [int] NULL,
	[ext_killed] [int] NULL,
	[ext_killed_cum] [int] NULL,
	[ext_killed_children_cum] [int] NULL,
	[ext_killed_women_cum] [int] NULL,
	[injured_cum] [int] NULL,
	[ext_injured] [int] NULL,
	[ext_injured_cum] [int] NULL,
	[ext_civdef_killed_cum] [int] NULL,
	[med_killed_cum] [int] NULL,
	[ext_med_killed_cum] [int] NULL,
	[press_killed_cum] [int] NULL,
	[ext_press_killed_cum] [int] NULL,
	[killed_recovered] [int] NULL,
	[killed_succumbed] [int] NULL,
	[killed_truce_new] [int] NULL,
	[killed_committee] [int] NULL,
	[child_famine_cum] [int] NULL,
	[famine_cum] [int] NULL,
	[aid_seeker_killed_cum] [int] NULL,
	[aid_seeker_injured_cum] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[killed_demographics_raw]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[killed_demographics_raw](
	[age] [int] NOT NULL,
	[sex] [char](1) NOT NULL,
	[update_batch] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bronze].[population_idb_raw]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bronze].[population_idb_raw](
	[age] [int] NOT NULL,
	[male] [int] NOT NULL,
	[female] [int] NOT NULL,
	[total] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [silver].[casualties_daily]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[casualties_daily](
	[report_date] [date] NOT NULL,
	[day_number] [int] NOT NULL,
	[source_type] [varchar](20) NOT NULL,
	[is_estimated] [bit] NOT NULL,
	[killed_daily] [int] NOT NULL,
	[killed_cum] [int] NOT NULL,
	[injured_daily] [int] NOT NULL,
	[injured_cum] [int] NOT NULL,
	[children_killed_cum] [int] NOT NULL,
	[women_killed_cum] [int] NOT NULL,
	[civdef_killed_cum] [int] NOT NULL,
	[medical_killed_cum] [int] NOT NULL,
	[press_killed_cum] [int] NOT NULL,
	[massacres_cum] [int] NOT NULL,
	[killed_recovered] [int] NOT NULL,
	[killed_succumbed] [int] NOT NULL,
	[killed_truce_new] [int] NOT NULL,
	[killed_committee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[report_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [silver].[killed_demographics]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[killed_demographics](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[age] [int] NOT NULL,
	[sex] [varchar](6) NOT NULL,
	[age_group] [varchar](6) NOT NULL,
	[life_stage] [varchar](6) NOT NULL,
	[update_batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [silver].[population_2023_band]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[population_2023_band](
	[sort_age] [int] NULL,
	[age_band] [varchar](25) NOT NULL,
	[female_pop] [int] NULL,
	[male_pop] [int] NULL,
	[total_pop] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [silver].[update_batches]    Script Date: 11/18/2026 2:11:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[update_batches](
	[update_batch] [int] NOT NULL,
	[asof_date] [date] NOT NULL,
	[note] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[update_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [silver].[casualties_daily] ADD  CONSTRAINT [df_sr]  DEFAULT ((0)) FOR [killed_recovered]
GO
ALTER TABLE [silver].[casualties_daily] ADD  CONSTRAINT [df_ss]  DEFAULT ((0)) FOR [killed_succumbed]
GO
ALTER TABLE [silver].[casualties_daily] ADD  CONSTRAINT [df_st]  DEFAULT ((0)) FOR [killed_truce_new]
GO
ALTER TABLE [silver].[casualties_daily] ADD  CONSTRAINT [df_sc]  DEFAULT ((0)) FOR [killed_committee]
GO

USE [GazaProject]
GO
/****** Object:  Table [gold].[age_sex_summary]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[age_sex_summary](
	[age_group] [varchar](6) NOT NULL,
	[sort_age] [int] NULL,
	[females] [int] NULL,
	[males] [int] NULL,
	[total] [int] NULL,
	[pct_of_total] [decimal](5, 1) NULL,
	[female_pct_in_group] [decimal](5, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[dim_age]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[dim_age](
	[age_key] [int] NOT NULL,
	[age_label] [varchar](4) NULL,
	[age_band] [varchar](25) NOT NULL,
	[age_band_order] [int] NULL,
	[life_stage] [varchar](6) NOT NULL,
	[life_stage_order] [int] NOT NULL,
 CONSTRAINT [pk_dim_age] PRIMARY KEY CLUSTERED 
(
	[age_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[dim_age_band]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[dim_age_band](
	[sort_age] [int] NULL,
	[age_band] [varchar](25) NOT NULL,
	[broad_group] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[dim_date]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[dim_date](
	[date_key] [date] NOT NULL,
	[year_num] [int] NULL,
	[month_num] [int] NULL,
	[month_name] [nvarchar](30) NULL,
	[year_month] [nvarchar](4000) NULL,
	[month_start] [date] NULL,
	[day_number] [int] NOT NULL,
	[is_complete_month] [int] NOT NULL,
 CONSTRAINT [pk_dim_date] PRIMARY KEY CLUSTERED 
(
	[date_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[dim_sex]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[dim_sex](
	[sex] [varchar](6) NOT NULL,
	[sex_order] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[dim_update_batch]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[dim_update_batch](
	[update_batch] [int] NOT NULL,
	[asof_date] [date] NOT NULL,
	[batch_label] [varchar](31) NOT NULL,
	[note] [varchar](100) NULL,
 CONSTRAINT [pk_dim_update_batch] PRIMARY KEY CLUSTERED 
(
	[update_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[fact_daily_casualties]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[fact_daily_casualties](
	[date_key] [date] NOT NULL,
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
	[killed_committee] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[fact_identified_deaths]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[fact_identified_deaths](
	[age_key] [int] NOT NULL,
	[sex] [varchar](6) NOT NULL,
	[update_batch] [int] NOT NULL,
	[deaths] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[fact_population]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[fact_population](
	[age_key] [int] NOT NULL,
	[sex] [varchar](6) NOT NULL,
	[population] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[monthly_summary]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[monthly_summary](
	[month_start] [date] NULL,
	[days_in_data] [int] NULL,
	[killed_month] [int] NULL,
	[injured_month] [int] NULL,
	[avg_daily_killed] [decimal](10, 1) NULL,
	[max_daily_killed] [int] NULL,
	[killed_cum_end] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [gold].[rates_by_age_sex]    Script Date: 11/13/2026 3:03:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gold].[rates_by_age_sex](
	[sort_age] [int] NULL,
	[age_band] [varchar](25) NOT NULL,
	[female_deaths] [int] NULL,
	[male_deaths] [int] NULL,
	[female_pop] [int] NULL,
	[male_pop] [int] NULL,
	[female_rate] [decimal](6, 1) NULL,
	[male_rate] [decimal](6, 1) NULL,
	[total_rate] [decimal](6, 1) NULL
) ON [PRIMARY]
GO
ALTER TABLE [gold].[fact_daily_casualties]  WITH CHECK ADD  CONSTRAINT [fk_daily_dim_date] FOREIGN KEY([date_key])
REFERENCES [gold].[dim_date] ([date_key])
GO
ALTER TABLE [gold].[fact_daily_casualties] CHECK CONSTRAINT [fk_daily_dim_date]
GO
ALTER TABLE [gold].[fact_identified_deaths]  WITH CHECK ADD  CONSTRAINT [fk_identified_dim_age] FOREIGN KEY([age_key])
REFERENCES [gold].[dim_age] ([age_key])
GO
ALTER TABLE [gold].[fact_identified_deaths] CHECK CONSTRAINT [fk_identified_dim_age]
GO
ALTER TABLE [gold].[fact_identified_deaths]  WITH CHECK ADD  CONSTRAINT [fk_identified_dim_batch] FOREIGN KEY([update_batch])
REFERENCES [gold].[dim_update_batch] ([update_batch])
GO
ALTER TABLE [gold].[fact_identified_deaths] CHECK CONSTRAINT [fk_identified_dim_batch]
GO
ALTER TABLE [gold].[fact_identified_deaths]  WITH CHECK ADD  CONSTRAINT [fk_identified_dim_sex] FOREIGN KEY([sex])
REFERENCES [gold].[dim_sex] ([sex])
GO
ALTER TABLE [gold].[fact_identified_deaths] CHECK CONSTRAINT [fk_identified_dim_sex]
GO
ALTER TABLE [gold].[fact_population]  WITH CHECK ADD  CONSTRAINT [fk_population_dim_age] FOREIGN KEY([age_key])
REFERENCES [gold].[dim_age] ([age_key])
GO
ALTER TABLE [gold].[fact_population] CHECK CONSTRAINT [fk_population_dim_age]
GO
ALTER TABLE [gold].[fact_population]  WITH CHECK ADD  CONSTRAINT [fk_population_dim_sex] FOREIGN KEY([sex])
REFERENCES [gold].[dim_sex] ([sex])
GO
ALTER TABLE [gold].[fact_population] CHECK CONSTRAINT [fk_population_dim_sex]
GO

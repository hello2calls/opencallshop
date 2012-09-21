exec sp_dboption N'VoipSwitch', N'autoclose', N'false'
GO

exec sp_dboption N'VoipSwitch', N'bulkcopy', N'true'
GO

exec sp_dboption N'VoipSwitch', N'trunc. log', N'true'
GO

exec sp_dboption N'VoipSwitch', N'torn page detection', N'true'
GO

exec sp_dboption N'VoipSwitch', N'read only', N'false'
GO

exec sp_dboption N'VoipSwitch', N'dbo use', N'false'
GO

exec sp_dboption N'VoipSwitch', N'single', N'false'
GO

exec sp_dboption N'VoipSwitch', N'autoshrink', N'false'
GO

exec sp_dboption N'VoipSwitch', N'ANSI null default', N'false'
GO

exec sp_dboption N'VoipSwitch', N'recursive triggers', N'false'
GO

exec sp_dboption N'VoipSwitch', N'ANSI nulls', N'false'
GO

exec sp_dboption N'VoipSwitch', N'concat null yields null', N'false'
GO

exec sp_dboption N'VoipSwitch', N'cursor close on commit', N'false'
GO

exec sp_dboption N'VoipSwitch', N'default to local cursor', N'false'
GO

exec sp_dboption N'VoipSwitch', N'quoted identifier', N'false'
GO

exec sp_dboption N'VoipSwitch', N'ANSI warnings', N'false'
GO

exec sp_dboption N'VoipSwitch', N'auto create statistics', N'true'
GO

exec sp_dboption N'VoipSwitch', N'auto update statistics', N'true'
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ClientInf_Lots]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ClientInf] DROP CONSTRAINT FK_ClientInf_Lots
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Calls_TariffsNames]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Calls] DROP CONSTRAINT FK_Calls_TariffsNames
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Tariffs_TariffsNames]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Tariffs] DROP CONSTRAINT FK_Tariffs_TariffsNames
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddressBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AddressBook]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BlockedIP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BlockedIP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Calls]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Calls]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CallsFailed]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CallsFailed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientInf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClientInf]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsE164]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClientsE164]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsHearLink]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClientsHearLink]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsIP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClientsIP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DialingPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DialingPlan]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Gatekeepers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Gatekeepers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Gateways]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Gateways]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IPNumbers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IPNumbers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lots]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Lots]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tariffs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tariffs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TariffsNames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TariffsNames]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[db_usersResellers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[db_usersResellers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[db_usersWWW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[db_usersWWW]
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AddressBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[AddressBook] (
	[id_address_book] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[telephone_number] [nchar] (50) NOT NULL ,
	[nickname] [nchar] (20) NOT NULL,
	[type] [int] NOT NULL default(1),
	[speeddial] [nchar] (50) NOT NULL default('')
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Calls]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Calls] (
	[id_call] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[ip_number] [char] (33) NOT NULL ,
	[caller_id] [char] (40) NOT NULL ,
	[called_number] [char] (40) NOT NULL ,
	[call_start] [datetime] NOT NULL ,
	[call_end] [datetime] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[cost] [decimal](12, 4) NULL ,
	[duration] [int] NOT NULL ,
	[tariff_prefix] [char] (20) NOT NULL ,
	[client_type] [int] NULL ,
	[id_route] [int] NULL,
	[pdd] [int] NOT NULL ,
	[costR1] [decimal] (12,4) NOT NULL default(0.000),
	[costR2] [decimal] (12,4) NOT NULL default(0.000),
	[costR3] [decimal] (12,4) NOT NULL default(0.000),
	[costD] [decimal] (12,4) NOT NULL default(0.000),
	[id_reseller] [int] NOT NULL default(-1) ,
	[tariffdesc] [char] (100) NOT NULL default(''),
	[id_cc] [int] NOT NULL default(0) ,
	[ratio] DECIMAL(12,4) NOT NULL DEFAULT(1)
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CallsFailed]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[CallsFailed] (
	[id_failed_call] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[ip_number] [char] (33) NOT NULL ,
	[caller_id] [char] (40) NOT NULL ,
	[called_number] [char] (40) NOT NULL ,
	[call_start] [datetime] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[IE_error_number] [int] NOT NULL ,
	[release_reason] [int] NOT NULL ,
	[client_type] [int] NOT NULL ,
	[id_route] [int] NOT NULL ,
	[pdd] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[tariff_prefix] [char] (20) NOT NULL,
	[id_tariff] [int] NOT NULL default(0) ,
	[tariffdesc] [char] (100) NOT NULL default('')
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CurrentCalls]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[CurrentCalls] ( 
	[id_call] [int] IDENTITY (1, 1) NOT NULL ,
	[id_active_call] [int] NOT NULL default (0), 
	[id_client] [int] NOT NULL default (0), 
	[dialed_number] [char] (40) NOT NULL default (''), 
	[call_start] [datetime] NOT NULL default ('0000-00-00 00:00:00'), 
	[client_type] [int] NOT NULL default (0), 
	[ani] [char] (40) NOT NULL default (''),
	[id_route] [int] NOT NULL default (0), 
	[route_type] [int] NOT NULL default (0),
	[id_reseller] [int] NOT NULL default (0) ,
	[tariffdesc] [char] (100) NOT NULL default('')
)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientInf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ClientInf] (
	[id_client] [int] NOT NULL ,
	[id_lot] [int] NOT NULL ,
	[serial] [int] NULL
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsE164]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ClientsE164] (
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL ,
	[password] [char] (20) NOT NULL ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[account_state] [numeric](12, 4) NOT NULL ,
	[tech_prefix] [char] (255) NOT NULL ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsHearLink]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ClientsHearLink] (
	[id_client] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[login] [char] (100) NOT NULL ,
	[password] [char] (20) NOT NULL ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[account_state] [numeric](12, 4) NOT NULL ,
	[tech_prefix] [char] (255) NOT NULL ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsIP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ClientsIP] (
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL ,
	[password] [char] (20) NOT NULL ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[account_state] [decimal](12, 4) NOT NULL ,
	[tech_prefix] [char] (255) NOT NULL ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[clientscallback]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[clientscallback] ( 
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL default (''), 
	[password] [char] (20) NOT NULL default (''), 
	[type] [int] NOT NULL default (0), 
	[id_tariff] [int] NOT NULL default (0), 
	[account_state] [decimal] (12,4) NOT NULL default (0.0000), 
	[tech_prefix] [char] (255) NOT NULL default ('') ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsPIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN

CREATE TABLE [dbo].[ClientsPIN] ( 
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL default (''), 
	[password] [char] (20) NOT NULL default (''), 
	[type] [int] NOT NULL default (0), 
	[id_tariff] [int] NOT NULL default (0), 
	[account_state] [decimal] (12,4) NOT NULL default (0.0000), 
	[tech_prefix] [char] (255) NOT NULL default ('') ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientsShared]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ClientsShared] ( 
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL default (''), 
	[password] [char] (20) NOT NULL default (''), 
	[type] [int] NOT NULL default (0), 
	[id_tariff] [int] NOT NULL default (0), 
	[account_state] [decimal] (12,4) NOT NULL default (0.0000), 
	[tech_prefix] [char] (255) NOT NULL default ('') ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[type2] [int] NOT NULL DEFAULT (0) ,
	[type3] [int] NOT NULL DEFAULT (0) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	id_currency INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DialingPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[DialingPlan] (
	[id_dialplan] [int] IDENTITY (1, 1) NOT NULL ,
	[telephone_number] [char] (40) NOT NULL ,
	[priority] [smallint] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[tech_prefix] [char] (255) NOT NULL ,
	[dial_as] [char] (40) NOT NULL DEFAULT(''),
	[id_route] [int] NOT NULL ,
	[call_type] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[from_day] [smallint] NOT NULL DEFAULT(0),
	[to_day] [smallint] NOT NULL DEFAULT(6),
	[from_hour] [smallint] NOT NULL DEFAULT(0),
	[to_hour] [smallint] NOT NULL DEFAULT(2400),
	[balance_share] [int] NOT NULL default(100)
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Gatekeepers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Gatekeepers] (
	[id_route] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [char] (20) NOT NULL ,
	[ip_number] [char] (255) NOT NULL ,
	[h323_id] [char] (100) NOT NULL ,
	[e164_id] [char] (100) NOT NULL ,
	[ttl] [int] NOT NULL ,
	[token] [char] (10) NOT NULL DEFAULT(''),
	[type] [int] NOT NULL ,
	[gk_name] [char] (100) NOT NULL ,
	[id_tariff] [int] NOT NULL default(-1),
	[string1] [char] (255) NOT NULL DEFAULT(''),
	[call_limit] [int] NOT NULL default(0)
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Gateways]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Gateways] (
	[id_route] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [char] (20) NOT NULL ,
	[ip_number] [char] (255) NOT NULL ,
	[h323_id] [char] (100) NOT NULL ,
	[type] [int] NOT NULL ,
	[call_limit] [int] NOT NULL default(0),
	[id_tariff] [int] NOT NULL default(-1)
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IPNumbers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[IPNumbers] (
	[id_ip] [int] IDENTITY (1, 1) NOT NULL ,
	[ip_number] [char] (16) NOT NULL ,
	[id_client] [int] NOT NULL 
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lots]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Lots] (
	[id_lot] [int] IDENTITY (1, 1) NOT NULL ,
	[lot_desc] [char] (20) NOT NULL ,
	[creation_date] [datetime] NOT NULL,
	[client_type] [int] NOT NULL default(1)
) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tariffs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Tariffs] (
	[id_tariffs_key] [int] IDENTITY (1, 1) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[prefix] [char] (20) NOT NULL ,
	[description] [char] (100) NOT NULL ,
	[voice_rate] [numeric](8, 4) NOT NULL ,
	[from_day] [smallint] NOT NULL ,
	[to_day] [smallint] NOT NULL ,
	[from_hour] [smallint] NULL ,
	[to_hour] [smallint] NOT NULL ,
	[grace_period] [int] NOT NULL default(0) ,
	[minimal_time] [smallint] NOT NULL default(0) ,
	[resolution] [smallint] NOT NULL default(0),
 	[rate_multiplier] decimal(12,4) NOT NULL default(-1.0),
 	[rate_addition] decimal(12,4) NOT NULL default(-1.0)

) ON [PRIMARY]
END

GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TariffsNames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[TariffsNames] (
	[id_tariff] [int] IDENTITY (1, 1) NOT NULL ,
	[description] [char] (20) NOT NULL ,
	[minimal_time] [smallint] NULL ,
	[resolution] [smallint] NULL ,
	[surcharge_time] [smallint] NOT NULL DEFAULT(0),
	[surcharge_amount] [decimal] (12,4) NOT NULL default (0.0000),
	[type] [int] NOT NULL default (0),
 	[rate_multiplier] decimal(12,4) NOT NULL default(-1.0),
 	[rate_addition] decimal(12,4) NOT NULL default(-1.0)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ClientTypes] (
	[id_client_type] [int] NOT NULL ,
	[client_type_name] [nvarchar] (50) NOT NULL ,
	CONSTRAINT [PK_ClientsTypes] PRIMARY KEY  CLUSTERED 
	(
		[id_client_type]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RouteTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RouteTypes] (
	[id_route_type] [int] NOT NULL ,
	[route_type_name] [nvarchar] (50) NOT NULL ,
	CONSTRAINT [PK_RouteTypes] PRIMARY KEY  CLUSTERED 
	(
		[id_route_type]
	)  ON [PRIMARY]
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smsmessages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[smsmessages] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[phone] [nvarchar] (50)  NULL ,
	[message] [nvarchar] (250)  NULL ,
	CONSTRAINT [PK_smsmessages] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smsMessagesResp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[smsMessagesResp] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[message] [nvarchar] (255)  NOT NULL ,
	[phone] [nvarchar] (50)  NOT NULL ,
	[data] [datetime] NOT NULL CONSTRAINT [DF_smsMessagesResp_data] DEFAULT (getdate()),
	[cost] [decimal](12, 4) NOT NULL CONSTRAINT [DF_smsMessagesResp_cost] DEFAULT (0.0),
	[status] [smallint] NULL CONSTRAINT [DF_smsMessagesResp_status] DEFAULT (1),
	[client_type] [int] NOT NULL DEFAULT(4),
	CONSTRAINT [PK_smsMessagesResp] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Clientscallbackphones]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Clientscallbackphones] (
	[id] [int] IDENTITY(1,1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[phone_number] [nvarchar] (50)  NOT NULL ,
	[def] [smallint] NOT NULL DEFAULT(0),
	[client_type] [int] NOT NULL DEFAULT(4),
	CONSTRAINT [PK_Clientscallbackphones] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VoipBox]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[VoipBox] (
	[id] [int] NOT NULL ,
	[description] [nvarchar] (50) NOT NULL,
	CONSTRAINT [PK_VoipBox] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [Primary]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Noroutes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Noroutes] (
	[id_route] [int] NOT NULL ,
	[description] [nvarchar] (50) NOT NULL,
	CONSTRAINT [PK_Noroutes] PRIMARY KEY  CLUSTERED 
	(
		[id_route]
	)  ON [PRIMARY] 
) ON [Primary]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[activepc2phone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[activepc2phone] (
	[id_active_pc2phone] [int] NOT NULL ,
	[id_client] [int] NOT NULL ,
	[login] [nvarchar] (20) NOT NULL,
	[login_time] [DATETIME] NOT NULL,
	[ip_number] [nvarchar] (33) NOT NULL,
	CONSTRAINT [PK_activepc2phone] PRIMARY KEY  CLUSTERED 
	(
		[id_active_pc2phone]
	)  ON [PRIMARY] 
) ON [Primary]
END
ALTER TABLE [dbo].[AddressBook] WITH NOCHECK ADD 
	CONSTRAINT [PK_AddressBook] PRIMARY KEY  CLUSTERED 
	(
		[id_address_book]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Calls] WITH NOCHECK ADD 
	CONSTRAINT [PK_Calls] PRIMARY KEY  CLUSTERED 
	(
		[id_call]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CallsFailed] WITH NOCHECK ADD 
	CONSTRAINT [PK_CallsFailed] PRIMARY KEY  CLUSTERED 
	(
		[id_failed_call]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[ClientInf] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClientInf] PRIMARY KEY  CLUSTERED 
	(
		[id_client],
		[id_lot]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[ClientsE164] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClientsE164] PRIMARY KEY  CLUSTERED 
	(
		[id_client]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ClientsHearLink] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClientsHearLink] PRIMARY KEY  CLUSTERED 
	(
		[id_client]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ClientsIP] WITH NOCHECK ADD 
	CONSTRAINT [PK_Main] PRIMARY KEY  CLUSTERED 
	(
		[id_client]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DialingPlan] WITH NOCHECK ADD 
	CONSTRAINT [PK_NumbersAndGateways] PRIMARY KEY  CLUSTERED 
	(
		[id_dialplan]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Gatekeepers] WITH NOCHECK ADD 
	CONSTRAINT [PK_Gatekeepers] PRIMARY KEY  CLUSTERED 
	(
		[id_route]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Gateways] WITH NOCHECK ADD 
	CONSTRAINT [PK_Gateways] PRIMARY KEY  CLUSTERED 
	(
		[id_route]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IPNumbers] WITH NOCHECK ADD 
	CONSTRAINT [PK_IP_numbers] PRIMARY KEY  CLUSTERED 
	(
		[id_ip]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Lots] WITH NOCHECK ADD 
	CONSTRAINT [PK_Lots] PRIMARY KEY  CLUSTERED 
	(
		[id_lot]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Tariffs] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tariffs] PRIMARY KEY  CLUSTERED 
	(
		[id_tariffs_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TariffsNames] WITH NOCHECK ADD 
	CONSTRAINT [PK_TariffsNames] PRIMARY KEY  CLUSTERED 
	(
		[id_tariff]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[clientscallback] WITH NOCHECK ADD 
	CONSTRAINT [PK_clientscallback] PRIMARY KEY  CLUSTERED 
	(
		[id_client]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[CurrentCalls] WITH NOCHECK ADD 
	CONSTRAINT [PK_CurrentCalls] PRIMARY KEY  CLUSTERED 
	(
		[id_call]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Calls] WITH NOCHECK ADD 
	CONSTRAINT [DF__Calls__TariffPre__5AEE82B9] DEFAULT ('') FOR [tariff_prefix]
GO

 CREATE  INDEX [IX_ClientsLoginsE] ON [dbo].[ClientsE164]([login]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_ClientsLoginsHH] ON [dbo].[ClientsHearLink]([login]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [IX_ClientsLoginsIP] ON [dbo].[ClientsIP]([login]) ON [PRIMARY]
GO
 CREATE  INDEX [IX_PhoneNumber] ON [dbo].[DialingPlan]([telephone_number]) ON [PRIMARY]
GO
 CREATE  INDEX [IX_ClientsIPNumber] ON [dbo].[IPNumbers]([ip_number]) ON [PRIMARY]
GO
 CREATE  UNIQUE  INDEX [IX_LotsName] ON [dbo].[Lots]([lot_desc]) ON [PRIMARY]
GO
 CREATE  UNIQUE INDEX [IX_ClientsLoginsCC] ON [dbo].[clientscallback]([login]) ON [PRIMARY]
GO
 CREATE  UNIQUE INDEX [IX_ClientsLoginsP] ON [dbo].[ClientsPIN]([login]) ON [PRIMARY]
GO
 CREATE  UNIQUE INDEX [IX_ClientsLoginsPP] ON [dbo].[ClientsPIN]([password]) ON [PRIMARY]
GO
 CREATE  UNIQUE INDEX [IX_ClientsLoginsCS] ON [dbo].[ClientsShared]([login]) ON [PRIMARY]
GO
 CREATE  UNIQUE INDEX [IX_ClientsLoginsCSP] ON [dbo].[ClientsShared]([password]) ON [PRIMARY]
GO

set identity_insert TariffsNames on
insert into TariffsNames(id_tariff,description,minimal_time,resolution,type) values (1,'TestTariff',1,6,0)
set identity_insert TariffsNames off
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'1','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'2','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'3','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'4','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'5','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'6','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'7','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'8','',0.01,0,6,0,2400)
GO
insert into Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
values (1,'9','',0.01,0,6,0,2400)
GO
set identity_insert ClientsIP on
insert into ClientsIP(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'smallgw','smallgw',15794691,1,10.0,'')
set identity_insert ClientsIP off
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,0,10.0,getdate(),1,'initial payment')
GO
set identity_insert ClientsHearLink on
insert into ClientsHearlink(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'user1','pass1',15794691,10.0,2,'')
set identity_insert ClientsHearLink off
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,1,10.0,getdate(),1,'initial payment')
GO
set identity_insert ClientsE164 on
insert into ClientsE164(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'ipphone','pass2',15794691,10.0,0,'')
set identity_insert ClientsE164 off
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,2,10.0,getdate(),1,'initial payment')
GO
set identity_insert Clientscallback on
insert into Clientscallback(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'callback','callback',268435459,1,2,'')
set identity_insert Clientscallback off
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(0,'GW/Proxy clients')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(1, 'Client PC2Phone')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(2, 'GK/Registrar clients')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(4, 'Client Callback')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(8, 'Client IVR')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(16, 'Client CallShop')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(32, 'Client Common')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(0, 'External gateway')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(1, 'Internal gatekeeper')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(2, 'External gatekeeper')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(3, 'PC2Phone user')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(4, 'VoipBox')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(5, 'Common client')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(6, 'Enum route')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(7, 'Lookup')
GO
INSERT INTO VoipBox(id, description)
VALUES(0, 'Account state')
GO
INSERT INTO VoipBox(id, description)
VALUES(1, 'PIN')
GO
INSERT INTO VoipBox(id, description)
VALUES(2, 'PIN + time')
GO
INSERT INTO VoipBox(id, description) 
VALUES(3, 'PIN + account')
GO
INSERT INTO VoipBox(id, description) 
VALUES(4, 'PIN + account + time')
GO
INSERT INTO VoipBox(id, description)
VALUES(5, 'Ask for number')
GO
INSERT INTO VoipBox(id, description)
VALUES(6, 'Ask for number + time')
GO
INSERT INTO VoipBox(id, description) 
VALUES(7, 'Select language')
GO
INSERT INTO VoipBox(id, description) 
VALUES(8, 'Recharge')
GO
insert into VoipBox( id,description ) values (9,'Select language + PIN')
GO
insert into VoipBox( id,description ) values (10,'Select language + PIN + time')
GO
insert into VoipBox( id,description ) values (11,'Select language + PIN + account')
GO
insert into VoipBox( id,description ) values (12,'Select language + PIN + account + time')
GO
insert into VoipBox( id,description ) values (13,'Select language + Ask for number')
GO
insert into VoipBox( id,description ) values (14,'Select language + Ask for number + time')
GO
insert into VoipBox( id,description ) VALUES (15, 'PIN + Recharge')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-2, 'No Gateway')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-3, 'No Tariff')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-4, 'Number disabled')
GO
CREATE TABLE [dbo].[Payments] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NULL ,
	[client_type] [int] NULL ,
	[money] [decimal](12, 4) NULL ,
	[data] [datetime] NULL ,
	[type] [int] NULL ,
	[description] [char](255) NOT NULL default(''),
	CONSTRAINT [PK_Payments] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
CREATE INDEX [IX_PaymentsIDClient] on [dbo].[Payments](id_client) ON [PRIMARY]
GO
CREATE INDEX [IX_PaymentsClientType] on [dbo].[Payments](client_type) ON [PRIMARY]
GO
CREATE TABLE [dbo].[PaymentTypes] (
	[id] [int] NOT NULL ,
	[name] [char] (40)  NULL ,
	CONSTRAINT [PK_PaymentsTypes] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Companies] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [nvarchar] (200)  NULL ,
	[address] [nvarchar] (255)  NULL ,
	[zip] [nvarchar] (50)  NULL ,
	[city] [nvarchar] (100)  NULL ,
	[country] [nvarchar] (100)  NULL ,
	[email] [nvarchar] (255)  NULL ,
	[phone] [nvarchar] (255)  NULL ,
	[phone1] [nvarchar] (255)  NULL ,
	CONSTRAINT [PK_Companies] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[CallShopUsers] (
	[id_callshopuser] [int] IDENTITY (1, 1) NOT NULL ,
	[id_callshop] [int] NOT NULL ,
	[id_client] [int] NOT NULL ,
	[client_type] [int] NOT NULL ,
	CONSTRAINT [PK_CallShopUsers] PRIMARY KEY  CLUSTERED 
	(
		[id_callshopuser]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[ClientsCallShop] (
	[id_client] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20) NOT NULL ,
	[password] [char] (20) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[account_state] [decimal] (12,4) NOT NULL ,
	[id_reseller] [int] NOT NULL default(-1) ,
	[id_intrastate_tariff] [int] NOT NULL default(-1) ,
	[tech_prefix] [char] (255) NOT NULL DEFAULT(''),
	[type] [int] NOT NULL DEFAULT (1),
	CONSTRAINT [PK_ClientsCallShop] PRIMARY KEY  CLUSTERED 
	(
		[id_client]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
CREATE TABLE [CompaniesClients] (
	[id_company] [int] NOT NULL ,
	[id_client] [int] NOT NULL ,
	[client_type] [int] NOT NULL ,
	CONSTRAINT [PK_CompaniesClients] PRIMARY KEY  CLUSTERED 
	(
		[id_company],
		[id_client],
		[client_type]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO
INSERT INTO PaymentTypes([id], [name])
VALUES(1,'PrePaid')
GO
INSERT INTO PaymentTypes([id], [name])
VALUES(2,'Credit')
GO
INSERT INTO PaymentTypes([id], [name])
VALUES(3,'Return')
GO
INSERT INTO PaymentTypes([id], [name])
VALUES(4,'Return credit')
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Pins]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Pins] (
	[name] [char] (100) NOT NULL ,
	[id_status] [int] NOT NULL ,
	[serial] [int] NOT NULL ,
	[id_lot] [int] NOT NULL ,
	[amount] [decimal] (12,4) NOT NULL ,
	CONSTRAINT [PK_Pins] PRIMARY KEY  CLUSTERED 
	(
		[name]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PinsLots]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[PinsLots] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [char] (50) NOT NULL ,
	[dat] [datetime] NOT NULL ,
	CONSTRAINT [PK_PinsLots] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PinsStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[PinsStatus] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [char] (50) NOT NULL ,
	CONSTRAINT [PK_PinsStatus] PRIMARY KEY  CLUSTERED 
	(
		[id]
	) ON [PRIMARY] 
) ON [PRIMARY]
END
set identity_insert PinsStatus on
GO
insert into PinsStatus(id,name) values(1,'Active')
GO
insert into PinsStatus(id,name) values(2,'Inactive')
GO
insert into PinsStatus(id,name) values(3,'Used')
GO
set identity_insert PinsStatus off
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CallsCallshop]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[CallsCallshop] (
	[id_call] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[ip_number] [char] (33) NOT NULL ,
	[caller_id] [char] (40) NOT NULL ,
	[called_number] [char] (40) NOT NULL ,
	[call_start] [datetime] NOT NULL ,
	[call_end] [datetime] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[cost] [decimal](12, 4) NULL ,
	[duration] [int] NOT NULL ,
	[tariff_prefix] [char] (20) NOT NULL ,
	[client_type] [int] NULL ,
	[id_route] [int] NULL,
	[pdd] [int] NOT NULL,
	[costR1] [decimal] (12,4) NOT NULL default(0.000),
	[costR2] [decimal] (12,4) NOT NULL default(0.000),
	[costR3] [decimal] (12,4) NOT NULL default(0.000),
	[costD] [decimal] (12,4) NOT NULL default(0.000),
	[id_reseller] [int] NOT NULL default(-1) ,
	[tariffdesc] [char] (100) NOT NULL default(''),
	[id_cc] [int] NOT NULL default(0),
	[ratio] DECIMAL(12,4) NOT NULL DEFAULT(1),
	[invoice_id] INT NOT NULL DEFAULT (-1)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DIDCallback]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[DIDCallback] (
	[didnumber] [char] (50) NOT NULL ,
	[clientnumber] [char] (50) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[client_type] [int] NOT NULL 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrefixTariff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[PrefixTariff] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[prefix] [char] (50) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[type] [int] NOT NULL DEFAULT 0,
	CONSTRAINT [PK_PrefixTariff] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ANITariff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[ANITariff] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[prefix] [char] (50) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	CONSTRAINT [PK_ANITariff] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoutesUsers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[RoutesUsers] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (50) NOT NULL ,
	[password] [char] (50) NOT NULL ,
	[id_route] [int] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[CostVisible] [int] NOT NULL default(1) ,
	CONSTRAINT [PK_RoutesUsers] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Languages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[Languages] (
	[id] [int] NOT NULL ,
	[name] [char] (100) NOT NULL,
	CONSTRAINT [PK_Languages] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists(select * from Languages where id=0)
 begin
	insert into Languages(id,name) values (0,'English')
 end
GO
if not exists(select * from Languages where id=1)
 begin
	insert into Languages(id,name) values (1,'Chinese')
 end
GO
if not exists(select * from Languages where id=2)
 begin
	insert into Languages(id,name) values (2,'Vietnamese')
 end
GO
if not exists(select * from Languages where id=3)
 begin
	insert into Languages(id,name) values (3,'Albanian')
 end
GO
if not exists(select * from Languages where id=4)
 begin
	insert into Languages(id,name) values (4,'French')
 end
GO
if not exists(select * from Languages where id=5)
 begin
	insert into Languages(id,name) values (5,'Polish')
 end
GO
if not exists(select * from Languages where id=6)
 begin
	insert into Languages(id,name) values (6,'Spanish')
 end
GO
if not exists(select * from Languages where id=7)
 begin
	insert into Languages(id,name) values (7,'Portugese')
 end
GO
if not exists(select * from Languages where id=8)
 begin
	insert into Languages(id,name) values (8,'Bengoli')
 end
GO
if not exists(select * from Languages where id=9)
 begin
	insert into Languages(id,name) values (9,'Romanian')
 end
GO
if not exists(select * from Languages where id=10)
 begin
	insert into Languages(id,name) values (10,'Russian')
 end
GO
if not exists(select * from Languages where id=11)
 begin
	insert into Languages(id,name) values (11,'Arabic')
 end
GO
if not exists(select * from Languages where id=12)
 begin
	insert into Languages(id,name) values (12,'Turkish')
 end
GO
if not exists(select * from Languages where id=13)
 begin
	insert into Languages(id,name) values (13,'Hebrew')
 end
GO
if not exists(select * from Languages where id=14)
 begin
	insert into Languages(id,name) values (14,'Thai')
 end
GO
if not exists(select * from Languages where id=15)
 begin
	insert into Languages(id,name) values (15,'English2')
 end
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Resellers1' ) 
 BEGIN
CREATE TABLE [dbo].[Resellers1] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[idReseller] [int] NULL ,
	[login] [char] (20)  NOT NULL ,
	[password] [char] (20)  NOT NULL  ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[callsLimit] [decimal](12, 4) NULL,
	clientsLimit [decimal](12, 4) NULL,
	tech_prefix [char] (255)  NOT NULL default(''), 
	identifier [char] (10)  NOT NULL default(''), 
	Fullname [char] (200)  NOT NULL default(''), 
	Address [char] (200)  NOT NULL default(''), 
	City [char] (50)  NOT NULL default(''), 
	ZipCode [char] (20)  NOT NULL default(''), 
	Country [char] (50)  NOT NULL default(''), 
	Phone [char] (50)  NOT NULL default(''),
	Email [char] (200)  NOT NULL default(''),
	MaxClients [int] NOT NULL DEFAULT (0) , 
	CONSTRAINT [PK_ResellersI] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Resellers2' ) 
 BEGIN
CREATE TABLE [dbo].[Resellers2] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[idReseller] [int] NULL ,
	[login] [char] (20)  NOT NULL ,
	[password] [char] (20)  NOT NULL  ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[callsLimit] [decimal](12, 4) NULL,
	clientsLimit [decimal](12, 4) NULL,
	tech_prefix [char] (255)  NOT NULL default(''), 
	identifier [char] (10)  NOT NULL default(''), 
	Fullname [char] (200)  NOT NULL default(''), 
	Address [char] (200)  NOT NULL default(''), 
	City [char] (50)  NOT NULL default(''), 
	ZipCode [char] (20)  NOT NULL default(''), 
	Country [char] (50)  NOT NULL default(''), 
	Phone [char] (50)  NOT NULL default(''),
	Email [char] (200)  NOT NULL default(''),
	CONSTRAINT [PK_ResellersII] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Resellers3' ) 
 BEGIN
CREATE TABLE [dbo].[Resellers3] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[login] [char] (20)  NOT NULL ,
	[password] [char] (20)  NOT NULL  ,
	[type] [int] NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[callsLimit] [decimal](12, 4) NULL,
	clientsLimit [decimal](12, 4) NULL,
	tech_prefix [char] (255)  NOT NULL default(''), 
	identifier [char] (10)  NOT NULL default(''), 
	Fullname [char] (200)  NOT NULL default(''), 
	Address [char] (200)  NOT NULL default(''), 
	City [char] (50)  NOT NULL default(''), 
	ZipCode [char] (20)  NOT NULL default(''), 
	Country [char] (50)  NOT NULL default(''), 
	Phone [char] (50)  NOT NULL default(''),
	Email [char] (200)  NOT NULL default(''),
	CONSTRAINT [PK_ResellersIII] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Users' ) 
 BEGIN
CREATE TABLE [dbo].[Users] (
	[id_user] [int] IDENTITY (1, 1) NOT NULL ,
	[login] varchar (20)  NOT NULL default('') ,
	[password] varchar (20)  NOT NULL default('') ,
	[fullname] varchar (255)  NOT NULL default('') ,
	[address] varchar (255)  NOT NULL default('') ,
	[city] varchar (255)  NOT NULL default('') ,
	[zipcode] varchar (255)  NOT NULL default('') ,
	[country] varchar (255)  NOT NULL default('') ,
	[phone] varchar (255)  NOT NULL default('') ,
	[email] varchar (255)  NOT NULL default('') ,
	[type] int NOT NULL default 0 ,
	CONSTRAINT [PK_Users] PRIMARY KEY  CLUSTERED 
	(
		[id_user]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END 
GO
 CREATE  UNIQUE  INDEX [IX_UsersLogins] ON [dbo].[Users]([login]) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'resellerspayments' ) 
 BEGIN
CREATE TABLE [dbo].[resellerspayments] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_reseller] [int] default NULL ,
  	[resellerlevel] [int] NOT NULL default 0,
	[money] [decimal](12,4) default NULL,
	[data] [datetime] default NULL  ,
	[type] [int] NOT NULL default 0 ,
	CONSTRAINT [PK_resellerspayments] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END 
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'tariffreseller' ) 
 BEGIN
CREATE TABLE [dbo].[tariffreseller] (
	[id_tariff] [int] NOT NULL,
	[id_reseller] [int] NOT NULL default '0',
	[resellerlevel] [int] NOT NULL default '0',
	CONSTRAINT [PK_tariffreseller] PRIMARY KEY  CLUSTERED 
	(
		[id_tariff],
		[id_reseller],
		[resellerlevel]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'lotreseller' ) 
 BEGIN
CREATE TABLE [dbo].[lotreseller] (
	[id_lot] [int] NOT NULL default 0,
	[id_reseller] [int] NOT NULL default 0 ,
	CONSTRAINT [PK_lotreseller1] PRIMARY KEY  CLUSTERED 
	(
		[id_lot]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END 
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'RedirectPhones' ) 
 BEGIN
CREATE TABLE [dbo].[RedirectPhones] (
  [id] [int] IDENTITY (1, 1) NOT NULL ,
  [id_client] [int] NOT NULL default 0,
  [client_type] [int] NOT NULL default 0,
  [call_end_reason] [int] NOT NULL default 0,
  [follow_me_number] [char] (255)  NOT NULL default '' ,
  [number_priority] [smallint] NOT NULL default 0 ,
  did_number varchar (100)  NOT NULL default ''
  CONSTRAINT [PK_RedirectPhones] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
END
GO
CREATE INDEX [IX_RedirectPhones] on [dbo].[RedirectPhones](id_client,client_type) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'InvoiceClients' ) 
 BEGIN
CREATE TABLE [dbo].[InvoiceClients] (
	[IDClient] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[Name] [varchar] (200) NULL ,
	[Address] [varchar] (1000) NULL ,
	[EMail] [varchar] (50) NULL ,
	[Login] [varchar] (50) NOT NULL DEFAULT '' ,
	[TaxID] [varchar] (50) NULL ,
	[LastUsed] [bit] NOT NULL ,
	[clientNr] [varchar] (50) NULL,
	[City] varchar(200) NULL,
	[State] varchar(200) NULL,
	[Zip] varchar(50) NULL,
	[Country] varchar(100) NULL,
	[LastName] varchar(100) NULL,
	[paymentcode] char(20) NOT NULL DEFAULT(''),
	CONSTRAINT [PK_InvoiceClients] PRIMARY KEY  CLUSTERED 
	(
		[IDClient],
		[type]
	)  ON [PRIMARY] 
)
END
GO
CREATE TABLE [dbo].[voicemessages](
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[client_type] [int] NOT NULL ,
	[message_start] [datetime] NOT NULL ,
	[duration] [int] NOT NULL ,
	[message_type] [int] NOT NULL DEFAULT 0,
	[caller_ani] [char] (40) NOT NULL DEFAULT '',
	[filename] [char] (255) NOT NULL DEFAULT '' ,
	[id_message] [int] NOT NULL default (0), 
	CONSTRAINT [PK_voicemessages] PRIMARY KEY CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
)
GO
CREATE INDEX [IX_VoiceMessagesClientType] on [dbo].[voicemessages](id_client,client_type) ON [PRIMARY]
GO
CREATE TABLE [dbo].[voicemailusers](
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] [int] NOT NULL ,
	[client_type] [int] NOT NULL ,
	[email] [char] (255) NOT NULL DEFAULT '' ,
	[start_message] [char] (255) NOT NULL DEFAULT '',
	[remind_send] int DEFAULT 0  NULL 
)
GO
CREATE INDEX [IX_voicemailusersClientType] on [dbo].[voicemailusers](id_client,client_type) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsResellers] on [dbo].[Calls](id_reseller) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsCallStart] on [dbo].[Calls](call_start) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsIDTariff] on [dbo].[Calls](id_tariff) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsIDClient] on [dbo].[Calls](id_client) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsClientType] on [dbo].[Calls](client_type) ON [PRIMARY]
GO
CREATE INDEX [IX_TariffsIDtariff] on [dbo].[Tariffs](prefix) ON [PRIMARY]
GO
CREATE INDEX [IX_TariffsTariffPrefix] on [dbo].[Tariffs](id_tariff) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'History' ) 
 BEGIN
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[version] [char] (100) NOT NULL DEFAULT '' ,
	[start] [datetime] NOT NULL ,
	[stop] [datetime] NOT NULL 
)
END
GO
ALTER TABLE [dbo].[ClientInf] ADD 
	CONSTRAINT [FK_ClientInf_Lots] FOREIGN KEY 
	(
		[id_lot]
	) REFERENCES [dbo].[Lots] (
		[id_lot]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[Tariffs] ADD 
	CONSTRAINT [FK_Tariffs_TariffsNames] FOREIGN KEY 
	(
		[id_tariff]
	) REFERENCES [dbo].[TariffsNames] (
		[id_tariff]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO
CREATE INDEX [IX_CallsFailedCallStart] on [dbo].[CallsFailed](call_start) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsFailedClientType] on [dbo].[CallsFailed](client_type) ON [PRIMARY]
GO
CREATE INDEX [IX_CallsFailedRouteType] on [dbo].[CallsFailed](route_type) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'prefixtariffreseller' ) 
 BEGIN
CREATE TABLE [dbo].[prefixtariffreseller](
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[prefix] [char] (50) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[id_reseller] [int] NOT NULL ,
	[reseller_level] [int] NOT NULL ,
	CONSTRAINT [PK_prefixtariffreseller] PRIMARY KEY CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'settings' ) 
 BEGIN
CREATE TABLE [dbo].[settings](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [name] [CHAR] (255) NOT NULL ,
	[value] TEXT NOT NULL ,
	[category] [CHAR](100) NOT NULL ,
)
END
GO
CREATE  UNIQUE INDEX [IX_SettingsNameCategory] ON [dbo].[settings]([name],[category]) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'sim' ) 
 BEGIN
CREATE TABLE [dbo].[sim](
          [id] [int] IDENTITY (1, 1) NOT NULL,
          [phone_number] [char] (40) NOT NULL,
          [id_client] [int] NOT NULL default 0,
          [param1] [char] (40) NOT NULL,
          CONSTRAINT [PK_simprimary] PRIMARY KEY CLUSTERED 
	  (
		[id]
	  )  ON [PRIMARY] 
)
END
GO
CREATE UNIQUE  INDEX [IX_SimPhonenumber] ON [dbo].[sim]([phone_number]) ON [PRIMARY]
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'ResLotTimes' ) 
 BEGIN
CREATE TABLE [dbo].[ResLotTimes](
          [id] [int] IDENTITY (1, 1) NOT NULL,
          [id_reseller] [int] NOT NULL default -1,
          [id_lot] [int] NOT NULL default -1,                                             
	  [multiplier] [decimal](12,4) default 1.0,
          CONSTRAINT [PK_reslottimesprimary] PRIMARY KEY CLUSTERED 
	  (
		[id]
	  )  ON [PRIMARY] 
)
 END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'ServiceLog' ) 
 BEGIN
CREATE TABLE ServiceLog (
	IDLog int IDENTITY (1, 1) NOT NULL,
	Type int NOT NULL,
	sDescription varchar(500) NULL,
	sStatus varchar(100) NULL,
	Date_ datetime NOT NULL,
	CONSTRAINT [PK_ServiceLog] PRIMARY KEY CLUSTERED 
	(
		[IDLog]
	)  ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Properties' ) 
 BEGIN
CREATE TABLE Properties (
	Property varchar(50) NOT NULL,
	Value varchar(8000) NOT NULL,
	CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
	(
		[Property]
	)  ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'ServiceToLots' ) 
BEGIN
CREATE TABLE ServiceToLots (
	IDLot int NOT NULL ,
	Type int NOT NULL ,
	Months int NOT NULL ,
	Days int NOT NULL ,
	Hours int NOT NULL,
	CONSTRAINT [PK_ServiceToLots] PRIMARY KEY CLUSTERED 
	(
		[IDLot],
		[Type]
	)  ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'AccountState' ) 
BEGIN
CREATE TABLE AccountState (
	IDPosition int IDENTITY (1, 1) NOT NULL,
	Type int NULL,
	IDLots int NULL,
	Amount decimal(18, 2) NOT NULL,
	useHTML bit NOT NULL DEFAULT 0,
	msgBody varchar (2000) NULL,
	msgTitle varchar (200) NULL,
	HTMLPath varchar (300) NULL,
	CONSTRAINT [PK_AccountState] PRIMARY KEY CLUSTERED 
	(
		[IDPosition]
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'MessagesSending' ) 
BEGIN
CREATE TABLE  MessagesSending (
	IDPosition int IDENTITY (1, 1) NOT NULL,
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Date_ datetime NOT NULL,
	IDMessage int NULL,
	CONSTRAINT [PK_MessagesSending] PRIMARY KEY CLUSTERED 
	(
		[IDPosition]
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'InvoiceToLots' ) 
BEGIN
CREATE TABLE  InvoiceToLots (
	IDLot int NOT NULL,
	CONSTRAINT [PK_InvoiceToLots] PRIMARY KEY CLUSTERED 
	(
		[IDLot]
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'ServiceToClients' ) 
BEGIN
CREATE TABLE  ServiceToClients (
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Months int NOT NULL ,
	Days int NOT NULL ,
	Hours int NOT NULL,
	CONSTRAINT [PK_ServiceToClients] PRIMARY KEY CLUSTERED 
	(
		[IDClient], 
		[Type]
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'callsArchives' ) 
BEGIN
CREATE TABLE  callsArchives (
	tableName varchar (100) NOT NULL ,
	firstCall datetime NULL ,
	lastCall datetime NULL ,
	callsCount int NULL,
	CONSTRAINT [PK_callsArchives] PRIMARY KEY CLUSTERED 
	(
		[tableName] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'PaymentsToClientsLots' ) 
BEGIN
CREATE TABLE  PaymentsToClientsLots (
	IDPayment int IDENTITY (1, 1) NOT NULL,
	IDClient int NOT NULL ,
	IDLot int NOT NULL ,
	Type int NOT NULL ,
	Interval_ int NOT NULL ,
	Period int NOT NULL ,
	Fee decimal(18, 2) NOT NULL ,
	Start datetime NOT NULL ,
	Description_ varchar (255) NULL,
	CONSTRAINT [PK_PaymentsToClientsLots] PRIMARY KEY CLUSTERED 
	(
		[IDPayment] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'clientsPayments' ) 
BEGIN
CREATE TABLE  clientsPayments (
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Date_ datetime NOT NULL ,
	Amount decimal(18, 4) NOT NULL,
	IDPayment int NOT NULL,
	CONSTRAINT [PK_clientsPayments] PRIMARY KEY CLUSTERED 
	(
		[IDClient],
		[Type],
		[Date_],
		[IDPayment] 
	) ON [PRIMARY] 

)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'AccountStateReseller' ) 
BEGIN
CREATE TABLE  AccountStateReseller (
	IDPosition int IDENTITY (1, 1) NOT NULL,
	ResellerLevel int NULL,
	Amount decimal(18, 2) NOT NULL,
	useHTML bit NOT NULL DEFAULT 0,
	msgBody varchar (2000) NULL,
	msgTitle varchar (200) NULL,
	HTMLPath varchar (300) NULL,
	CONSTRAINT [PK_AccountStateReseller] PRIMARY KEY CLUSTERED 
	(
		[IDPosition] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'MessagesSendingReseller' ) 
BEGIN
CREATE TABLE  MessagesSendingReseller (
	IDPosition int IDENTITY (1, 1) NOT NULL,
	IDReseller int NOT NULL ,
	ResellerLevel int NOT NULL ,
	Date_ datetime NOT NULL,
	IDMessage int NULL,
	CONSTRAINT [PK_MessagesSendingReseller] PRIMARY KEY CLUSTERED 
	(
		[IDPosition] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'NPA' ) 
BEGIN
CREATE TABLE NPA (
	npa_number char (40) NOT NULL ,
	location char (50) NOT NULL default (''),
	CONSTRAINT [PK_NPANumber] PRIMARY KEY CLUSTERED 
	(
		[npa_number] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Invoices' ) 
BEGIN
CREATE TABLE Invoices ( 
	InvoiceID int IDENTITY (1, 1) NOT NULL,
	InvoiceNr varchar(50) NOT NULL , 
	Name varchar(200) NULL , 
	Address varchar(255) NULL , 
	EMail varchar(50) NULL , 
	TaxID varchar(50) NULL , 
	Item varchar(200) NULL , 
	Net decimal(20,4) NOT NULL , 
	Gross decimal(20,4) NOT NULL , 
	aVAT decimal(20,4) NOT NULL ,
	aPST decimal(20,4) NOT NULL , 
	VAT decimal(20,4) NOT NULL , 
	PST decimal(20,4) NOT NULL , 
	DateFrom datetime NULL, 
	DateTo datetime NULL, 
	Login_ varchar(250) NOT NULL , 
	FileName varchar(50) NOT NULL , 
	Nr int NOT NULL ,
	Month_ int NOT NULL , 
	Year_ int NOT NULL , 
	Date_ datetime NULL, 
	clientNr varchar(50) NULL, 
	City varchar(200) NULL,
	State varchar(200) NULL,
	Zip varchar(50) NULL,
	Country varchar(100) NULL,
	LastName varchar(100) NULL,
	[CabinId] [int] NOT NULL DEFAULT (0),
	id_client int NOT NULL DEFAULT (-1),
	client_type int NOT NULL DEFAULT (-1),
	CONSTRAINT [PK_InovicesID] PRIMARY KEY CLUSTERED 
	(
		[InvoiceID] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'users_permissions' ) 
BEGIN
CREATE TABLE users_permissions ( 
	id_permission int IDENTITY(1,1) NOT NULL, 
	id_user int NOT NULL ,
	command VARCHAR(255) NOT NULL,
	enabled BIT NOT NULL,
	type int NOT NULL default(0),
	CONSTRAINT [PK_users_permissions] PRIMARY KEY CLUSTERED 
	(
		[id_permission] 
	) ON [PRIMARY] 
)
END
GO
CREATE  UNIQUE INDEX [IX_UserCommand] ON [dbo].[users_permissions](id_user, command) ON [PRIMARY]
GO
if not exists(select * from Languages where id=16)
 begin
	insert into Languages(id,name) values (16,'Bulgarian')
 end
GO
if not exists(select * from Languages where id=17)
 begin
	insert into Languages(id,name) values (17,'German')
 end
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'enumroots' ) 
BEGIN
CREATE TABLE enumroots ( 
	id_route int IDENTITY(1,1) NOT NULL, 
	description VARCHAR(255) NOT NULL DEFAULT(''),
	ip_number VARCHAR(255) NOT NULL DEFAULT(''),
        [type] [int] NOT NULL DEFAULT(-1),
	CONSTRAINT [PK_enumroots] PRIMARY KEY CLUSTERED 
	(
		[id_route] 
	) ON [PRIMARY] 
)
END
GO
if not exists ( select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA = 'dbo' 
and TABLE_NAME = 'Lookups' ) 
BEGIN
CREATE TABLE Lookups ( 
	id int IDENTITY(1,1) NOT NULL, 
	description VARCHAR(255) NOT NULL DEFAULT(''),
	query_string VARCHAR(255) NOT NULL DEFAULT(''),
	string1 VARCHAR(255) NOT NULL DEFAULT(''),
	string2 VARCHAR(255) NOT NULL DEFAULT(''),
	CONSTRAINT [PK_Lookups] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.chargeTypes') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.chargeTypes (
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [varchar] (50) NULL,
	[DescriptionLong] [varchar] (2000) NULL,
	flagCreate bit NOT NULL DEFAULT 1,
	flagCharge bit NOT NULL DEFAULT 1
)
ALTER TABLE dbo.chargeTypes WITH NOCHECK ADD 
	CONSTRAINT [PK_chargeTypes] PRIMARY KEY  CLUSTERED 
	(
		[Amount]
	)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.WebPaymentOperations') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.WebPaymentOperations (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Description] [varchar] (250) NOT NULL ,
	[SessionID] [varchar] (150) NULL ,
	[Date_] [datetime] NOT NULL 
)
ALTER TABLE dbo.WebPaymentOperations WITH NOCHECK ADD 
	CONSTRAINT [PK_WebPaymentOperations] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.PayPalRequest') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.PayPalRequest (
 [PayPalToken] [varchar] (200) NOT NULL ,
 [IDClient] [int] NULL ,
 [ClientType] [int] NULL ,
 [OperationType] [int] NULL ,
 [Status] [int] NOT NULL ,
 [Date_] [datetime] NULL ,
 [Amount] [money] NULL ,
 [ClientLogin] [varchar] (150) NULL ,
 [ClientPassword] [varchar] (150) NULL,
 [PaymentStatus] [varchar] (150) NULL,
 [SessionID] [varchar] (150) NULL,
 Buyer [varchar] (250) NULL,
 BuyerEmail [varchar] (50) NULL,
 MerchantID int NOT NULL,
 BuyerCity varchar(200) NULL,
 BuyerState varchar(200) NULL,
 BuyerZip varchar(50) NULL,
 BuyerCountry varchar(100) NULL,
 BuyerLastName varchar(100) NULL,
 Zone varchar(50) NULL,
 Number varchar(50) NULL
)
ALTER TABLE dbo.PayPalRequest ADD 
 CONSTRAINT [PK_PayPalRequest] PRIMARY KEY  CLUSTERED 
 (
  [PayPalToken],
  MerchantID
 )
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.PayPalConfig') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.PayPalConfig (
	[ClientType] [int] NOT NULL ,
	[Item_] [varchar] (50) NOT NULL ,
	[Value_] [varchar] (50) NULL ,
	[FillTable] [varchar] (250) NULL,
	[ShowColumn] [varchar] (250) NULL,
	[DataColumn] [varchar] (250) NULL,
	IsBoolean int NOT NULL
)
ALTER TABLE dbo.PayPalConfig WITH NOCHECK ADD 
	CONSTRAINT [PK_PayPalConfig] PRIMARY KEY  CLUSTERED 
	(
		[ClientType],
		[Item_]
	)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.Properties') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.Properties (
	Property varchar(50) NOT NULL,
	Value varchar(8000) NOT NULL
	)
ALTER TABLE dbo.Properties WITH NOCHECK ADD 
	CONSTRAINT [PK_Properties] PRIMARY KEY  CLUSTERED 
	(
		[Property]
	)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ChargeToClient]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.ChargeToClient (
	Amount decimal(18, 2) NOT NULL ,
	ClientType int NOT NULL 
	)
ALTER TABLE dbo.ChargeToClient WITH NOCHECK ADD 
	CONSTRAINT [PK_ChargeToClient] PRIMARY KEY  CLUSTERED 
	(
		Amount,
		ClientType
	)
END
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(1,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='dialing prefix')
INSERT INTO PayPalConfig VALUES(1,'dialing prefix','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='tariff prefix')
INSERT INTO PayPalConfig VALUES(1,'tariff prefix','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(1,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(1,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(1,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(1,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(1,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(1,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(1,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(1,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(1,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(1,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(32,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(32,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(32,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(32,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(32,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(32,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(32,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(32,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(32,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(32,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(32,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='source plan')
INSERT INTO PayPalConfig VALUES(32,'source plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='source tariff')
INSERT INTO PayPalConfig VALUES(32,'source tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='connect immedia.')
INSERT INTO PayPalConfig VALUES(32,'connect immedia.','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='primary codec')
INSERT INTO PayPalConfig VALUES(32,'primary codec','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='G723.1')
INSERT INTO PayPalConfig VALUES(32,'G723.1','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='G729')
INSERT INTO PayPalConfig VALUES(32,'G729','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='GSM')
INSERT INTO PayPalConfig VALUES(32,'GSM','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='G711')
INSERT INTO PayPalConfig VALUES(32,'G711','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='client codec')
INSERT INTO PayPalConfig VALUES(32,'client codec','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='device')
INSERT INTO PayPalConfig VALUES(32,'device','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(0,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(0,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(0,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(0,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(0,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(0,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(0,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(0,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(0,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(0,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(0,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='connect immedia.')
INSERT INTO PayPalConfig VALUES(0,'connect immedia.','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='primary codec')
INSERT INTO PayPalConfig VALUES(0,'primary codec','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='G723.1')
INSERT INTO PayPalConfig VALUES(0,'G723.1','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='G729')
INSERT INTO PayPalConfig VALUES(0,'G729','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='GSM')
INSERT INTO PayPalConfig VALUES(0,'GSM','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='G711')
INSERT INTO PayPalConfig VALUES(0,'G711','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='client codec')
INSERT INTO PayPalConfig VALUES(0,'client codec','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(2,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(2,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(2,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(2,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(2,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(2,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(2,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(2,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(2,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(2,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(2,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='connect immedia.')
INSERT INTO PayPalConfig VALUES(2,'connect immedia.','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='primary codec')
INSERT INTO PayPalConfig VALUES(2,'primary codec','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='G723.1')
INSERT INTO PayPalConfig VALUES(2,'G723.1','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='G729')
INSERT INTO PayPalConfig VALUES(2,'G729','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='GSM')
INSERT INTO PayPalConfig VALUES(2,'GSM','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='G711')
INSERT INTO PayPalConfig VALUES(2,'G711','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='client codec')
INSERT INTO PayPalConfig VALUES(2,'client codec','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='device')
INSERT INTO PayPalConfig VALUES(2,'device','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(4,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(4,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(4,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(4,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(4,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(4,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(4,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(4,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(4,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(4,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(4,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='source plan')
INSERT INTO PayPalConfig VALUES(4,'source plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='source tariff')
INSERT INTO PayPalConfig VALUES(4,'source tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(8,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(8,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(8,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(8,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(8,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(8,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(8,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(8,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(8,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(8,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(8,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='login - Number of characters')
INSERT INTO PayPalConfig VALUES(16,'login - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='login - Use numbers')
INSERT INTO PayPalConfig VALUES(16,'login - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='login - Use up cases')
INSERT INTO PayPalConfig VALUES(16,'login - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='login - Use low cases')
INSERT INTO PayPalConfig VALUES(16,'login - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='password - Number of characters')
INSERT INTO PayPalConfig VALUES(16,'password - Number of characters','20',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='password - Use numbers')
INSERT INTO PayPalConfig VALUES(16,'password - Use numbers','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='password - Use up cases')
INSERT INTO PayPalConfig VALUES(16,'password - Use up cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='password - Use low cases')
INSERT INTO PayPalConfig VALUES(16,'password - Use low cases','1',null,null,null,1)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='dest. plan')
INSERT INTO PayPalConfig VALUES(16,'dest. plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='dest. tariff')
INSERT INTO PayPalConfig VALUES(16,'dest. tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='id tariff')
INSERT INTO PayPalConfig VALUES(16,'id tariff','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='source plan')
INSERT INTO PayPalConfig VALUES(16,'source plan','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='source tariff')
INSERT INTO PayPalConfig VALUES(16,'source tariff','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='connect immedia.')
INSERT INTO PayPalConfig VALUES(16,'connect immedia.','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='primary codec')
INSERT INTO PayPalConfig VALUES(16,'primary codec','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='G723.1')
INSERT INTO PayPalConfig VALUES(16,'G723.1','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='G729')
INSERT INTO PayPalConfig VALUES(16,'G729','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='GSM')
INSERT INTO PayPalConfig VALUES(16,'GSM','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='G711')
INSERT INTO PayPalConfig VALUES(16,'G711','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='client codec')
INSERT INTO PayPalConfig VALUES(16,'client codec','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='device')
INSERT INTO PayPalConfig VALUES(16,'device','0',null,null,null,0)
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.otherGoods') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.otherGoods (
	[ID] [int] IDENTITY (1, 1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [varchar] (50) NOT NULL,
	[DescriptionLong] [varchar] (2000) NULL 
)
ALTER TABLE dbo.otherGoods WITH NOCHECK ADD 
	CONSTRAINT [PK_otherGoods] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'dbo.PayPalRequestGoods') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.PayPalRequestGoods (
 [PayPalToken] [varchar] (200) NOT NULL ,
 [Status] [int] NOT NULL ,
 [Date_] [datetime] NULL ,
 [Amount] [money] NULL ,
 [PaymentStatus] [varchar] (150) NULL,
 [SessionID] [varchar] (150) NULL,
 Buyer [varchar] (250) NULL,
 BuyerEmail [varchar] (50) NULL,
 GoodsID [int] NOT NULL,
 Goods [varchar] (50),
 BuyerAddress varchar(1000) NULL,
 MerchantID int NOT NULL,
 BuyerCity varchar(200) NULL,
 BuyerState varchar(200) NULL,
 BuyerZip varchar(50) NULL,
 BuyerCountry varchar(100) NULL,
 BuyerLastName varchar(100) NULL,
 Zone varchar(50) NULL,
 Number varchar(50) NULL
)
ALTER TABLE dbo.PayPalRequestGoods ADD 
 CONSTRAINT [PK_PayPalRequestGoods] PRIMARY KEY  CLUSTERED 
 (
  [PayPalToken],
  MerchantID
 )
END
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(0,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(0,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(2,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(2,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(4,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(4,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(8,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(8,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(16,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(16,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(32,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(32,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='useList')
INSERT INTO PayPalConfig VALUES(1,'useList','0',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='listPath')
INSERT INTO PayPalConfig VALUES(1,'listPath','',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM syscolumns T1 INNER JOIN sysobjects T2 ON T1.id = T2.id
WHERE T2.name = 'PayPalRequest' AND T1.name = 'BuyerAddress')
BEGIN
ALTER TABLE PayPalRequest
ADD BuyerAddress varchar(1000) NULL
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InvoiceClients]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.InvoiceClients (
	[IDClient] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[Name] [varchar] (200) NULL ,
	[Address] [varchar] (1000) NULL ,
	[EMail] [varchar] (50) NULL ,
	[Login] [varchar] (50) NULL ,
	[TaxID] [varchar] (50) NULL ,
	[LastUsed] [bit] NOT NULL ,
	[clientNr] [varchar] (50) NULL,
	City varchar(200) NULL,
	State varchar(200) NULL,
	Zip varchar(50) NULL,
	Country varchar(100) NULL,
	LastName varchar(100) NULL,
	[paymentcode] [varchar] (20) NOT NULL DEFAULT (''),
	[Phone] [varchar] (30) NULL
)
ALTER TABLE dbo.InvoiceClients WITH NOCHECK ADD 
CONSTRAINT [DF_InvoiceClients_LastUsed] DEFAULT (0) FOR [LastUsed],
CONSTRAINT [PK_InvoiceClients] PRIMARY KEY  CLUSTERED 
(
	[IDClient],
	[type]
)
END
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=0 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(0,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=1 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(1,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=2 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(2,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=4 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(4,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=8 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(8,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=16 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(16,'visible','1',null,null,null,0)
GO
IF NOT EXISTS(SELECT * FROM PayPalConfig WHERE ClientType=32 AND Item_='visible')
INSERT INTO PayPalConfig VALUES(32,'visible','1',null,null,null,0)
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZoneFiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.ZoneFiles(
ClientType int NOT NULL,
Zone varchar(50) NOT NULL,
File_ varchar(500) NOT NULL,
Description varchar(255) NULL
)
ALTER TABLE dbo.ZoneFiles ADD CONSTRAINT
PK_ZoneFiles PRIMARY KEY CLUSTERED (
ClientType,
[Zone]
)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[currencies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.currencies 
( 
	id int IDENTITY(1,1) NOT NULL, 
	ratio [decimal] (12,4) NOT NULL default(0.000),
	id_currency INT NOT NULL, 
	[date] DATETIME NOT NULL,
	CONSTRAINT [PK_currencies] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
)
END
GO 
CREATE INDEX [IX_CurrencyDate] on [dbo].[currencies](id_currency, date) ON [PRIMARY]
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[currency_names]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE dbo.currency_names 
( 
	id int IDENTITY(1,1) NOT NULL, 
	name VARCHAR(50) NOT NULL, 
	CONSTRAINT [PK_currency_names] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
)
END
GO 
set identity_insert currency_names on
insert into currency_names(id,name) values (1,'USD')
set identity_insert currency_names off
GO
insert into currencies(ratio,id_currency,date) values (1,1,getdate())
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SMS_DialingPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[SMS_DialingPlan] (
	[id_dialplan] [int] IDENTITY (1, 1) NOT NULL ,
	[telephone_number] [char] (40) NOT NULL ,
	[priority] [smallint] NOT NULL ,
	[route_type] [int] NOT NULL ,
	[tech_prefix] [char] (255) NOT NULL ,
	[dial_as] [char] (40) NOT NULL DEFAULT(''),
	[id_route] [int] NOT NULL ,
	[call_type] [int] NOT NULL ,
	[type] [int] NOT NULL ,
	[from_day] [smallint] NOT NULL DEFAULT(0),
	[to_day] [smallint] NOT NULL DEFAULT(6),
	[from_hour] [smallint] NOT NULL DEFAULT(0),
	[to_hour] [smallint] NOT NULL DEFAULT(2400),
	[balance_share] [int] NOT NULL default(100)
) ON [PRIMARY]
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SMS_Providers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[SMS_Providers] (
	id int IDENTITY(1,1) NOT NULL, 
	name [char] (255) NOT NULL, 
 	connection_string TEXT NOT NULL DEFAULT (''),
	CONSTRAINT [PK_SMS_Providers] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
)
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sms_providers_responses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE [dbo].[sms_providers_responses] (
	id int IDENTITY(1,1) NOT NULL, 
	id_route [int]  NOT NULL, 
 	code int NOT NULL,
	provider_string TEXT NULL,
	user_string TEXT NULL,
	CONSTRAINT [PK_SMS_Prov_resp] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
)
END
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (1,-1,400,'authorization_failed','Authorization failed.')
set identity_insert sms_providers_responses off
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (2,-1,401,'not_enough_funds','Not enough funds.')
set identity_insert sms_providers_responses off
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (3,-1,500,'no_tariff','SMS destination is not allowed')
set identity_insert sms_providers_responses off
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (4,-1,501,'no_dialplan_entry','SMS destination is not allowed')
set identity_insert sms_providers_responses off
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (5,-1,600,'sms_provider_is_offline','SMS provider is offline.')
set identity_insert sms_providers_responses off
GO
set identity_insert sms_providers_responses on
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (6,-1,601,'sms_provider_cannot_process_the_message','SMS provider cannot process the message')
set identity_insert sms_providers_responses off
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Tariffs_sms]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE Tariffs_sms (
	[id_tariffs_key] [int] IDENTITY (1, 1) NOT NULL ,
	[id_tariff] [int] NOT NULL ,
	[prefix] [char] (20) NOT NULL ,
	[description] [char] (100) NOT NULL ,
	[voice_rate] [numeric](8, 4) NOT NULL ,
	[from_day] [smallint] NOT NULL ,
	[to_day] [smallint] NOT NULL ,
	[from_hour] [smallint] NULL ,
	[to_hour] [smallint] NOT NULL ,
	[grace_period] [int] NOT NULL default(0) ,
	[minimal_time] [smallint] NOT NULL default(0) ,
	[resolution] [smallint] NOT NULL default(0),
 	[rate_multiplier] decimal(12,4) NOT NULL default(-1.0),
 	[rate_addition] decimal(12,4) NOT NULL default(-1.0),
	CONSTRAINT [PK_Tariffs_sms] PRIMARY KEY CLUSTERED 
	(
		[id_tariffs_key] 
	) ON [PRIMARY] 
) 
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InvoiceClientsOperations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE InvoiceClientsOperations (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	id_client int NOT NULL ,
	client_type int NOT NULL ,
	id_operation int NOT NULL ,
	CONSTRAINT [PK_InvoiceClientsOperations] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
) 
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Operations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE Operations (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	type int NOT NULL ,
	date datetime NOT NULL default (gatedate()) ,
	description varchar (255)  NOT NULL ,
	idUser int NOT NULL,
	CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
) 
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OperationsTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE OperationsTypes (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	description char (50)  NOT NULL ,
	CONSTRAINT [PK_OperationsTypes] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
) 
END
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[personalization]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
 BEGIN
CREATE TABLE personalization (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[id_client] int NOT NULL,
	[client_type] int NOT NULL,
	[module] char(45) NOT NULL,
	[name] char(45) default NULL,
	[data] text NOT NULL DEFAULT '',
	CONSTRAINT [PK_personalization] PRIMARY KEY CLUSTERED 
	(
		[id] 
	) ON [PRIMARY] 
) 
END
GO
set identity_insert OperationsTypes on
INSERT INTO OperationsTypes(id,name) values (1,"Registration")
set identity_insert OperationsTypes off
GO
set identity_insert OperationsTypes on
INSERT INTO OperationsTypes(id,name) values (2,"Registered")
set identity_insert OperationsTypes off
GO
set identity_insert OperationsTypes on
INSERT INTO OperationsTypes(id,name) values (3,"Recharging")
set identity_insert OperationsTypes off
GO
set identity_insert OperationsTypes on
INSERT INTO OperationsTypes(id,name) values (4,"Recharged")
set identity_insert OperationsTypes off
GO

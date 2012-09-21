CREATE TABLE AddressBook (
	id_address_book int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_client int NOT NULL ,
	telephone_number char (50) CHARACTER SET utf8 NOT NULL,
	nickname char (20) CHARACTER SET utf8 NOT NULL,
	type int NOT NULL default 1,
	speeddial char (20) CHARACTER SET utf8 NOT NULL default ''
) 
GO
CREATE TABLE Calls (
	id_call int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_client int NOT NULL ,
	ip_number char (33)  NOT NULL ,
	caller_id char (40) NOT NULL ,
	called_number char (40)  NOT NULL ,
	call_start datetime NOT NULL ,
	call_end datetime NOT NULL ,
	route_type int NOT NULL ,
	id_tariff int NOT NULL ,
	cost decimal(12, 4) NULL ,
	duration int NOT NULL ,
	tariff_prefix char (20) NOT NULL default '',
	client_type int NOT NULL ,
	id_route int NULL,
	pdd int NOT NULL,
	costR1 decimal (12,4) NOT NULL default 0.0 ,
	costR2 decimal (12,4) NOT NULL default 0.0 ,
	costR3 decimal (12,4) NOT NULL default 0.0 ,
	costD decimal (12,4) NOT NULL default 0.0 ,
	id_reseller int NOT NULL default -1,
	tariffdesc char (100)  NOT NULL default '',
	id_cc int NOT NULL default 0 ,
	ratio DECIMAL(12,4) NOT NULL DEFAULT 1
) 

GO
CREATE TABLE CallsFailed (
	id_failed_call int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_client int NOT NULL ,
	ip_number char (33) NOT NULL ,
	caller_id char (40) NOT NULL ,
	called_number char (40)  NOT NULL ,
	call_start datetime NOT NULL ,
	route_type int NOT NULL ,
	IE_error_number int NOT NULL ,
	release_reason int NOT NULL ,
	client_type int NOT NULL ,
	id_route int NOT NULL ,
	pdd int NOT NULL ,
	type int NOT NULL  ,
	tariff_prefix char (20) NOT NULL default '',
	id_tariff int NOT NULL default 0 ,
	tariffdesc char (100)  NOT NULL default ''
)
GO
CREATE TABLE currentcalls ( 
	id_call int NOT NULL auto_increment PRIMARY KEY NOT NULL, 
	id_active_call int NOT NULL default 0, 
	id_client int NOT NULL default 0, 
	dialed_number char(40) NOT NULL default '', 
	call_start datetime NOT NULL default '0000-00-00 00:00:00', 
	client_type int NOT NULL default 0, 
	ani char(40) NOT NULL default '',
	id_route int NOT NULL default 0,
	route_type int NOT NULL default 0,
	id_reseller int NOT NULL default 0,
	tariffdesc char (100)  NOT NULL default ''
)
GO
CREATE TABLE clientinf (
  id_client int(11) NOT NULL default '0',
  id_lot int(11) NOT NULL default '0',
  serial int(11) default NULL,
  PRIMARY KEY  (id_client,id_lot)
)
GO
CREATE TABLE ClientsE164 (
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	login char (20)  NOT NULL ,
	password char (20)  NOT NULL ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	account_state decimal(12, 4) NOT NULL ,
	tech_prefix char (255)  NOT NULL ,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1 ,
	id_currency INT NOT NULL DEFAULT '1'
) 
GO
CREATE TABLE ClientsHearLink (
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	login char (100)  NOT NULL ,
	password char (20)  NOT NULL ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	account_state decimal(12, 4) NOT NULL ,
	tech_prefix char (255)  NOT NULL,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1,
	id_currency INT NOT NULL DEFAULT '1'
)
GO
CREATE TABLE ClientsIP (
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	login char (20)  NOT NULL ,
	password char (20)  NOT NULL ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	account_state decimal(12, 4) NOT NULL ,
	tech_prefix char (255)  NOT NULL ,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1 ,
	id_currency INT NOT NULL DEFAULT '1'
)
GO
CREATE TABLE clientscallback ( 
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login char (20) NOT NULL default '', 
	password char (20) NOT NULL default '', 
	type int NOT NULL default 0, 
	id_tariff int NOT NULL default 0, 
	account_state decimal (12,4) NOT NULL default 0.0000, 
	tech_prefix char (255) NOT NULL default '' ,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1 ,
	id_currency INT NOT NULL DEFAULT '1'
) 
GO
CREATE TABLE ClientsPIN ( 
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login char (20) NOT NULL default '', 
	password char (20) NOT NULL default '', 
	type int NOT NULL default 0, 
	id_tariff int NOT NULL default 0, 
	account_state decimal (12,4) NOT NULL default 0.0000, 
	tech_prefix char (255) NOT NULL default '' ,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1 ,
	id_currency INT NOT NULL DEFAULT '1'
) 
GO
CREATE TABLE ClientsShared (
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login char (20) NOT NULL default '', 
	password char (20) NOT NULL default '', 
	type int NOT NULL default 0, 
	id_tariff int NOT NULL default 0, 
	account_state decimal (12,4) NOT NULL default 0.0000, 
	tech_prefix char (255) NOT NULL default '' ,
	id_reseller int NOT NULL default -1 ,
	type2 int NOT NULL default 0 ,
	type3 int NOT NULL default 0 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1 ,
	id_currency INT NOT NULL DEFAULT '1'
)
GO
CREATE TABLE DialingPlan (
	id_dialplan int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	telephone_number char (40)  NOT NULL ,
	priority smallint NOT NULL ,
	route_type int NOT NULL ,
	tech_prefix char (255)  NOT NULL ,
	dial_as char (40)  NOT NULL default '',
	id_route int NOT NULL ,
	call_type int NOT NULL ,
	type int NOT NULL ,
	from_day smallint NOT NULL DEFAULT 0,
	to_day smallint NOT NULL DEFAULT 6,
	from_hour smallint NOT NULL DEFAULT 0,
	to_hour smallint NOT NULL DEFAULT 2400,
	balance_share int NOT NULL default 100
) 
GO
CREATE TABLE Gatekeepers (
	id_route int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	description char (20)  NULL ,
	ip_number char (255)  NULL ,
	h323_id char (100)  NULL ,
	e164_id char (100)  NULL ,
	ttl int NOT NULL,
	token char (10) NOT NULL DEFAULT '',
	type int NOT NULL ,
	gk_name char (100) NOT NULL ,
	id_tariff int NOT NULL default -1,
	string1 char(255) NOT NULL default '',
	call_limit int NOT NULL default 0
)
GO
CREATE TABLE Gateways (
	id_route int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	description char (20) NOT NULL ,
	ip_number char (255) NOT NULL ,
	h323_id char (100) NOT NULL ,
	type int NOT NULL ,
	call_limit int NOT NULL default 0,
	id_tariff int NOT NULL default -1
) 
GO
CREATE TABLE IPNumbers (
	id_ip int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	ip_number char (16)  NOT NULL ,
	id_client int NOT NULL 
)
GO
CREATE TABLE Lots (
	id_lot int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	lot_desc char (20)  NOT NULL ,
	creation_date datetime NOT NULL ,
	client_type int NOT NULL default 1
) 
GO
CREATE TABLE Tariffs (
	id_tariffs_key int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_tariff int NOT NULL ,
	prefix char (20)  NOT NULL ,
	description char (100)  NOT NULL ,
	voice_rate numeric(8, 4) NOT NULL ,
	from_day smallint NOT NULL ,
	to_day smallint NOT NULL ,
	from_hour smallint NULL ,
	to_hour smallint NOT NULL ,
	grace_period int NOT NULL default 0 ,
	minimal_time smallint NOT NULL default 0 ,
	resolution smallint NOT NULL default 0 ,
 	rate_multiplier DOUBLE NOT NULL DEFAULT -1.0 ,
 	rate_addition DOUBLE NOT NULL DEFAULT -1.0
) 
GO
CREATE TABLE TariffsNames (
	id_tariff int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	description char (20)  NOT NULL ,
	minimal_time smallint NULL ,
	resolution smallint NULL ,
	surcharge_time smallint NOT NULL DEFAULT 0,
	surcharge_amount decimal(12,4) NOT NULL DEFAULT 0.0 ,
	type int NOT NULL default 0 ,
 	rate_multiplier DOUBLE NOT NULL DEFAULT -1.0 ,
 	rate_addition DOUBLE NOT NULL DEFAULT -1.0
) 
GO
CREATE TABLE ClientTypes (
	id_client_type int PRIMARY KEY NOT NULL ,
	client_type_name char (50) NOT NULL
)
GO
CREATE TABLE RouteTypes (
	id_route_type int PRIMARY KEY NOT NULL ,
	route_type_name char (50) NOT NULL 
) 
GO
CREATE TABLE smsmessages (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	phone char (50)  NULL ,
	message char (250)  NULL
)
GO
CREATE TABLE smsMessagesResp (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_client int NOT NULL ,
	message char (255)  NOT NULL ,
	phone char (50)  NOT NULL ,
	data datetime NOT NULL default '0000-00-00 00:00:00', 
	cost decimal (12,4) NOT NULL default 0.0000, 
	status int NOT NULL DEFAULT 1,
	client_type int NOT NULL DEFAULT 4
)
GO
CREATE TABLE Clientscallbackphones (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_client int NOT NULL,
	phone_number char (50)  NOT NULL,
	def smallint NOT NULL DEFAULT 0,
	client_type int NOT NULL DEFAULT 4
)
GO
CREATE TABLE VoipBox (
	id int PRIMARY KEY NOT NULL ,
	description char (50) NOT NULL 
) 
GO
CREATE TABLE Noroutes (
	id_route int PRIMARY KEY NOT NULL ,
	description char (50) NOT NULL 
) 
GO
CREATE TABLE activepc2phone (
  id_active_pc2phone INT NOT NULL DEFAULT '0',
  id_client INT DEFAULT NULL,
  login VARCHAR(20) DEFAULT NULL,
  login_time DATETIME DEFAULT NULL,
  ip_number VARCHAR(33) DEFAULT NULL,
  PRIMARY KEY (id_active_pc2phone)
)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsE on ClientsE164(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsH on ClientsHearLink(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsI on ClientsIP(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsC on ClientsCallback(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsP on ClientsPIN(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsPP on ClientsPIN(password)
GO
CREATE INDEX IX_PhoneNumber on DialingPlan(telephone_number)
GO
CREATE INDEX IX_ClientsIPNumber on IPNumbers(ip_number)
GO
CREATE UNIQUE INDEX IX_LotsDesc on Lots(lot_desc)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsH on clientscallback(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsCS on ClientsShared(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsCSP on ClientsShared(password)
GO

insert into TariffsNames(id_tariff,description,minimal_time,resolution,type) values (1,'TestTariff',1,6,0)
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
insert into ClientsIP(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'smallgw','smallgw',15794691,1,10.0,'')
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,0,10.0,now(),1,'initial payment')
GO
insert into ClientsHearlink(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'user1','pass1',15794691,1,10.0,'')
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,1,10.0,now(),1,'initial payment')
GO
insert into ClientsE164(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'ipphone','pass2',15794691,1,10.0,'')
GO
insert into Payments(id_client,client_type,money,data,type,description) values (1,2,10.0,now(),1,'initial payment')
GO
insert into clientscallback(id_client,login,password,type,id_tariff,account_state,tech_prefix)
values (1,'callback','callback',268435459,1,100,'')
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
INSERT INTO ClientTypes (id_client_type,client_type_name) 
VALUES (8,'Client IVR')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) 
VALUES (16,'Client CallShop')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) 
VALUES (32,'Client Common')
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
CREATE TABLE IF NOT EXISTS Companies (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name char (200)  NULL ,
	address char (255)  NULL ,
	zip char (50)  NULL ,
	city char (100)  NULL ,
	country char (100)  NULL ,
	email char (255)  NULL ,
	phone char (255)  NULL ,
	phone1 char (255)  NULL
)
GO
CREATE TABLE IF NOT EXISTS CompaniesClients (
	id_company int NOT NULL ,
	id_client int NOT NULL ,
	client_type int NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS Payments (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_client int NOT NULL ,
	client_type int NOT NULL ,
	money decimal (12, 4) NULL ,
	data datetime NULL ,
	type int NULL ,
	description char (255) NOT NULL default ''
)
GO
CREATE INDEX IX_PaymentsIDClient on Payments(id_client)
GO
CREATE INDEX IX_PaymentsClientType on Payments(client_type)
GO
CREATE TABLE IF NOT EXISTS PaymentTypes (
	id int PRIMARY KEY NOT NULL ,
	name char (40)
)
GO
CREATE TABLE IF NOT EXISTS CallShopUsers (
	id_callshopuser int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_callshop int NOT NULL,
	id_client int NOT NULL,
	client_type int NOT NULL
) 
GO
CREATE TABLE IF NOT EXISTS ClientsCallShop (
	id_client int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login char (20) NOT NULL ,
	password char (20) NOT NULL ,
	id_tariff int NOT NULL ,
	account_state decimal (12, 4) NOT NULL default 0.0,
	id_reseller int NOT NULL default -1 ,
	id_intrastate_tariff int NOT NULL DEFAULT -1,
	tech_prefix char (255)  NOT NULL DEFAULT '' ,
	id_currency INT NOT NULL DEFAULT '1',
	type int NOT NULL DEFAULT 1
)
GO
ALTER TABLE CompaniesClients ADD PRIMARY KEY (id_company,id_client,client_type)
GO
INSERT INTO PaymentTypes(id, name) VALUES(1,'PrePaid')
GO
INSERT INTO PaymentTypes(id, name) VALUES(2,'Credit')
GO
INSERT INTO PaymentTypes(id, name) VALUES(3,'Return')
GO
INSERT INTO PaymentTypes(id, name) VALUES(4,'Return credit')
GO
CREATE TABLE IF NOT EXISTS Pins (
	name char (100) PRIMARY KEY NOT NULL ,
	id_status int NOT NULL ,
	serial int NOT NULL ,
	id_lot int NOT NULL ,
	amount decimal (12,4) NOT NULL default 0.0
)
GO
CREATE TABLE IF NOT EXISTS PinsLots (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	name char (50) NOT NULL ,
	dat datetime NOT NULL 
)
GO
CREATE TABLE IF NOT EXISTS PinsStatus (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	name char (50) NOT NULL
)
GO
insert into PinsStatus(id,name) values(1,'Active')
GO
insert into PinsStatus(id,name) values(2,'Inactive')
GO
insert into PinsStatus(id,name) values(3,'Used')
GO
CREATE TABLE IF NOT EXISTS CallsCallshop (
	id_call int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_client int NOT NULL ,
	ip_number char (33)  NOT NULL ,
	caller_id char (40) NOT NULL ,
	called_number char (40)  NOT NULL ,
	call_start datetime NOT NULL ,
	call_end datetime NOT NULL ,
	route_type int NOT NULL ,
	id_tariff int NOT NULL ,
	cost decimal(12, 4) NULL ,
	duration int NOT NULL ,
	tariff_prefix char (20) NOT NULL default '',
	client_type int NOT NULL ,
	id_route int NULL,
	pdd int NOT NULL,
	costR1 decimal (12,4) NOT NULL default 0.0 ,
	costR2 decimal (12,4) NOT NULL default 0.0 ,
	costR3 decimal (12,4) NOT NULL default 0.0 ,
	costD decimal (12,4) NOT NULL default 0.0 ,
	id_reseller int NOT NULL default -1 ,
	tariffdesc char (100) NOT NULL default '',
	id_cc int NOT NULL default 0,
	ratio DECIMAL(12,4) NOT NULL DEFAULT 1,
        invoice_id int NOT NULL DEFAULT -1
) 
GO
CREATE TABLE IF NOT EXISTS DIDCallback(
	didnumber char (50) NOT NULL ,
	clientnumber char (50) NOT NULL ,
	id_client int NOT NULL ,
	client_type int NOT NULL 
)
GO
CREATE TABLE IF NOT EXISTS PrefixTariff (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	prefix char (50) NOT NULL ,
	id_tariff int NOT NULL ,
	type int NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS ANITariff (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	prefix char (50) NOT NULL ,
	id_tariff int NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS RoutesUsers (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	login char (50) NOT NULL ,
	password char (50) NOT NULL ,
	id_route int NOT NULL ,
	route_type int NOT NULL ,
	CostVisible int not null default 1
)
GO
CREATE TABLE IF NOT EXISTS Languages ( 
	id int PRIMARY KEY NOT NULL,
	name char (100) NOT NULL default ''
)
GO
insert into Languages(id,name) values (0,'English')
GO
insert into Languages(id,name) values (1,'Chinese')
GO
insert into Languages(id,name) values (2,'Vietnamese')
GO
insert into Languages(id,name) values (3,'Albanian')
GO
insert into Languages(id,name) values (4,'French')
GO
insert into Languages(id,name) values (5,'Polish')
GO
insert into Languages(id,name) values (6,'Spanish')
GO
insert into Languages(id,name) values (7,'Portugese')
GO
insert into Languages(id,name) values (8,'BenGOli')
GO
insert into Languages(id,name) values (9,'Romanian')
GO
insert into Languages(id,name) values (10,'Russian')
GO
insert into Languages(id,name) values (11,'Arabic')
GO
insert into Languages(id,name) values (12,'Turkish')
GO
insert into Languages(id,name) values (13,'Hebrew')
GO
insert into Languages(id,name) values (14,'Thai')
GO
insert into Languages(id,name) values (15,'English2')
GO
insert into Languages(id,name) values (16,'Bulgarian')
GO
insert into Languages(id,name) values (17,'German')
GO
CREATE TABLE IF NOT EXISTS Resellers1 (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	idReseller int NULL ,
	login char (20)  NOT NULL ,
	password char (20)  NOT NULL  ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	callsLimit decimal(12, 4) NULL,
	clientsLimit decimal(12, 4) NULL,
	tech_prefix char (255)  NOT NULL default '', 
	identifier char (10)  NOT NULL default '' , 
	Fullname char (200)  NOT NULL default '', 
	Address char (200)  NOT NULL default '', 
	City char (50)  NOT NULL default '', 
	ZipCode char (20)  NOT NULL default '', 
	Country char (50)  NOT NULL default '', 
	Phone char (50)  NOT NULL default '',
	Email char (200)  NOT NULL default '',
	MaxClients int NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS Resellers2 (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	idReseller int NULL ,
	login char (20)  NOT NULL ,
	password char (20)  NOT NULL  ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	callsLimit decimal(12, 4) NULL,
	clientsLimit decimal(12, 4) NULL,
	tech_prefix char (255)  NOT NULL default '', 
	identifier char (10)  NOT NULL default '' , 
	Fullname char (200)  NOT NULL default '', 
	Address char (200)  NOT NULL default '', 
	City char (50)  NOT NULL default '', 
	ZipCode char (20)  NOT NULL default '', 
	Country char (50)  NOT NULL default '', 
	Phone char (50)  NOT NULL default '',
	Email char (200)  NOT NULL default ''
)
GO
CREATE TABLE IF NOT EXISTS Resellers3 (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login char (20)  NOT NULL ,
	password char (20)  NOT NULL  ,
	type int NOT NULL ,
	id_tariff int NOT NULL ,
	callsLimit decimal(12, 4) NULL,
	clientsLimit decimal(12, 4) NULL,
	tech_prefix char (255)  NOT NULL default '', 
	identifier char (10)  NOT NULL default '' , 
	Fullname char (200)  NOT NULL default '', 
	Address char (200)  NOT NULL default '', 
	City char (50)  NOT NULL default '', 
	ZipCode char (20)  NOT NULL default '', 
	Country char (50)  NOT NULL default '', 
	Phone char (50)  NOT NULL default '',
	Email char (200)  NOT NULL default ''
)
GO
CREATE TABLE IF NOT EXISTS Users (
	id_user int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	login varchar (20)  NOT NULL default '',
	password varchar (20)  NOT NULL default '' ,
	fullname varchar (255)  NOT NULL default '' ,
	address varchar (255)  NOT NULL default '' ,
	city varchar (255)  NOT NULL default '' ,
	zipcode varchar (255)  NOT NULL default '' ,
	country varchar (255)  NOT NULL default '' ,
	phone varchar (255)  NOT NULL default '' ,
	email varchar (255)  NOT NULL default '' ,
	type int NOT NULL default 0 
)
GO
CREATE UNIQUE INDEX IX_UsersLogins on Users(login)
GO
CREATE TABLE IF NOT EXISTS resellerspayments (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_reseller int default NULL ,
  	resellerlevel int NOT NULL default '0',
	money decimal(12,4) default NULL,
	data datetime default NULL  ,
	type int NOT NULL default 0 
)
GO
CREATE TABLE IF NOT EXISTS tariffreseller (
	id_tariff int NOT NULL,
	id_reseller int NOT NULL default '0',
	resellerlevel int NOT NULL default '0'
)
GO 
ALTER TABLE tariffreseller ADD PRIMARY KEY (id_tariff,id_reseller,resellerLevel)
GO
CREATE TABLE IF NOT EXISTS lotreseller (
	id_lot int PRIMARY KEY NOT NULL default '0',
	id_reseller int NOT NULL default '0'
)
GO 
CREATE TABLE RedirectPhones (
  id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_client int NOT NULL default '0',
  client_type int NOT NULL default '0',
  call_end_reason int NOT NULL default '0',
  follow_me_number varchar (255)  NOT NULL default '' ,
  number_priority smallint NOT NULL default '0' ,
  did_number varchar (100)  NOT NULL default ''
)
GO
CREATE INDEX IX_RedirectPhones on RedirectPhones(id_client,client_type)
GO
CREATE TABLE IF NOT EXISTS InvoiceClients (
	IDClient int NOT NULL ,
	type int NOT NULL ,
	Name varchar(200) NULL ,
	Address varchar(1000) NULL ,
	EMail varchar(50) NULL ,
	Login varchar(50) NOT NULL DEFAULT '',
	TaxID varchar(50) NULL ,
	LastUsed tinyint(1) NOT NULL DEFAULT 0,
	clientNr varchar (50) NULL,
	City varchar(200) NULL,
	State varchar(200) NULL,
	Zip varchar(50) NULL,
	Country varchar(100) NULL,
	LastName varchar(100) NULL,
	paymentcode char(20) NOT NULL DEFAULT '',
	Phone varchar(30) NULL ,
	PRIMARY KEY(`IDClient`,`type`)
)
GO
CREATE TABLE IF NOT EXISTS voicemessages(
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_client int NOT NULL ,
	client_type int NOT NULL ,
	message_start datetime NOT NULL ,
	duration int NOT NULL ,
	message_type int NOT NULL DEFAULT 0,
	caller_ani char (40) NOT NULL DEFAULT '',
	filename char (255) NOT NULL DEFAULT '',
	id_message int NOT NULL DEFAULT 0,
	remind_send int (1) DEFAULT '0' NULL
)
GO
CREATE INDEX IX_VoiceMessagesClientType on voicemessages(id_client,client_type)
GO
CREATE TABLE IF NOT EXISTS voicemailusers(
id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_client int NOT NULL ,
client_type int NOT NULL ,
email char (255) NOT NULL DEFAULT '' ,
start_message char (255) NOT NULL DEFAULT ''
)
GO
CREATE INDEX IX_voicemailusersClientType on voicemailusers(id_client,client_type)
GO
CREATE INDEX IX_CallsResellers on Calls(id_reseller)
GO
CREATE INDEX IX_CallsCallStart on Calls(call_start)
GO
CREATE INDEX IX_CallsIDTariff on Calls(id_tariff)
GO
CREATE INDEX IX_CallsIDClient on Calls(id_client)
GO
CREATE INDEX IX_CallsClientType on Calls(client_type)
GO
CREATE INDEX IX_TariffsIDtariff on Tariffs(id_tariff)
GO
CREATE INDEX IX_TariffsTariffPrefix on Tariffs(prefix)
GO
CREATE INDEX IX_CallsFailedCallStart on CallsFailed(call_start)
GO
CREATE INDEX IX_CallsFailedClientType on CallsFailed(client_type)
GO
CREATE INDEX IX_CallsFailedRouteType on CallsFailed(route_type)
GO
CREATE TABLE IF NOT EXISTS History (
            id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
            version char (100)  NOT NULL ,
            start datetime NOT NULL ,
            stop datetime NOT NULL 
)
GO
CREATE TABLE IF NOT EXISTS prefixtariffreseller (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	prefix char (50) NOT NULL ,
	id_tariff int NOT NULL ,
	id_reseller int NOT NULL,
	reseller_level int NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS settings (
            id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
            name CHAR (255) NOT NULL ,
	    value varCHAR(1024) NOT NULL ,
	    category CHAR(100) NOT NULL
)
GO
CREATE UNIQUE INDEX IX_SettingsNameCategory on settings(name,category)
GO
ALTER TABLE settings ADD COLUMN id INT NOT NULL AUTO_INCREMENT,DROP PRIMARY KEY,ADD PRIMARY 
GO
ALTER TABLE Settings change COLUMN value value varchar(1024) NOT NULL DEFAULT ''
GO
CREATE TABLE IF NOT EXISTS sim (                                                                        id int(11) PRIMARY KEY NOT NULL auto_increment,                                               phone_number char(40) NOT NULL,                                                               id_client int(11) NOT NULL default 0,                                                         param1 char(40) NOT NULL,                                                                     UNIQUE KEY `phone_number` (`phone_number`)                                          ) DEFAULT CHARSET=ascii 
GO
CREATE TABLE IF NOT EXISTS ResLotTimes (                                                                id int(11) PRIMARY KEY NOT NULL auto_increment,                                     
          id_reseller int(11) NOT NULL default -1,                                                      id_lot int(11) NOT NULL default -1,                                             
	  multiplier decimal(12,4) default 1.0
) DEFAULT CHARSET=ascii
GO
CREATE TABLE IF NOT EXISTS ServiceLog (
	IDLog int NOT NULL auto_increment,
	Type int NOT NULL,
	sDescription varchar(500) NULL,
	sStatus varchar(100) NULL,
	Date_ datetime NOT NULL,
	PRIMARY KEY(`IDLog`)
)
GO
CREATE TABLE IF NOT EXISTS Properties (
	Property varchar(50) NOT NULL,
	Value varchar(8000) NOT NULL,
	PRIMARY KEY(`Property`)
)
GO
CREATE TABLE IF NOT EXISTS ServiceToLots (
	IDLot int NOT NULL ,
	Type int NOT NULL ,
	Months int NOT NULL ,
	Days int NOT NULL ,
	Hours int NOT NULL,
	PRIMARY KEY(`IDLot`, `Type`)
)
GO
CREATE TABLE IF NOT EXISTS AccountState (
	IDPosition int NOT NULL auto_increment,
	Type int NULL,
	IDLots int NULL,
	Amount decimal(18, 2) NOT NULL,
	useHTML bit NOT NULL DEFAULT 0,
	msgBody varchar (2000) NULL,
	msgTitle varchar (200) NULL,
	HTMLPath varchar (300) NULL,
	PRIMARY KEY(`IDPosition`)
)
GO
CREATE TABLE IF NOT EXISTS MessagesSending (
	IDPosition int NOT NULL auto_increment,
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Date_ datetime NOT NULL,
	IDMessage int NULL,
	PRIMARY KEY(`IDPosition`)
)
GO
CREATE TABLE IF NOT EXISTS InvoiceToLots (
	IDLot int NOT NULL,
	PRIMARY KEY(`IDLot`)
)
GO
CREATE TABLE IF NOT EXISTS ServiceToClients (
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Months int NOT NULL ,
	Days int NOT NULL ,
	Hours int NOT NULL,
	PRIMARY KEY(`IDClient`, `Type`)
)
GO
CREATE TABLE IF NOT EXISTS callsArchives (
	tableName varchar (100) NOT NULL ,
	firstCall datetime NULL ,
	lastCall datetime NULL ,
	callsCount int NULL,
	PRIMARY KEY(`tableName`)
)
GO
CREATE TABLE IF NOT EXISTS PaymentsToClientsLots (
	IDPayment int NOT NULL auto_increment,
	IDClient int NOT NULL ,
	IDLot int NOT NULL ,
	Type int NOT NULL ,
	Interval_ int NOT NULL ,
	Period int NOT NULL ,
	Fee decimal(18, 2) NOT NULL ,
	Start datetime NOT NULL ,
	Description_ varchar (255) NULL,
	PRIMARY KEY(`IDPayment`)
)
GO
CREATE TABLE IF NOT EXISTS clientsPayments (
	IDClient int NOT NULL ,
	Type int NOT NULL ,
	Date_ datetime NOT NULL ,
	Amount decimal(18, 4) NOT NULL,
	IDPayment int NOT NULL,
	PRIMARY KEY(`IDClient`,`Type`,`Date_`,`IDPayment`)
)
GO
CREATE TABLE IF NOT EXISTS AccountStateReseller (
	IDPosition int NOT NULL auto_increment,
	ResellerLevel int NULL,
	Amount decimal(18, 2) NOT NULL,
	useHTML bit NOT NULL DEFAULT 0,
	msgBody varchar (2000) NULL,
	msgTitle varchar (200) NULL,
	HTMLPath varchar (300) NULL,
	PRIMARY KEY(`IDPosition`)
)
GO
CREATE TABLE IF NOT EXISTS MessagesSendingReseller (
	IDPosition int NOT NULL auto_increment,
	IDReseller int NOT NULL ,
	ResellerLevel int NOT NULL ,
	Date_ datetime NOT NULL,
	IDMessage int NULL,
	PRIMARY KEY(`IDPosition`)
)
GO
CREATE TABLE IF NOT EXISTS NPA (
	npa_number char (40) PRIMARY KEY NOT NULL ,
	location char (50) NOT NULL default ''
)
GO
CREATE TABLE IF NOT EXISTS Invoices ( 
	InvoiceID int(11) NOT NULL auto_increment, 
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
	Nr int(11) NOT NULL ,
	Month_ int(11) NOT NULL , 
	Year_ int(11) NOT NULL , 
	Date_ datetime NULL, 
	clientNr varchar(50) NULL, 
	City varchar(200) NULL,
	State varchar(200) NULL,
	Zip varchar(50) NULL,
	Country varchar(100) NULL,
	LastName varchar(100) NULL,
	CabinId int NOT NULL DEFAULT 0,
	id_client int NOT NULL DEFAULT -1,
	client_type int NOT NULL DEFAULT -1,
	PRIMARY KEY(InvoiceID)
)
GO
CREATE TABLE IF NOT EXISTS users_permissions ( 
	id_permission int(11) NOT NULL auto_increment, 
	id_user int(11) NOT NULL ,
	command VARCHAR(255) NOT NULL,
	enabled BOOLEAN NOT NULL,
	type INT NOT NULL DEFAULT 0 ,
	PRIMARY KEY (id_permission),
	UNIQUE INDEX UserCommand(id_user, command)
)
GO
CREATE TABLE IF NOT EXISTS NotifiesToClientsLots (
  `IDClient` INT(11) NOT NULL AUTO_INCREMENT,
  `Type` INT(11) UNSIGNED NOT NULL,
  `Date` DATETIME NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`IDClient`, `Type`)
)
GO
CREATE TABLE IF NOT EXISTS enumroots (
  id_route INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(255) NOT NULL DEFAULT '',
  ip_number VARCHAR(255) NOT NULL DEFAULT '',
  type int NOT NULL DEFAULT -1,
  PRIMARY KEY (`id_route`)
)
GO
CREATE TABLE IF NOT EXISTS Lookups (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  description VARCHAR(255) NOT NULL,
  query_string VARCHAR(255) NOT NULL,
  string1 VARCHAR(255) NOT NULL,
  string2 VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS chargeTypes (
	Amount decimal(18, 2) NOT NULL ,
	Description varchar (50) NULL,
	DescriptionLong varchar(2000) NULL,
	flagCreate tinyint(1) NOT NULL DEFAULT 1,
	flagCharge tinyint(1) NOT NULL DEFAULT 1,
	PRIMARY KEY(`Amount`)
)
GO
CREATE TABLE IF NOT EXISTS WebPaymentOperations (
	ID int NOT NULL  auto_increment,
	Description varchar (250) NOT NULL ,
	SessionID varchar (150) NULL ,
	Date_ datetime NOT NULL,
	PRIMARY KEY(`ID`)
)
GO
CREATE TABLE IF NOT EXISTS PayPalRequest (
	PayPalToken varchar (200) NOT NULL ,
	IDClient int NULL ,
	ClientType int NULL ,
	OperationType int NULL ,
	Status int NOT NULL ,
	Date_ datetime NULL ,
	Amount decimal(18,2) NULL ,
	ClientLogin varchar (150) NULL ,
	ClientPassword varchar (150) NULL,
	PaymentStatus varchar (150) NULL,
	SessionID varchar (150) NULL,
	Buyer varchar (250) NULL,
	BuyerEmail varchar (50) NULL,
	BuyerAddress varchar(1000) NULL,
	MerchantID int NULL,
	BuyerCity varchar(200) NULL,
	BuyerState varchar(200) NULL,
	BuyerZip varchar(50) NULL,
	BuyerCountry varchar(100) NULL,
	BuyerLastName varchar(100) NULL,
	Zone varchar(50) NULL,
	Number varchar(50) NULL,
	PRIMARY KEY(`PayPalToken`, `MerchantID`)
)
GO
CREATE TABLE IF NOT EXISTS PayPalConfig (
	ClientType int NOT NULL ,
	Item_ varchar (50) NOT NULL ,
	Value_ varchar (50) NULL ,
	FillTable varchar (250) NULL,
	ShowColumn varchar (250) NULL,
	DataColumn varchar (250) NULL,
	IsBoolean int NOT NULL,
	PRIMARY KEY(`ClientType`, `Item_`)
)
GO
CREATE TABLE IF NOT EXISTS Properties (
	Property varchar(50) NOT NULL,
	Value varchar(8000) NOT NULL,
	PRIMARY KEY(`Property`)
)
GO
CREATE TABLE IF NOT EXISTS ChargeToClient (
	Amount decimal(18, 2) NOT NULL ,
	ClientType int NOT NULL,
	PRIMARY KEY(`Amount`, `ClientType`)
)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'payment type','1','PaymentTypes','name','id',0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'dialing prefix','',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'tariff prefix','',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE ClientType=1
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'source plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'source tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'connect immedia.','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'primary codec','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G723.1','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G729','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'GSM','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G711','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'client codec','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'device','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'connect immedia.','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'primary codec','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G723.1','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G729','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'GSM','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G711','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'client codec','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'connect immedia.','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'primary codec','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'G723.1','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'G729','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'GSM','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'G711','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'client codec','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'device','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'source plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'source tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'login - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'login - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'login - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'login - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'password - Number of characters','20',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'password - Use numbers','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'password - Use up cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'password - Use low cases','1',null,null,null,1) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'dest. plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'dest. tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'id tariff','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'source plan','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'source tariff','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'connect immedia.','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'primary codec','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'G723.1','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'G729','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'GSM','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'G711','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'client codec','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'device','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
CREATE TABLE IF NOT EXISTS otherGoods (
	ID int(11) NOT NULL auto_increment,
	Amount decimal(18, 2) NOT NULL,
	Description varchar (50) NOT NULL,
	DescriptionLong varchar (2000) NULL,
	PRIMARY KEY(`ID`)
)
GO
CREATE TABLE IF NOT EXISTS PayPalRequestGoods (
 PayPalToken varchar (200) NOT NULL ,
 Status int NOT NULL ,
 Date_ datetime NULL ,
 Amount decimal(18, 2) NULL ,
 PaymentStatus varchar (150) NULL,
 SessionID varchar (150) NULL,
 Buyer varchar (250) NULL,
 BuyerEmail varchar (50) NULL,
 GoodsID int NOT NULL,
 Goods varchar (50),
 BuyerAddress varchar(1000) NULL,
 MerchantID int NULL,
 BuyerCity varchar(200) NULL,
 BuyerState varchar(200) NULL,
 BuyerZip varchar(50) NULL,
 BuyerCountry varchar(100) NULL,
 BuyerLastName varchar(100) NULL,
 Zone varchar(50) NULL,
 Number varchar(50) NULL,
 PRIMARY KEY(`PayPalToken`, `MerchantID`)
)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'useList','0',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'listPath','',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
CREATE TABLE IF NOT EXISTS InvoiceClients (
	IDClient int NOT NULL ,
	type int NOT NULL ,
	Name varchar(200) NULL ,
	Address varchar(1000) NULL ,
	EMail varchar(50) NULL ,
	Login varchar(50) NULL ,
	TaxID varchar(50) NULL ,
	LastUsed tinyint(1) NOT NULL DEFAULT 0,
	clientNr varchar (50) NULL,
	City varchar(200) NULL,
	State varchar(200) NULL,
	Zip varchar(50) NULL,
	Country varchar(100) NULL,
	LastName varchar(100) NULL,
	paymentcode char(20) NOT NULL DEFAULT '',
	PRIMARY KEY(`IDClient`,`type`)
)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(1,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(2,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(16,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'visible','1',null,null,null,0) ON DUPLICATE KEY UPDATE isBoolean=0
GO
CREATE TABLE IF NOT EXISTS ZoneFiles(
ClientType int NOT NULL,
Zone varchar(50) NOT NULL, 
File_ varchar(500) NOT NULL,
Description varchar(255) NULL,
PRIMARY KEY(`ClientType`,`Zone`)
)
GO
CREATE TABLE IF NOT EXISTS currencies 
( 
id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, 
ratio DECIMAL(12,4) NOT NULL DEFAULT 1, 
id_currency INTEGER UNSIGNED NOT NULL, 
date DATETIME NOT NULL,
PRIMARY KEY (id), 
INDEX id_currency USING BTREE(id_currency, date)
)
GO 
CREATE TABLE IF NOT EXISTS currency_names 
( 
id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, 
name VARCHAR(50) NOT NULL, 
PRIMARY KEY (id) 
)
GO
insert into currency_names(id,name) values (1,'USD')
GO
insert into currencies(ratio,id_currency,date) values (1,1,now())
GO
CREATE TABLE IF NOT EXISTS sms_dialingplan (
	id_dialplan int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	telephone_number char (40)  NOT NULL ,
	priority smallint NOT NULL ,
	route_type int NOT NULL ,
	tech_prefix char (255)  NOT NULL ,
	dial_as char (40)  NOT NULL default '',
	id_route int NOT NULL ,
	call_type int NOT NULL ,
	type int NOT NULL ,
	from_day smallint NOT NULL DEFAULT 0,
	to_day smallint NOT NULL DEFAULT 6,
	from_hour smallint NOT NULL DEFAULT 0,
	to_hour smallint NOT NULL DEFAULT 2400,
	balance_share int NOT NULL default 100
) 
GO
CREATE TABLE IF NOT EXISTS sms_providers (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	name char (255) NOT NULL, 
 	connection_string varchar(1024) NOT NULL DEFAULT ''
)
GO
CREATE TABLE IF NOT EXISTS sms_providers_responses (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_route int NOT NULL ,
	code int NOT NULL ,
	provider_string varchar (512) NULL ,
	user_string varchar (512) NULL 
)
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (1,-1,400,'authorization_failed','Authorization failed.')
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (2,-1,401,'not_enough_funds','Not enough funds.')
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (3,-1,500,'no_tariff','SMS destination is not allowed')
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (4,-1,501,'no_dialplan_entry','SMS destination is not allowed')
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (5,-1,600,'sms_provider_is_offline','SMS provider is offline.')
GO
INSERT INTO sms_providers_responses (id,id_route,code,provider_string,user_string) VALUES (6,-1,601,'sms_provider_cannot_process_the_message','SMS provider cannot process the message')
GO
CREATE TABLE IF NOT EXISTS Tariffs_sms (
	id_tariffs_key int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_tariff int NOT NULL ,
	prefix char (20)  NOT NULL ,
	description char (100)  NOT NULL ,
	voice_rate numeric(8, 4) NOT NULL ,
	from_day smallint NOT NULL ,
	to_day smallint NOT NULL ,
	from_hour smallint NULL ,
	to_hour smallint NOT NULL ,
	grace_period int NOT NULL default 0 ,
	minimal_time smallint NOT NULL default 0 ,
	resolution smallint NOT NULL default 0 ,
 	rate_multiplier DOUBLE NOT NULL DEFAULT -1.0 ,
 	rate_addition DOUBLE NOT NULL DEFAULT -1.0
) 
GO
CREATE TABLE IF NOT EXISTS InvoiceClientsOperations (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	id_client int NOT NULL ,
	client_type int NOT NULL ,
	id_operation int NOT NULL 
) 
GO
CREATE TABLE IF NOT EXISTS Operations (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	type int NOT NULL ,
	date datetime NOT NULL ,
	description varchar (255)  NOT NULL ,
	idUser int NOT NULL
) 
GO
CREATE TABLE IF NOT EXISTS OperationsTypes (
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	description char (50)  NOT NULL
) 
GO
CREATE TABLE IF NOT EXISTS personalization (
  id int(10) unsigned NOT NULL auto_increment,
  id_client int unsigned NOT NULL,
  client_type int unsigned NOT NULL,
  module varchar(45) NOT NULL,
  name varchar(45) default NULL,
  data longtext NOT NULL,
  PRIMARY KEY  (`id`)
)
GO
insert into OperationsTypes(id,name) values (1,"Registration")
GO
insert into OperationsTypes(id,name) values (2,"Registered")
GO
insert into OperationsTypes(id,name) values (3,"Recharging")
GO
insert into OperationsTypes(id,name) values (4,"Recharged")
GO
--create database morskie_gruzoperevozki
use morskie_gruzoperevozki;

--������� ������� ������ � PK

--���������� ����� (2)
create table measures_of_boat(
    llength int not null,
    volume int not null,
    ID int not null Primary key
);

--���������� ������������ (4)
create table internal_configuration(
    ID int not null Primary key,
    boards int default 0,
    compartments int default 0,
    double_bottom int default 0
);

--�������� ����������� ����� (7)
create table ship_modification_options(
    ID int not null Primary key,
	on_technical_innovations nchar(60) default 0,
	demand int default 0,
	proposal int default 0
);

--������������ ����� (10)
create table cargo_name(
    ID int not null Primary key,
	oil int not null,
	general_cargo int not null,
	conteiner_cargo int not null
);

--��� ��������� (12)
create table engine_type(
    speed int,
	ID int not null Primary key,
	fuel_type nchar(20) default 0
);

--������� ������������ (13)
create table external_complectation(
    ID int not null Primary key,
	lifting_crane int default 0,
	boats int default 1
)

--������� ��������� ������� � PK � FK

--��� ����� (8)
create table type_of_vessel(
    internal_configuration int not null,
	Foreign key (internal_configuration) References internal_configuration (ID),
	measures_of_boat int not null,
	Foreign key (measures_of_boat) References measures_of_boat (ID),
	ship_modification_options int not null,
	Foreign key (ship_modification_options) References ship_modification_options (ID),
	capacity int,
    ID int not null Primary key,
	external_complectation int not null,
	Foreign key (external_complectation) References external_complectation (ID),
	engine_type int not null,
	Foreign key (engine_type) References engine_type (ID)
);

--���������� � �������� ���������� (6)
create table requirements_for_cargo_spaces(
    ID int not null Primary key,
    cargo_name int not null,
	Foreign key (cargo_name) References cargo_name (ID),
	ventilation int default 1,
	hold_depth int
);

--������������� ����� (5)
create table classification_of_vessels(
    by_type_of_cargo nchar(40),
	type_of_vessel int not null,
	Foreign key (type_of_vessel) References type_of_vessel (ID),
    ID int not null Primary key,
	requirements_for_cargo_spaces int not null,
	Foreign key (requirements_for_cargo_spaces) References requirements_for_cargo_spaces (ID),
);

--��������� (9)
create table rangee(
    classification_of_vessels int not null,
	Foreign key (classification_of_vessels) References classification_of_vessels (ID),
	timee int,
	ID int not null Primary key,
	all_parking_times int
);

--������� ������� ������ � FK

--������� �������� � �������� (1)
create table loading_and_unloading_process(
    timee int default 0,
	typee nchar(40) default 0,
	cargo_name int not null,
	Foreign key (cargo_name) References cargo_name (ID)
);

--������ (3)
create table countries(
    country_name nchar(40) default 0,
	parking_lot int default 0,
	rangee int not null,
	Foreign key (rangee) References rangee (ID),
	ID int not null
);

insert into measures_of_boat (llength, volume, ID)--
Values
(1000,3000,1),
(1500,4500,2),
(700,2100,3),
(900,2700,4),
(800,2400,5),
(1100,3300,6),
(1300,3900,7)

insert into internal_configuration(ID,compartments)--
Values
(1,2000),
(2,3000),
(3,1400),
(4,1800),
(5,1600),
(6,2200),
(7,2600)

insert into ship_modification_options(ID, on_technical_innovations)--
Values
(1,'������� ����������� ���������'),
(2,'������� ����������'),
(3,'������� ���������'),
(4,'��������� ��� ����'),
(5,'������������ ��� ��������� ����')

insert into cargo_name(ID,oil,general_cargo,conteiner_cargo)
Values
(1,1,0,0),
(2,0,1,0),
(3,1,0,0),
(4,0,1,0),
(5,1,0,0)

insert into engine_type(speed,ID,fuel_type)--
Values
(90,1,'�����'),
(50,2,'�����'),
(100,3,'������'),
(80,4,'�������� �������'),
(75,5,'��������� ���'),
(70,6,'������� �������'),
(85,7,'������')

insert into external_complectation(ID)--
Values
(1),
(2),
(3),
(4),
(5),
(6),
(7)

insert into type_of_vessel(internal_configuration,measures_of_boat,ship_modification_options,capacity,ID,external_complectation,engine_type)--
Values
(1,1,1,1000,1,1,1),
(2,2,2,1500,2,2,2),
(3,3,2,700,3,3,3),
(4,4,2,900,4,4,4),
(5,5,3,800,5,5,5),
(6,6,4,1100,6,6,6),
(7,7,5,1300,7,7,7)

insert into requirements_for_cargo_spaces(ID,cargo_name,hold_depth)
Values
(1,1,6),
(2,2,7),
(3,2,5),
(4,3,6),
(5,4,3),
(6,5,2)

insert into classification_of_vessels(by_type_of_cargo,type_of_vessel,ID,requirements_for_cargo_spaces)
Values
('���������������',1,1,1),
('���������',2,2,2),
('��������',3,3,3),
('��������',2,4,1),
('��������',7,5,4),
('��������-���������������',6,6,5),
('����������',5,7,6)

insert into rangee(classification_of_vessels,timee, ID,all_parking_times)
Values
(1,48,1,19),
(2,72,2,14),
(3,24,3,14),
(2,54,4,12),
(4,34,5,9);

insert into loading_and_unloading_process(cargo_name)
Values
(1),
(2),
(3),
(4),
(5)

insert into countries(parking_lot,rangee,ID)
Values
(15,1,1),
(3,2,2),
(12,3,3),
(7,4,4),
(1,5,5),
(4,1,6),
(11,2,7),
(2,3,8),
(5,4,9),
(8,5,10);

select * from measures_of_boat;
select * from internal_configuration;
select * from ship_modification_options;
select * from cargo_name;
select * from engine_type;
select * from external_complectation;
select * from type_of_vessel;
select * from requirements_for_cargo_spaces;
select * from classification_of_vessels;
select * from rangee;
select * from loading_and_unloading_process;
select * from countries;

go

--��� �������� ���_����� (type_of_vessel) ��������� ������ �� ��������� ������, ��� ����� � ����� ����� "���� � ������" ��� "���� �� ������" ��� ���� ������� �� ���� �����
create trigger Combin_Del on type_of_vessel
instead of delete
as
declare @type_of_vessel_ID_first int, @type_of_vessel_measures_of_boat_first int, @type_of_vessel_internal_configuration_first int,
@type_of_vessel_external_complectation_first int, @type_of_vessel_engine_type_first int, @classification_of_vessels_ID_first int, @rengee_ID_first int;
begin
set @type_of_vessel_ID_first = (select ID from deleted)
set @type_of_vessel_measures_of_boat_first = (select measures_of_boat from deleted)
set @type_of_vessel_internal_configuration_first = (select internal_configuration from deleted)
set @type_of_vessel_external_complectation_first = (select external_complectation from deleted)
set @type_of_vessel_engine_type_first = (select engine_type from deleted)
set @classification_of_vessels_ID_first = (select ID from classification_of_vessels where classification_of_vessels.type_of_vessel = @type_of_vessel_ID_first)
set @rengee_ID_first = (select ID from rangee where rangee.classification_of_vessels = @classification_of_vessels_ID_first)
delete from countries where countries.rangee = @rengee_ID_first
delete from rangee where rangee.classification_of_vessels = @classification_of_vessels_ID_first
delete from classification_of_vessels where classification_of_vessels.type_of_vessel = @type_of_vessel_ID_first
delete from type_of_vessel where type_of_vessel.ID = @type_of_vessel_ID_first
delete from measures_of_boat where measures_of_boat.ID = @type_of_vessel_measures_of_boat_first
delete from internal_configuration where internal_configuration.ID = @type_of_vessel_internal_configuration_first
delete from external_complectation where external_complectation.ID = @type_of_vessel_external_complectation_first
delete from engine_type where engine_type.ID = @type_of_vessel_engine_type_first
end

go

--��� ���������� ���� ����� ��������� ������ � ��������� ������� (���������� �����, ���������� ������������, ������� ������������, ��� ���������),
--��� ��� ���������� �������� ��� ����� �� "���������� �����" � ������� �� "���������� ������������" �� ������������ �������� ��� �������
create trigger Adding_From_Type_Of_Vessel on type_of_vessel
instead of insert
as
declare @type_of_vessel_ship_modification_options_AFT int, @type_of_vessel_measures_of_boat_AFT int, @type_of_vessel_internal_configuration_AFT int, @type_of_vessel_capacity_AFT int,
@type_of_vessel_external_complectation_AFT int, @type_of_vessel_ID_AFT int, @type_of_vessel_engine_type_AFT int;
begin
set @type_of_vessel_ship_modification_options_AFT = (select ship_modification_options from inserted)--3
set @type_of_vessel_measures_of_boat_AFT = (select measures_of_boat from inserted)--2
set @type_of_vessel_internal_configuration_AFT = (select internal_configuration from inserted)--1
set @type_of_vessel_capacity_AFT = (select capacity from inserted)--4
set @type_of_vessel_external_complectation_AFT = (select external_complectation from inserted)--6
set @type_of_vessel_ID_AFT = (select ID from inserted)--5
set @type_of_vessel_engine_type_AFT = (select engine_type from inserted)--7
if exists (select ID from ship_modification_options where ship_modification_options.ID = @type_of_vessel_ship_modification_options_AFT)
    begin
	insert into measures_of_boat(llength,volume,ID) Values (@type_of_vessel_capacity_AFT,@type_of_vessel_capacity_AFT*3,@type_of_vessel_measures_of_boat_AFT)
    insert into internal_configuration(ID,compartments) Values (@type_of_vessel_internal_configuration_AFT,@type_of_vessel_capacity_AFT*2)
    insert into external_complectation(ID) Values (@type_of_vessel_external_complectation_AFT)
    insert into engine_type(ID) Values (@type_of_vessel_engine_type_AFT)
    insert into type_of_vessel(internal_configuration,measures_of_boat,ship_modification_options,capacity,ID,external_complectation,engine_type)
    Values
    (@type_of_vessel_internal_configuration_AFT,@type_of_vessel_measures_of_boat_AFT,@type_of_vessel_ship_modification_options_AFT,@type_of_vessel_capacity_AFT,@type_of_vessel_ID_AFT,@type_of_vessel_external_complectation_AFT,@type_of_vessel_engine_type_AFT)
	end
else
    begin
	print ('���������� �������� ������ � �������, ��� ��� �� ���������� ����������� ship_modification_options.ID')
	end
end

go

--��� ��������� ������ � ������� type_of_vessel ���������� � ��� ���������� ������. �, �����, ���� ���� �������� type_of_vessel.capacity, ��������������� �������� �����, ������ � ������� ����� �� ���������
--������ "���������� �����" � "���������� ������������". type_of_vessel.ID ������ ������������� ���������
create trigger Updating_From_Type_Of_Vessel on type_of_vessel
instead of update
as
declare
--���� ������ �������� ����������� �����
@type_of_vessel_ship_modification_options_old_UFT int, @type_of_vessel_ship_modification_options_new_UFT int,
--���� ������ ���������� �����
@type_of_vessel_measures_of_boat_old_UFT int, @type_of_vessel_measures_of_boat_new_UFT int, @measures_of_boat_llength_UFT int, @measures_of_boat_volume_UFT int,
--���� ������ ���������� ������������
@type_of_vessel_internal_configuration_old_UFT int, @type_of_vessel_internal_configuration_new_UFT int, @internal_configuration_boards_UFT int, @internal_configuration_compartments_UFT int, @internal_configuration_double_bottom_UFT int,
--���� ��������� �����������
@type_of_vessel_capacity_old_UTF int, @type_of_vessel_capacity_new_UTF int,
--���� ��������� ������� ������������
@type_of_vessel_external_complectation_old_UTF int, @type_of_vessel_external_complectation_new_UTF int, @external_complectation_lifting_crane_UTF int, @external_complectation_boats_UTF int,
--���� �������� ��� ���������
@type_of_vessel_engine_type_old_UTF int, @type_of_vessel_engine_type_new_UTF int, @engine_type_speed_UTF int, @engine_type_fuel_type_UTF nchar(20);
begin
--���� ��������� �������� ����������� ����� ("ship_modification_options")
set @type_of_vessel_ship_modification_options_old_UFT = (select ship_modification_options from deleted)
set @type_of_vessel_ship_modification_options_new_UFT = (select ship_modification_options from inserted)
if (@type_of_vessel_ship_modification_options_new_UFT <> @type_of_vessel_ship_modification_options_old_UFT)
    begin
	if exists (select ID from ship_modification_options where ship_modification_options.ID = @type_of_vessel_ship_modification_options_new_UFT)
	    begin
		update type_of_vessel set ship_modification_options = @type_of_vessel_ship_modification_options_new_UFT where type_of_vessel.ID = (select ID from inserted)
		end
	else
	    begin
		print ('��������� ����������, ��� ��� � ���� ������ ���� ��������� ����������� ����� � ������ ID')
		end
	end
--���� ��������� ���������� ����� ("measures_of_boat")
set @type_of_vessel_measures_of_boat_new_UFT = (select measures_of_boat from inserted)
set @type_of_vessel_measures_of_boat_old_UFT = (select measures_of_boat from deleted)
if (@type_of_vessel_measures_of_boat_new_UFT <> @type_of_vessel_measures_of_boat_old_UFT)
    begin
	set @measures_of_boat_llength_UFT = (select llength from measures_of_boat where measures_of_boat.ID = @type_of_vessel_measures_of_boat_old_UFT)
	set @measures_of_boat_volume_UFT = (select volume from measures_of_boat where measures_of_boat.ID = @type_of_vessel_measures_of_boat_old_UFT)
	insert into measures_of_boat(llength,volume,ID) values (@measures_of_boat_llength_UFT,@measures_of_boat_volume_UFT,@type_of_vessel_measures_of_boat_new_UFT);
	update type_of_vessel set measures_of_boat = @type_of_vessel_measures_of_boat_new_UFT where type_of_vessel.ID = (select ID from inserted)
	delete from measures_of_boat where measures_of_boat.ID = @type_of_vessel_measures_of_boat_old_UFT
	end
--���� ��������� ���������� ������������ (internal_configuration)
set @type_of_vessel_internal_configuration_new_UFT = (select internal_configuration from inserted)
set @type_of_vessel_internal_configuration_old_UFT = (select internal_configuration from deleted)
if (@type_of_vessel_internal_configuration_new_UFT <> @type_of_vessel_internal_configuration_old_UFT)
    begin
	set @internal_configuration_boards_UFT = (select boards from internal_configuration where internal_configuration.ID = @type_of_vessel_internal_configuration_old_UFT)
	set @internal_configuration_compartments_UFT = (select compartments from internal_configuration where internal_configuration.ID = @type_of_vessel_internal_configuration_old_UFT)
	set @internal_configuration_double_bottom_UFT = (select double_bottom from internal_configuration where internal_configuration.ID = @type_of_vessel_internal_configuration_old_UFT)
	insert into internal_configuration(ID,boards,compartments,double_bottom) Values (@type_of_vessel_internal_configuration_new_UFT,@internal_configuration_boards_UFT,@internal_configuration_compartments_UFT,@internal_configuration_double_bottom_UFT)
	update type_of_vessel set internal_configuration = @type_of_vessel_internal_configuration_new_UFT where type_of_vessel.ID = (select ID from inserted)
	delete from internal_configuration where internal_configuration.ID = @type_of_vessel_internal_configuration_old_UFT
	end
--���� ��������� ����������� (capacity)
set @type_of_vessel_capacity_new_UTF = (select capacity from inserted)
set @type_of_vessel_capacity_old_UTF = (select capacity from deleted)
if (@type_of_vessel_capacity_new_UTF <> @type_of_vessel_capacity_old_UTF)
    begin
	update measures_of_boat set llength = @type_of_vessel_capacity_new_UTF where measures_of_boat.ID = (select measures_of_boat from inserted)
	update internal_configuration set compartments = @type_of_vessel_capacity_new_UTF*2 where internal_configuration.ID = (select internal_configuration from inserted)
	update type_of_vessel set capacity = @type_of_vessel_capacity_new_UTF where type_of_vessel.ID = (select ID from inserted)
	end
--���� ��������� ������� ������������ (external_complectation)
set @type_of_vessel_external_complectation_new_UTF = (select external_complectation from inserted)
set @type_of_vessel_external_complectation_old_UTF = (select external_complectation from deleted)
if (@type_of_vessel_external_complectation_new_UTF <> @type_of_vessel_external_complectation_old_UTF)
    begin
	set @external_complectation_boats_UTF = (select boats from external_complectation where external_complectation.ID = @type_of_vessel_external_complectation_old_UTF)
	set @external_complectation_lifting_crane_UTF = (select lifting_crane from external_complectation where external_complectation.ID = @type_of_vessel_external_complectation_old_UTF)
	insert into external_complectation(ID,lifting_crane,boats) Values (@type_of_vessel_external_complectation_new_UTF,@external_complectation_lifting_crane_UTF,@external_complectation_boats_UTF)
	update type_of_vessel set external_complectation = @type_of_vessel_external_complectation_new_UTF where type_of_vessel.ID = (select ID from inserted)
	delete from external_complectation where external_complectation.ID = @type_of_vessel_external_complectation_old_UTF
	end
--���� �������� ��� ��������� (engine_type)
set @type_of_vessel_engine_type_old_UTF = (select engine_type from deleted)
set @type_of_vessel_engine_type_new_UTF = (select engine_type from inserted)
if (@type_of_vessel_engine_type_new_UTF <> @type_of_vessel_engine_type_old_UTF)
    begin
	set @engine_type_fuel_type_UTF = (select fuel_type from engine_type where engine_type.ID = @type_of_vessel_engine_type_old_UTF)
	set @engine_type_speed_UTF = (select speed from engine_type where engine_type.ID = @type_of_vessel_engine_type_old_UTF)
	insert into engine_type(speed,ID,fuel_type) Values (@engine_type_speed_UTF,@type_of_vessel_engine_type_new_UTF,@engine_type_fuel_type_UTF)
	update type_of_vessel set engine_type = @type_of_vessel_engine_type_new_UTF where type_of_vessel.ID = (select ID from inserted)
	delete from engine_type where engine_type.ID = @type_of_vessel_engine_type_old_UTF
	end
end

go
--�����. ������ �������� � ����� ������� ����� ���������� ������
create trigger Auto_Volume_From_Length_Update on measures_of_boat
after update
as
declare @measures_of_boat_llength_new_AVFU int;
begin
set @measures_of_boat_llength_new_AVFU = (select llength from inserted)
update measures_of_boat set volume = @measures_of_boat_llength_new_AVFU * 3 where measures_of_boat.ID = (select ID from inserted)
end

go
--�����. ������ �������� � ����� ������� ����� ���������� ������
create trigger Auto_Volume_From_Length_Insert on measures_of_boat
after insert
as
declare @measures_of_boat_llength_new_AVFI int
begin
set @measures_of_boat_llength_new_AVFI = (select llength from inserted)
update measures_of_boat set volume = @measures_of_boat_llength_new_AVFI * 3 where measures_of_boat.ID = (select ID from inserted)
end

go

--������� ������ ������� ������� �� ���� ����� ����������
create trigger Parking_On_The_Way_Update on countries
instead of update
as
declare @countres_parking_lot_old int, @countres_parking_lot_new int, @Raznitsa int, @rangee_all_parking_times_POTU int;
begin
set @countres_parking_lot_new = (select parking_lot from inserted)
set @countres_parking_lot_old = (select parking_lot from deleted)
if (@countres_parking_lot_new <> @countres_parking_lot_old)
    begin
	update countries set parking_lot = @countres_parking_lot_new where countries.ID = (select ID from inserted)
	set @Raznitsa = (@countres_parking_lot_new - @countres_parking_lot_new)
	if (@Raznitsa > 0)
	    begin
		update rangee set all_parking_times = rangee.all_parking_times + @Raznitsa where rangee.ID = (select rangee from inserted)
		end
	else
	    begin
		set @rangee_all_parking_times_POTU = (select all_parking_times from rangee where rangee.ID = (select rangee from inserted))
		set @rangee_all_parking_times_POTU = @rangee_all_parking_times_POTU + @Raznitsa
		if (@rangee_all_parking_times_POTU < 0 or @rangee_all_parking_times_POTU = 0)
		    begin
			update rangee set all_parking_times = 0 where rangee.ID = (select ID from inserted)
			end
		else
		    begin
			update rangee set all_parking_times = @rangee_all_parking_times_POTU where rangee.ID = (select rangee from inserted)
			end
		end
	end
end

go

--������� ������ ������� ������� �� ���� ����� ����������
create trigger Parking_On_The_Way_Insert on countries
after insert
as
begin
update rangee set all_parking_times = rangee.all_parking_times + (select parking_lot from inserted) where rangee.ID = (select rangee from inserted)
end

go

--��������� ��������
Alter database morskie_gruzoperevozki set RECURSIVE_TRIGGERS OFF;
EXEC sp_configure 'nested_triggers','0';
ReconFigure;

--drop trigger Combin_Del
--drop trigger Adding_From_Type_Of_Vessel
--drop trigger Updating_From_Type_Of_Vessel
--drop trigger Auto_Volume_From_Length_Update
--drop trigger Auto_Volume_From_Length_Insert
--drop trigger Parking_On_The_Way_Update
--drop trigger Parking_On_The_Way_Insert

go

--������� ���������� ������ ������ "��� �����"(����� ������ �� ���������� ID) + "���������� �����" (��������������� ������) + "���������� ������������" (��������������� ������) + "������� ������������" (�������������� ������) +
--+ "��� ���������" (��������������� ������) � "������������� �����" , ��� ����� ��� ������ ��������������� ����� � ��������� ID
--����������(���_�����_ID + ���_�����.����������� + ����������_�����.����� + ����������_�����.����� +
-- + ����������_������������.������ + �������_������������.���������_���� + �������_������������.������ + ���_���������.�������� + �������������_�����.�� ���� �����)
create function Connection(@ID_type_of_vessel_CC int)
returns @Rez table
(
ID_type_of_vessel int not null,
capacity_type_of_vessel int,
llength_measures_of_boat int not null,
volume_measures_of_boat int not null,
compartments_internal_configuration int,
lifting_crane_external_complectation int,
boats_external_complectation int,
speed_engine_type int,
by_type_of_cargo_classification_of_vessels nchar(40)
)
as
begin
insert into @Rez(ID_type_of_vessel,capacity_type_of_vessel,llength_measures_of_boat,volume_measures_of_boat,compartments_internal_configuration,lifting_crane_external_complectation,boats_external_complectation,speed_engine_type,by_type_of_cargo_classification_of_vessels)
select 
    (select ID from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC),
	(select capacity from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC),
	(select llength from measures_of_boat where measures_of_boat.ID = (select measures_of_boat from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	(select volume from measures_of_boat where measures_of_boat.ID = (select measures_of_boat from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	(select compartments from internal_configuration where internal_configuration.ID = (select internal_configuration from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	(select lifting_crane from external_complectation where external_complectation.ID = (select external_complectation from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	(select boats from external_complectation where external_complectation.ID = (select external_complectation from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	(select speed from engine_type where engine_type.ID = (select engine_type from type_of_vessel where type_of_vessel.ID = @ID_type_of_vessel_CC)),
	classification_of_vessels.by_type_of_cargo from classification_of_vessels where classification_of_vessels.type_of_vessel = @ID_type_of_vessel_CC;
return
end

go

--������ ������� �� ��������� ��������� ������ � �������������� ������� ������� ��� ������������ ����������� ������ ���������� ������
create function Type_Of_Vessel_From_Ship_Modification_Options(@SMTH_nchar nchar(60))
returns @Rez table
(
ID_ship_modification_options int not null,
on_technical_innovations_ship_modification_options nchar (60),
demand_ship_modification_options int,
proposal_ship_modification_options int,
ID_type_of_vessel int,
capacity_type_of_vessel int,
serial_number int
)
as
begin
declare @ID_s_m_o int;
set @ID_s_m_o = (select min(ID) from ship_modification_options where ship_modification_options.on_technical_innovations like @SMTH_nchar)
insert into @Rez(ID_ship_modification_options,on_technical_innovations_ship_modification_options,demand_ship_modification_options,proposal_ship_modification_options,ID_type_of_vessel,capacity_type_of_vessel,serial_number)
select 
    (select ID from ship_modification_options where ship_modification_options.ID = @ID_s_m_o),
	(select on_technical_innovations from ship_modification_options where ship_modification_options.ID = @ID_s_m_o),
	(select demand from ship_modification_options where ship_modification_options.ID = @ID_s_m_o),
	(select proposal from ship_modification_options where ship_modification_options.ID = @ID_s_m_o),
	type_of_vessel.ID,
	type_of_vessel.capacity,
	Row_Number() Over(Order by type_of_vessel.ID) As serial_number
	from type_of_vessel where type_of_vessel.ship_modification_options = @ID_s_m_o;
return
end

go

--������ ������� �� ��������� ������� ���������� ���� ������ (engine_type.fuel_type)
create function Type_Of_Vessel_From_Engine_Type (@SMTH_nchar_two nchar(20))
returns @Rez table
(
fuel_type_engine_type nchar(20),
ID_type_of_vessel int not null,
capacity_type_of_vessel int,
speed_engine_type int,
llength_measures_of_boat int not null,
volume_measures_of_boat int not null,
compartments_internal_configuration int,
lifting_crane_external_complectation int,
boats_external_complectation int
)
as
begin
declare @ID_e_t int;
set @ID_e_t = (select min(ID) from engine_type where engine_type.fuel_type like @SMTH_nchar_two)
insert into @Rez(fuel_type_engine_type,ID_type_of_vessel,capacity_type_of_vessel,speed_engine_type,llength_measures_of_boat,volume_measures_of_boat,compartments_internal_configuration,lifting_crane_external_complectation,boats_external_complectation)
select
    (select fuel_type from engine_type where engine_type.ID = @ID_e_t),
	(select ID from type_of_vessel where type_of_vessel.engine_type = @ID_e_t),
	(select capacity from type_of_vessel where type_of_vessel.engine_type = @ID_e_t),
	(select speed from engine_type where engine_type.ID = @ID_e_t),
	(select llength from measures_of_boat where measures_of_boat.ID = (select measures_of_boat from type_of_vessel where type_of_vessel.engine_type = @ID_e_t)),
	(select volume from measures_of_boat where measures_of_boat.ID = (select measures_of_boat from type_of_vessel where type_of_vessel.engine_type = @ID_e_t)),
	(select compartments from internal_configuration where internal_configuration.ID = (select internal_configuration from type_of_vessel where type_of_vessel.engine_type = @ID_e_t)),
	(select lifting_crane from external_complectation where external_complectation.ID = (select external_complectation from type_of_vessel where type_of_vessel.engine_type = @ID_e_t)),
	(select boats from external_complectation where external_complectation.ID = (select external_complectation from type_of_vessel where type_of_vessel.engine_type = @ID_e_t))
return
end

go

create procedure Zam_from_ID(@ID_ship_modification_options_old int, @ID_ship_modification_options_new int)
as
declare @on_technical_innovations_ship_modification_options nchar(60), @demand_ship_modification_options int, @proposal_ship_modification_options int,
@SUMMA_VSEH int, @schet int;
begin
if exists (select ID from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old)
    begin
	if exists (select ID from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_new)
	    begin
		print ('� ���� ������ ��� ���������� "��������� ����������� �����" � ��� ID, �� ������� ������ ��������')
		end 
	else
	    begin
		set @on_technical_innovations_ship_modification_options = (select on_technical_innovations from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old)
	    set @demand_ship_modification_options = (select demand from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old)
	    set @proposal_ship_modification_options = (select proposal from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old)
	    insert into ship_modification_options(ID,on_technical_innovations,demand,proposal) Values (@ID_ship_modification_options_new,@on_technical_innovations_ship_modification_options,@demand_ship_modification_options,@proposal_ship_modification_options)
		set @SUMMA_VSEH = (select COUNT(*) from type_of_vessel)
		set @schet = 0
		while (@schet <> @SUMMA_VSEH)
		    begin
			if ((select ship_modification_options from type_of_vessel where type_of_vessel.ID = @schet + 1) = @ID_ship_modification_options_old)
			    begin
				update type_of_vessel set ship_modification_options = @ID_ship_modification_options_new where type_of_vessel.ID = @schet + 1
				end
			set @schet = @schet + 1
			end
		update type_of_vessel set ship_modification_options = @ID_ship_modification_options_new where type_of_vessel.ship_modification_options in (select ID from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old)
		delete from ship_modification_options where ship_modification_options.ID = @ID_ship_modification_options_old
		end
	end
else
    print ('� ���� ������ �� ���������� "��������� ����������� �����" � ��� ID, ������� ������ ��������')
end


--drop function Connection
--drop function Type_Of_Vessel_From_Ship_Modification_Options
--drop function Type_Of_Vessel_From_Engine_Type
--drop procedure Zam_from_ID
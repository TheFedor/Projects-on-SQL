--create database stoimost_arendi_salona_v_zavisimosti_ot

use stoimost_arendi_salona_v_zavisimosti_ot;
--DDL - группа от языка SQL (create, alter, drop)

--создаем таблицы только с PK в любом порядке 

--арендодатель
create table landlord(
	year_of_birth int default 0,
	FIO nchar(40) default 0,
	working_hours_from int default 0,
	working_hours_to int default 0,
	ID int not null Primary key
);

--район
create table district(
	population_of_the_district int not null,
	number_of_attractions int default 0,
	ID int not null Primary key,
	number_of_buildings_with_salons_in_the_one_district int not null
);

--создаем таблицы с PK и FK в правильном порядке

--здание
create table building(
	numbre_of_floors int default 0,
	district int not null,
	Foreign key (district) References district (ID),
	ID int not null Primary key,
	number_of_salons_in_one_building int not null
);

--помещение
create table spacee(
	number_of_rooms int not null,
	size_of_space int not null,
	ID int not null Primary key,
	building int not null,
	Foreign key (building) References building (ID),
	how_many_people_lived_in_this_space_until_it_became_a_salon int not null
);

--создаем таблицы только с FK в любом порядке

--данные по договору
create table infoarmation_about_treaty(
	FIO_of_layer nchar(40) default 0,
	company_name nchar(40) default 0,
	prise int not null,
	landlord int not null,
	Foreign key (landlord) References landlord (ID)
);

--условия аренды
create table rental_conditions(
	the_possibility_of_reconstructing_the_space int default 1,
	price_for_one_manth int not null,
	rental_period_in_month int default 1,
	landlord int not null,
	Foreign key (landlord) References landlord (ID),
	spacee int not null,
	Foreign key (spacee) References spacee (ID),
	possibility_of_changing_the_rental_price int not null,
	price_for_one_year int 
);

--расположение
create table locationn(
	street nchar(20) not null,
	number_of_building int not null,
	sity nchar(20) not null,
	distance_to_the_city_center int not null,
	building int not null,
	Foreign key (building) References building (ID)
);

--ближайшее метро
create table nearest_metro(
	name_of_station nchar(20) not null,
	distance_to_the_metro_in_meters int not null,
	name_of_line nchar(30) not null,
	building int not null,
	Foreign key (building) References building (ID)
)

insert into landlord (year_of_birth,FIO,working_hours_from,working_hours_to,ID)
Values
(1967,'Петренко Дмитрий Андреевич',9,18,1),
(1991,'Захаров Артур Эдуардович',8,18,2),
(1987,'Кряшин Даниил Петрович',9,17,3),
(1985,'Крючев Сергей Владимирович',8,17,4),
(1976,'Иванова Наталья Павловна',8,18,5),
(1971,'Накимова Анна Олеговна',7,18,6),
(1972,'Лещюк Генадий Гаврилович',8,17,7),
(1973,'Бездырь Николай Степанович',7,19,8);

insert into district (population_of_the_district,number_of_attractions,ID,number_of_buildings_with_salons_in_the_one_district)
Values
(13894,4,1,1),
(8473,1,2,1),
(21937,0,3,1),
(15276,2,4,1),
(14307,4,5,1),
(12253,2,6,1);

insert into building (numbre_of_floors,district,ID,number_of_salons_in_one_building)
Values
(5,1,1,1),
(4,2,2,1),
(3,3,3,2),
(4,4,4,1),
(10,5,5,2),
(9,6,6,1);

insert into spacee (number_of_rooms,size_of_space,ID,building,how_many_people_lived_in_this_space_until_it_became_a_salon)
Values
(6,50,1,1,4),
(5,40,2,2,4),
(4,30,3,3,2),
(3,35,4,3,2),
(5,42,5,4,4),
(3,34,6,5,2),
(4,36,7,5,3),
(7,63,8,6,6);

insert into infoarmation_about_treaty (prise,landlord)
Values
(15000,1),
(20000,2),
(10000,3),
(17000,4),
(14000,5),
(18000,6),
(18888,7),
(25000,8);

insert into rental_conditions (price_for_one_manth,rental_period_in_month,landlord,spacee,possibility_of_changing_the_rental_price,price_for_one_year)
Values
(50000,1,1,1,1,600000),
(40000,1,2,2,0,480000),
(50000,1,2,2,1,600000),
(45000,1,3,3,1,540000),
(42000,1,4,4,1,504000),
(48000,1,5,5,0,576000),
(41000,1,6,6,1,492000),
(41500,1,7,7,0,498000),
(60000,1,8,8,0,720000);

insert into locationn (street,number_of_building,sity,distance_to_the_city_center,building)
Values
('Уральская',2,'Санкт-Питербург',2,1),
('Сретенка',23,'Москва',2,2),
('Долгоруковская',5,'Москва',6,3),
('Жукова',3,'Санкт-Питербург',5,4),
('Баумана',26,'Казань',3,5),
('Чистопольская',4,'Казань',5,6);

insert into nearest_metro (name_of_station,distance_to_the_metro_in_meters,name_of_line,building)
Values
('Приморская',1276,'Невско-Василеостровская',1),
('Сухаревская',1354,'Калужско-рижская',2),
('Новослободская',1127,'Кольцевая',3),
('Чернышевская',3051,'Кировско-Выборгская',4),
('Кремлёвская',1172,'Центральная линия',5),
('Козья Слобода',1893,'Центральная линия',6);

select * from district;
select * from building;
select * from locationn;
select * from nearest_metro;
select * from spacee;
select * from rental_conditions;
select * from landlord;
select * from infoarmation_about_treaty;

go

--если удаляем помещениt, то удаляем все данные об этом помещении из таблицы (галочка), корректируем популяцию района (крестик)
create trigger deleting_space_data on spacee
instead of delete
as 
declare @spacee_ID int, @spacee_buildingID int, @number_of_the_salons_building int, @number_of_the_buildings int, @building_district_ID int,
@district_population_of_the_district int, @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon int;
begin
set @spacee_ID = (select ID from deleted);
set @spacee_buildingID = (select building from spacee where spacee.ID = @spacee_ID);
set @number_of_the_salons_building = (select number_of_salons_in_one_building from building where building.ID = @spacee_buildingID);
set @building_district_ID = (select district from building where building.ID = @spacee_buildingID);
set @number_of_the_buildings = (select number_of_buildings_with_salons_in_the_one_district from district where district.ID = @building_district_ID);

--меняем заселенность района
set @district_population_of_the_district = (select population_of_the_district from district where district.ID = @building_district_ID);
set @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon = (select how_many_people_lived_in_this_space_until_it_became_a_salon from spacee where spacee.ID = @spacee_ID);
update district set population_of_the_district = @district_population_of_the_district + @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon where district.ID = @building_district_ID;

delete from rental_conditions where rental_conditions.spacee = @spacee_ID;
delete from infoarmation_about_treaty where infoarmation_about_treaty.landlord = @spacee_ID;
delete from spacee where spacee.ID = @spacee_ID;
delete from landlord where landlord.ID = @spacee_ID;

--если число салонов в однм здании было больше оного, то информацию о здании не удаляем
if (@number_of_the_salons_building > 1)
    begin
    update building set number_of_salons_in_one_building = building.number_of_salons_in_one_building - 1 where building.ID = @spacee_buildingID;
    end;
--если число салонов в здании было равно одному, то удаляем информацию о здании
if (@number_of_the_salons_building = 1)
    begin
	delete from nearest_metro where nearest_metro.building = @spacee_buildingID;
	delete from locationn where locationn.building = @spacee_buildingID;
	delete from building where building.ID = @spacee_buildingID;
	--если число зданий с салонами в районе было больше одного, то не удаляем информацию о районе
	if (@number_of_the_buildings > 1)
        begin
	    update district set number_of_buildings_with_salons_in_the_one_district = district.number_of_buildings_with_salons_in_the_one_district - 1 where district.ID = @building_district_ID;
	    end;
	--если число зданий с салонами в районе было равно одному и удаляем здание, то удаляем информацию о районе
    if (@number_of_the_buildings = 1)
        begin
	    delete from district where district.ID = @building_district_ID;
	    end;
	end;
end

go

--после получения данных о новом салоне, расположенном в одном из зданий, заполняем информацию о нем пустыми значениями (галочка)
create trigger cascading_data_addition_for_a_new_space on spacee
instead of insert
as declare @spacee_IDD int, @spacee_number_of_roomss int, @spacee_size_of_spacee int, @spacee_buildingg int, @spacee_how_many_people_lived_in_this_space_until_it_became_a_salonn int;
begin
set @spacee_IDD = (select ID from inserted);
set @spacee_number_of_roomss = (select number_of_rooms from inserted);
set @spacee_size_of_spacee = (select size_of_space from inserted);
set @spacee_buildingg = (select building from inserted);
set @spacee_how_many_people_lived_in_this_space_until_it_became_a_salonn = (select how_many_people_lived_in_this_space_until_it_became_a_salon from inserted);
insert into landlord(ID) Values (@spacee_IDD);
insert into spacee(number_of_rooms,size_of_space,ID,building,how_many_people_lived_in_this_space_until_it_became_a_salon) Values (@spacee_number_of_roomss,@spacee_size_of_spacee,@spacee_IDD,@spacee_buildingg,@spacee_how_many_people_lived_in_this_space_until_it_became_a_salonn);
insert into rental_conditions(price_for_one_manth,rental_period_in_month,landlord,spacee,possibility_of_changing_the_rental_price,price_for_one_year) Values (0,0,@spacee_IDD,@spacee_IDD,0,0);
insert into infoarmation_about_treaty(prise,landlord) Values (0,@spacee_IDD);
--апдейтнуть буилдинг на увеличение на один салон
update building set number_of_salons_in_one_building = building.number_of_salons_in_one_building + 1 where building.ID = @spacee_buildingg;
end

go

--производит подсчет в связанных таблицах при добавлении нового салона (галочка)
create trigger calculations_after_adding_data on spacee
after insert
as
declare @sp_peop int, @sp_bu_ID int, @bu_di_ID int, @di_po int;
begin
set @sp_bu_ID = (select building from inserted);
set @sp_peop = (select how_many_people_lived_in_this_space_until_it_became_a_salon from inserted);
set @bu_di_ID = (select district from building where building.ID = @sp_bu_ID);
set @di_po = (select population_of_the_district from district where district.ID = @bu_di_ID);
update district set population_of_the_district = @di_po - @sp_peop where district.ID = @bu_di_ID;
end

go

--арифметические расчеты в таблице rental_conditions при добавлении новых данных
create trigger arithmetic_calculations_in_one_table_when_data_adding on rental_conditions
after insert
as
declare @renta_condi_prise_one_monthe int, @r_id int;
begin
set @renta_condi_prise_one_monthe = (select price_for_one_manth from inserted);
set @r_id = (select spacee from inserted);
update rental_conditions set price_for_one_year = @renta_condi_prise_one_monthe * 12 where rental_conditions.spacee = @r_id;
end

go

--арифметические расчеты в одной таблице при изменении данных
create trigger arithmetic_calculations_in_one_table_when_data_changes on rental_conditions
after update
as
declare @rental_conditions_prise_month int, @rental_conditions_ID_RK int;
begin
set @rental_conditions_prise_month = (select price_for_one_manth from inserted);
set @rental_conditions_ID_RK = (select spacee from inserted);
update rental_conditions set price_for_one_year = @rental_conditions_prise_month * 12 where rental_conditions.spacee = @rental_conditions_ID_RK;
end;

go

--комплексный подсчет изменяемых значений в связанных таблицах
create trigger calculations_after_data_changes on spacee
instead of update
as
--если меняем number_of_rooms
declare @spasee_ID_S int, @spasee_number_of_rooms_old_S int, @spacee_number_of_rooms_new_S int, @rental_conditions_possibility_of_changing_the_rental_price_S int, @rental_conditions_prise_S int, @dop int,
--если меняем size_of_space
@spacee_ID_SE int, @spacee_size_of_space_old_SE int, @spacee_size_of_space_new_SE int,
--если меняем число людей, которые жили в этом помещении до того как оно стало салоном
@spacee_ID_SEC int, @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE int, @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE int,
@spacee_building_SEC int, @building_district_SEC int, @district_population_of_the_district_SEC int,
--если меняем building
@spacee_ID_SECO int, @spacee_building_old_SECO int, @spacee_building_new_SECO int, @building_district_old_SECO int, @building_district_new_SECO int,
@building_number_of_salons_in_one_building_new_SECO int, @building_number_of_salons_in_one_building_old_SECO int,
@district_population_of_the_district_new_SECO int, @district_population_of_the_district_old_SECO int, @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_SECO int,
@district_number_of_buildings_with_salons_in_the_one_district_old_SECO int;
begin
--если меняем number of rooms
set @spasee_ID_S = (select ID from inserted);
set @spacee_number_of_rooms_new_S = (select number_of_rooms from inserted);
set @spasee_number_of_rooms_old_S = (select number_of_rooms from deleted);
if (@spacee_number_of_rooms_new_S <> @spasee_number_of_rooms_old_S)
    begin
	update spacee set number_of_rooms = @spacee_number_of_rooms_new_S where spacee.ID = @spasee_ID_S;
	end;
--если меняем size_of_space
set @spacee_ID_SE = (select ID from inserted);
set @spacee_size_of_space_new_SE = (select size_of_space from inserted);
set @spacee_size_of_space_old_SE = (select size_of_space from deleted);
if (@spacee_size_of_space_new_SE <> @spacee_size_of_space_old_SE)
    begin
	update spacee set size_of_space = @spacee_size_of_space_new_SE where spacee.ID = @spacee_ID_SE;
	end;
--если меняем how_many_people_lived_in_this_space_until_it_became_a_salon
set @spacee_ID_SEC = (select ID from inserted);
set @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE = (select how_many_people_lived_in_this_space_until_it_became_a_salon from inserted);
set @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE = (select how_many_people_lived_in_this_space_until_it_became_a_salon from deleted);
if (@spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE <> @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE)
    begin
	set @spacee_building_SEC = (select building from inserted);
	set @building_district_SEC = (select district from building where building.ID = @spacee_building_SEC);
	set @district_population_of_the_district_SEC = (select population_of_the_district from district where district.ID = @building_district_SEC);
	if (@spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE - @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE > 0)
	    begin
		update district set population_of_the_district = district.population_of_the_district - (@spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE - @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE) where district.ID = @building_district_SEC;
		end;
	if (@spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE - @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE > 0)
	    begin
		update district set population_of_the_district = district.population_of_the_district + (@spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_old_SE - @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE) where district.ID = @building_district_SEC;
		end;
    update spacee set how_many_people_lived_in_this_space_until_it_became_a_salon = @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_new_SE where spacee.ID = @spacee_ID_SEC;
	end;
--если поменяли building
set @spacee_ID_SECO = (select ID from inserted);
set @spacee_building_new_SECO = (select building from inserted);
set @spacee_building_old_SECO = (select building from deleted);
if (@spacee_building_new_SECO <> @spacee_building_old_SECO)
    begin
	update spacee set building = @spacee_building_new_SECO where spacee.ID = @spacee_ID_SECO;
	--работаем с новым зданием
	set @building_number_of_salons_in_one_building_new_SECO = (select number_of_salons_in_one_building from building where building.ID = @spacee_building_new_SECO);
	update building set number_of_salons_in_one_building = @building_number_of_salons_in_one_building_new_SECO + 1 where building.ID = @spacee_building_new_SECO;
	--работаем с новым районом
	set @building_district_new_SECO = (select district from building where building.ID = @spacee_building_new_SECO);
	set @district_population_of_the_district_new_SECO = (select population_of_the_district from district where district.ID = @building_district_new_SECO);
	set @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_SECO = (select how_many_people_lived_in_this_space_until_it_became_a_salon from spacee where spacee.ID = @spacee_ID_SECO);
	update district set population_of_the_district = @district_population_of_the_district_new_SECO - @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_SECO where district.ID = @building_district_new_SECO;
	--получаем доступ к старому району и старому зданию
	set @building_district_old_SECO = (select district from building where building.ID = @spacee_building_old_SECO);
	set @district_population_of_the_district_old_SECO = (select population_of_the_district from district where district.ID = @building_district_old_SECO);
	set @building_number_of_salons_in_one_building_old_SECO = (select number_of_salons_in_one_building from building where building.ID = @spacee_building_old_SECO);
	--работаем со старым зданием
	if (@building_number_of_salons_in_one_building_old_SECO > 1)
	    begin
		update building set number_of_salons_in_one_building = @building_number_of_salons_in_one_building_old_SECO - 1 where building.ID = @spacee_building_old_SECO;
		update district set population_of_the_district = @district_population_of_the_district_old_SECO + @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_SECO where district.ID = @building_district_old_SECO;
		end
    if (@building_number_of_salons_in_one_building_old_SECO = 1)
	    begin
		set @district_number_of_buildings_with_salons_in_the_one_district_old_SECO = (select number_of_buildings_with_salons_in_the_one_district from district where district.ID = @building_district_old_SECO);
		delete from nearest_metro where nearest_metro.building = @spacee_building_old_SECO;
	    delete from locationn where locationn.building = @spacee_building_old_SECO;
		delete from building where building.ID = @spacee_building_old_SECO;
		if (@district_number_of_buildings_with_salons_in_the_one_district_old_SECO = 1)
		    begin
			delete from district where district.ID = @building_district_old_SECO;
			end;
		if (@district_number_of_buildings_with_salons_in_the_one_district_old_SECO > 1)
		    begin
			--меняем популяцию и число зданий с салонами в этом районе
			update district set number_of_buildings_with_salons_in_the_one_district = @district_number_of_buildings_with_salons_in_the_one_district_old_SECO - 1 where district.ID = @building_district_old_SECO;
			update district set population_of_the_district = @district_population_of_the_district_old_SECO + @spacee_how_many_people_lived_in_this_space_until_it_became_a_salon_SECO where district.ID = @building_district_old_SECO;
			end;
		end
	end;

end

go

--отключаем рекурсию
Alter database stoimost_arendi_salona_v_zavisimosti_ot set RECURSIVE_TRIGGERS OFF;
EXEC sp_configure 'nested_triggers','0';
ReconFigure;

--drop trigger deleting_space_data
--drop trigger cascading_data_addition_for_a_new_space
--drop trigger calculations_after_adding_data
--drop trigger calculations_after_data_changes
--drop trigger arithmetic_calculations_in_one_table_when_data_changes
--drop trigger arithmetic_calculations_in_one_table_when_data_adding

go

--(1)update данных в связанных таблицах locationn и nearest_metro (меняет местами данные (nearest_metro и location) с 
--(nearest_metro и locationn) у старого building и нового building). По строкам таблиц nearest_metro и locationn видно что для каждого здания будет прописана своя локация и свое ближайшее метро
create procedure Zamena (@locationn_ID_one int, @locationn_ID_two int)
as
declare @locationn_street_PFone nchar(20), @locationn_number_of_building_PFone int, @locationn_sity_PFone nchar(20),
@nearest_metro_name_of_station_PFone nchar(20), @nearest_metro_distance_to_the_metro_PFone int, @nearest_metro_name_of_line_PFone nchar(30);
begin
if exists (select building from locationn where locationn.building = @locationn_ID_one)
    begin
	if exists (select building from locationn where locationn.building = @locationn_ID_two)
	    begin
		set @locationn_street_PFone = (select street from locationn where locationn.building = @locationn_ID_one);
        set @locationn_number_of_building_PFone = (select number_of_building from locationn where locationn.building = @locationn_ID_one);
        set @locationn_sity_PFone = (select sity from locationn where locationn.building = @locationn_ID_one);
        update locationn set building = @locationn_ID_one where locationn.building = @locationn_ID_two;
        update locationn set building = @locationn_ID_two where (locationn.street = @locationn_street_PFone and locationn.number_of_building = @locationn_number_of_building_PFone and locationn.sity = @locationn_sity_PFone);
        set @nearest_metro_name_of_station_PFone = (select name_of_station from nearest_metro where nearest_metro.building = @locationn_ID_one);
        set @nearest_metro_distance_to_the_metro_PFone = (select distance_to_the_metro_in_meters from nearest_metro where nearest_metro.building = @locationn_ID_one);
        set @nearest_metro_name_of_line_PFone = (select name_of_line from nearest_metro where nearest_metro.building = @locationn_ID_one);
        update nearest_metro set building = @locationn_ID_one where nearest_metro.building = @locationn_ID_two;
        update nearest_metro set building = @locationn_ID_two where (nearest_metro.name_of_station = @nearest_metro_name_of_station_PFone and nearest_metro.distance_to_the_metro_in_meters = @nearest_metro_distance_to_the_metro_PFone and nearest_metro.name_of_line = @nearest_metro_name_of_line_PFone);			
		print ('расположение и ближайшее метро у двух зданий с введенным ID их локаций успешно поменялись местами')
		end
    else 
	    print ('В БД не существует здания со вторым введенным ID, а следовательно и салона и ближайшего метро этого здания')
	end
else
    print ('В БД не существует здания с первым введенным ID, а следовательно и салона и ближайшего метро этого здания')
end

go

--(2) выводит объединенные данные по таблицым spacee и landlord (spacee.ID + spacee.size_of_space + spacee.number_of_rooms + landlord.FIO + lanlord.year_of_birth + landlord.ID)
create function Сombining()
returns @Itog_two table
(
ID_from_spacee int not null,
FIO_from_landlord nchar(40) not null,
year_of_birth_from_landlord int,
number_of_rooms_from_spacee int not null,
size_of_space_from_spacee int not null
)
as
begin
insert into @Itog_two(ID_from_spacee,FIO_from_landlord,year_of_birth_from_landlord,number_of_rooms_from_spacee,size_of_space_from_spacee)
select
    spacee.ID,
	(select FIO from landlord where landlord.ID = spacee.ID),
	(select year_of_birth from landlord where landlord.ID = spacee.ID),
	spacee.number_of_rooms,
	spacee.size_of_space
	from spacee
return
end

go

--(5) выводит все условия аренды для арендадателя, которые находит по ФИО арендодателя
create function Rent_From_The_Landlord(@FIO_ID_landlord_five nchar(40))
returns @Itog_five table
(
ID_from_landlord int not null,
FIO_from_landlord nchar(40),
year_of_birth_from_landlord int,
the_possibility_from_rental_conditions int, 
price_for_one_manth_from_rental_conditions int not null,
rental_period_in_month_from_rental_conditions int,
possibility_of_changing_the_rental_price int not null,
price_for_one_year_from_rental_conditions int
)
as
begin
set @FIO_ID_landlord_five = (select min(ID) from landlord where landlord.FIO = @FIO_ID_landlord_five);
insert into @Itog_five(ID_from_landlord,FIO_from_landlord,year_of_birth_from_landlord,the_possibility_from_rental_conditions,price_for_one_manth_from_rental_conditions,rental_period_in_month_from_rental_conditions,possibility_of_changing_the_rental_price,price_for_one_year_from_rental_conditions)
select
    (select ID from landlord where landlord.ID = @FIO_ID_landlord_five),
	(select FIO from landlord where landlord.ID = @FIO_ID_landlord_five),
	(select year_of_birth from landlord where landlord.ID = @FIO_ID_landlord_five),
    rental_conditions.the_possibility_of_reconstructing_the_space,
	rental_conditions.price_for_one_manth,
	rental_conditions.rental_period_in_month,
	rental_conditions.possibility_of_changing_the_rental_price,
	rental_conditions.price_for_one_year from rental_conditions where rental_conditions.landlord = @FIO_ID_landlord_five;
return
end

--drop procedure Zamena
--drop function Сombining
--drop function Rent_From_The_Landlord
--create database dostavka_tovara_na_sklad
use dostavka_tovara_na_sklad

create table sklad
(
adres nchar(100) not null,
vmestimost_chislo int not null,
nazvanie_sklada nchar(100),
ID int not null Primary key
)

create table postavshiki
(
nazvanie_kompanii nchar(100) not null,
gorod_postavki nchar(100) not null,
spetsializatsiya nchar(100),
ID int not null Primary key
)

create table vidi_tovara
(
nazvanie_tovara nchar(100) not null,
obiem_tovara int,
ID int not null Primary key
)

create table sposobi_dostavki
(
vid_dostavki nchar(100) not null,
vremia_dostavki_chasi int not null,
ID int not null Primary key
)

create table Zakazi_postavki
(
postavshiki int not null,
Foreign key (postavshiki) References postavshiki (ID),
vidi_tovara int not null,
Foreign key (vidi_tovara) References vidi_tovara (ID),
kolichestvo int not null,
tsena_zakaza int not null,
sklad int not null,
Foreign key (sklad) References sklad (ID),
sposobi_dostavki int not null,
Foreign key (sposobi_dostavki) References sposobi_dostavki (ID)
)

create table tovari_na_skladah
(
vidi_tovara int not null,
Foreign key (vidi_tovara) References vidi_tovara (ID),
kolichestvo int not null,
sklad int not null,
Foreign key (sklad) References sklad (ID)
)

Insert into sklad(adres,vmestimost_chislo,ID)
Values
('Россия, Москва, Проспект 60-летия октября 11',200,1),
('Россия, Санкт-Питербург, 15-я линия Васильевского острова 4', 1000, 2),
('Россия, Казань, ул.Космонавтов 33', 900, 3)

Insert into postavshiki(nazvanie_kompanii,gorod_postavki,ID)
Values
('Поставщик №1', 'Москва', 1),
('POZITRON', 'Москва', 2),
('KARMA', 'Москва', 3)

Insert into vidi_tovara(nazvanie_tovara,obiem_tovara,ID)
Values
('Рыба', 100, 1),
('Озонаторы воздуха', 50, 2),
('бактерицидные рециркуляторы', 30, 3)

Insert into sposobi_dostavki(vid_dostavki,vremia_dostavki_chasi,ID)
Values
('Грузовой транспорт', 12, 1),
('Поезд', 48, 2),
('Самолет', 48, 3)

Insert into Zakazi_postavki(postavshiki,vidi_tovara,kolichestvo,tsena_zakaza,sklad,sposobi_dostavki)
Values
(1,1,200,2000000,1,1),
(2,2,30,60000,2,2),
(3,3,30,110000,3,3)

Insert into tovari_na_skladah(vidi_tovara,kolichestvo,sklad)
Values
(1,200,1),
(2,40,2),
(3,100,3)

select * from sklad
select * from postavshiki
select * from vidi_tovara
select * from sposobi_dostavki
select * from Zakazi_postavki
select * from tovari_na_skladah

go

create function Obrabotca_stroki(@SMTH_nchar nchar(100))
returns @Rezultat table
(
ID_t int not null,
nazvanie_kompanii_t nchar(100),
gorod_postavki_t nchar(100) not null,
kolichestvo_z_p int not null,
tsena_zakaza_z_p int not null
)
as
begin
declare @ID_SMTH_nchar int;
set @ID_SMTH_nchar = (select ID from postavshiki where postavshiki.nazvanie_kompanii like @SMTH_nchar)
insert into @Rezultat(ID_t,nazvanie_kompanii_t,gorod_postavki_t,kolichestvo_z_p,tsena_zakaza_z_p)
select 
    (select ID from postavshiki where postavshiki.ID = @ID_SMTH_nchar),
	(select nazvanie_kompanii from postavshiki where postavshiki.ID = @ID_SMTH_nchar),
	(select gorod_postavki from postavshiki where postavshiki.ID = @ID_SMTH_nchar),
	Zakazi_postavki.kolichestvo,
	Zakazi_postavki.tsena_zakaza from Zakazi_postavki where Zakazi_postavki.postavshiki = @ID_SMTH_nchar
return
end

go

create procedure Vstavka(@nazvanie_kompanii_s nchar(100), @gorod_postavki_s nchar(100),@ID_s int,@kolichestvo_s int,@tsena_zakaza int, @vidi_tovara_ID int,@sklad_ID int,@sposobi_dostavki_ID int)
as
begin
insert into postavshiki(nazvanie_kompanii,gorod_postavki,ID)
Values
(@nazvanie_kompanii_s,@gorod_postavki_s,@ID_s)
insert into Zakazi_postavki(postavshiki,vidi_tovara,kolichestvo,tsena_zakaza,sklad,sposobi_dostavki)
Values
(@ID_s,@vidi_tovara_ID,@kolichestvo_s,@tsena_zakaza,@sklad_ID,@sposobi_dostavki_ID)
end

go

create trigger Colvo_Zakazov on Zakazi_postavki
after update
as
declare @Schet_chisla_zakazov int;
begin
set @Schet_chisla_zakazov = (select COUNT(*) from Zakazi_postavki)
print ('Общее число заказов: ')
print (@Schet_chisla_zakazov)
end

go

create trigger Colvo_Zakazov_2 on Zakazi_postavki
after insert
as
declare @Schet_chisla_zakazov int;
begin
set @Schet_chisla_zakazov = (select COUNT(*) from Zakazi_postavki)
print ('Общее число заказов: ')
print (@Schet_chisla_zakazov)
end

go

create trigger Colvo_Zakazov_2 on Zakazi_postavki
after delete
as
declare @Schet_chisla_zakazov int;
begin
set @Schet_chisla_zakazov = (select COUNT(*) from Zakazi_postavki)
print ('Общее число заказов: ')
print (@Schet_chisla_zakazov)
end
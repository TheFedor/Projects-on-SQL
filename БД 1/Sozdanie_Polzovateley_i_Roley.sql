use stoimost_arendi_salona_v_zavisimosti_ot
--������� ����
--���� ������������

create role LandLord;
--���� �����������
create role Observer;
--���� ��������� 
create role Editor;

go

create login User1 with password = '12345A'
create login User2 with password = '123B'
create login User3 with password = '1234578C'

go

--������� �������������
create user UserA for login User1;
create user UserB for login User2;
create user UserC for login User3;
--��������� ������������� � ����
go

alter role LandLord add member UserA;
alter role Observer add member UserB;
alter role Editor add member UserC;

go

--������������� ���� �����
grant select on landlord to LandLord;
grant select on rental_conditions to LandLord;
grant select on infoarmation_about_treaty to LandLord;
grant select on spacee to LandLord;
grant select on building to LandLord;
grant select on locationn to LandLord;
grant select on nearest_metro to LandLord;
grant select on district to LandLord;

grant insert on spacee to LandLord;
grant insert on rental_conditions to LandLord; 

grant update on spacee to LandLord;
grant update on rental_conditions to LandLord;
grant update on infoarmation_about_treaty to LandLord;
grant update on landlord to LandLord;

go

grant select on landlord to Observer;
grant select on rental_conditions to Observer;
grant select on infoarmation_about_treaty to Observer;
grant select on spacee to Observer;
grant select on building to Observer;
grant select on locationn to Observer;
grant select on nearest_metro to Observer;
grant select on district to Observer;

go

grant select on landlord to Editor;
grant select on rental_conditions to Editor;
grant select on infoarmation_about_treaty to Editor;
grant select on spacee to Editor;
grant select on building to Editor;
grant select on locationn to Editor;
grant select on nearest_metro to Editor;
grant select on district to Editor;

grant insert on spacee to Editor;
grant insert on rental_conditions to Editor; 
grant insert on district to Editor;
grant insert on locationn to Editor;
grant insert on nearest_metro to Editor;
grant insert on building to Editor;

grant delete on spacee to Editor;
grant delete on rental_conditions to Editor;
grant delete on district to Editor;
grant delete on locationn to Editor;
grant delete on nearest_metro to Editor;
grant delete on building to Editor;

grant update on spacee to Editor;
grant update on rental_conditions to Editor;
grant update on infoarmation_about_treaty to Editor;
grant update on landlord to Editor;
grant update on district to Editor;
grant update on locationn to Editor;
grant update on nearest_metro to Editor;
grant update on building to Editor;

go

--����������� �������
deny Insert on landlord to Observer;
deny Update on landlord to Observer;
deny delete on landlord to Observer;
deny Insert on rental_conditions to Observer;
deny Update on rental_conditions to Observer;
deny delete on rental_conditions to Observer;
deny Insert on infoarmation_about_treaty to Observer;
deny Update on infoarmation_about_treaty to Observer;
deny delete on infoarmation_about_treaty to Observer;
deny Insert on spacee to Observer;
deny Update on spacee to Observer;
deny delete on spacee to Observer;
deny Insert on building to Observer;
deny Update on building to Observer;
deny delete on building to Observer;
deny Insert on locationn to Observer;
deny Update on locationn to Observer;
deny delete on locationn to Observer;
deny Insert on nearest_metro to Observer;
deny Update on nearest_metro to Observer;
deny delete on nearest_metro to Observer;
deny Insert on district to Observer;
deny Update on district to Observer;
deny delete on district to Observer;


--drop role LandLord;
--drop role Observer;
--drop role Editor;
--drop login User1
--drop login User2
--drop login User3
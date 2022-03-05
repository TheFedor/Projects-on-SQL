--проверка функции
select * from postavshiki
select * from Zakazi_postavki
select * from dbo.Obrabotca_stroki('POZITRON')

--проыерка процедуры и триггера на insert
select * from postavshiki
select * from Zakazi_postavki
exec dbo.Vstavka 'Курочкина', 'Москва', 4, 2, 20000, 3, 3, 3;
select * from postavshiki
select * from Zakazi_postavki

--проверка триггера на update
select * from Zakazi_postavki
update Zakazi_postavki set vidi_tovara = 1 where Zakazi_postavki.vidi_tovara = 2
select * from Zakazi_postavki

use morskie_gruzoperevozki

create role Zam_Admina
create role Sailor
create role Guide

create login User1 with password = 'User1_'
create login User2 with password = 'User2_'
create login User3 with password = 'User3_'

create user User1 for login User1
create user User2 for login User2
create user User3 for login User3

alter role Zam_Admina add member User1
alter role Sailor add member User2
alter role Guide add member User3

grant select on measures_of_boat to Zam_Admina
grant select on internal_configuration to Zam_Admina
grant select on ship_modification_options to Zam_Admina
grant select on cargo_name to Zam_Admina
grant select on engine_type to Zam_Admina
grant select on external_complectation to Zam_Admina
grant select on type_of_vessel to Zam_Admina
grant select on requirements_for_cargo_spaces to Zam_Admina
grant select on classification_of_vessels to Zam_Admina
grant select on rangee to Zam_Admina
grant select on loading_and_unloading_process to Zam_Admina
grant select on countries to Zam_Admina

grant update on measures_of_boat to Zam_Admina--
grant update on internal_configuration to Zam_Admina--
grant update on ship_modification_options to Zam_Admina
grant update on cargo_name to Zam_Admina
grant update on engine_type to Zam_Admina--
grant update on external_complectation to Zam_Admina--
grant update on type_of_vessel to Zam_Admina--
grant update on requirements_for_cargo_spaces to Zam_Admina
grant update on classification_of_vessels to Zam_Admina
grant update on rangee to Zam_Admina
grant update on loading_and_unloading_process to Zam_Admina
grant update on countries to Zam_Admina

grant delete on type_of_vessel to Zam_Admina
grant delete on ship_modification_options to Zam_Admina
grant delete on cargo_name to Zam_Admina
grant delete on requirements_for_cargo_spaces to Zam_Admina
grant delete on classification_of_vessels to Zam_Admina
grant delete on rangee to Zam_Admina
grant delete on loading_and_unloading_process to Zam_Admina
grant delete on countries to Zam_Admina
grant delete on external_complectation to Zam_Admina
grant delete on engine_type to Zam_Admina
grant delete on internal_configuration to Zam_Admina
grant delete on measures_of_boat to Zam_Admina

grant insert on type_of_vessel to Zam_Admina
grant insert on ship_modification_options to Zam_Admina
grant insert on cargo_name to Zam_Admina
grant insert on requirements_for_cargo_spaces to Zam_Admina
grant insert on classification_of_vessels to Zam_Admina
grant insert on rangee to Zam_Admina
grant insert on loading_and_unloading_process to Zam_Admina
grant insert on countries to Zam_Admina
grant insert on external_complectation to Zam_Admina
grant insert on engine_type to Zam_Admina
grant insert on internal_configuration to Zam_Admina
grant insert on measures_of_boat to Zam_Admina


grant select on type_of_vessel to Sailor
grant select on measures_of_boat to Sailor
grant select on cargo_name to Sailor
grant select on external_complectation to Sailor
grant select on internal_configuration to Sailor
grant select on engine_type to Sailor
grant select on ship_modification_options to Sailor
grant select on countries to Sailor
grant select on rangee to Sailor


grant select on type_of_vessel to Guide
grant select on measures_of_boat to Guide
grant select on external_complectation to Guide
grant select on internal_configuration to Guide
grant select on engine_type to Guide
grant select on countries to Guide
grant select on rangee to Guide

grant delete on countries to Guide

grant update on countries to Guide
grant update on rangee to Guide

grant insert on countries to Guide

deny update on measures_of_boat to Sailor
deny update on internal_configuration to Sailor
deny update on ship_modification_options to Sailor
deny update on cargo_name to Sailor
deny update on engine_type to Sailor
deny update on external_complectation to Sailor
deny update on type_of_vessel to Sailor
deny update on requirements_for_cargo_spaces to Sailor
deny update on classification_of_vessels to Sailor
deny update on rangee to Sailor
deny update on loading_and_unloading_process to Sailor
deny update on countries to Sailor

deny delete on measures_of_boat to Sailor
deny delete on internal_configuration to Sailor
deny delete on ship_modification_options to Sailor
deny delete on cargo_name to Sailor
deny delete on engine_type to Sailor
deny delete on external_complectation to Sailor
deny delete on type_of_vessel to Sailor
deny delete on requirements_for_cargo_spaces to Sailor
deny delete on classification_of_vessels to Sailor
deny delete on rangee to Sailor
deny delete on loading_and_unloading_process to Sailor
deny delete on countries to Sailor

deny insert on measures_of_boat to Sailor
deny insert on internal_configuration to Sailor
deny insert on ship_modification_options to Sailor
deny insert on cargo_name to Sailor
deny insert on engine_type to Sailor
deny insert on external_complectation to Sailor
deny insert on type_of_vessel to Sailor
deny insert on requirements_for_cargo_spaces to Sailor
deny insert on classification_of_vessels to Sailor
deny insert on rangee to Sailor
deny insert on loading_and_unloading_process to Sailor
deny insert on countries to Sailor

--drop role Zam_Admina
--drop role Sailor
--drop role Guide
--drop user User1
--drop User User2
--drop User User3
--drop login User1
--drop login User2
--drop login User3
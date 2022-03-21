create or replace function get_flights_from_to(airport_name_in in varchar2, airport_city_in in varchar2) return number
is
CURSOR c_flights IS
SELECT * FROM flight
BEGIN
dbms_output.put_line('ID FullName PhoneNumber Address OwnershipPercent')
for c_flights in (select * from flight where
(flight.airport_id = (select airport_id from airport where
(airport.airport_name = airport_name_in)))
--and
--(flight.airport_arrival = (select airport_id from airport 
--where airport.airport_city= airport_city_in))
)
loop
--dbms_output.put( c_flights.flight_id ||' ')
--dbms_output.put( c_flights.departure_time ||' ')
--dbms_output.put( c_flights.arrival_time ||' ')
--dbms_output.put( c_flights.airport_arrival ||' ')
dbms_output.put_line('')
END LOOP
return null
end

////////////////////////
////////////////////////
create or replace function get_main_owner(company_name in varchar2) return number is
CURSOR c_owners IS
SELECT * FROM owners;
BEGIN
dbms_output.put_line('ID FullName PhoneNumber Address OwnershipPercent');
for c_owners in (select * from owners where
(owners.ownership_percernt = (select max(ownership_percernt) from owners 
where owners.company_id = (select company.id from company where company.name_=company_name) )))loop
dbms_output.put( c_owners.id ||' ');
dbms_output.put( c_owners.fullname ||' ');
dbms_output.put( c_owners.phone_number ||' ');
dbms_output.put( c_owners.address ||' ');
dbms_output.put( c_owners.ownership_percernt ||' ');
dbms_output.put_line('');
END LOOP;
return null;
end;

///////////////////////////
/////////////////////////// new

create or replace function get_flights_from_to(airport_name_in in varchar2, airport_city_in in varchar2) 
return number
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
dbms_output.put_line('this is first line');
for c_flights in (select * from flight where (flight.airport_arrival = (select airport_id from airport 
where airport.airport_city= airport_city_in))
)
loop
dbms_output.put_line('new line');
dbms_output.put( c_flights.flight_id ||' ');
dbms_output.put( c_flights.departure_time ||' ');
dbms_output.put( c_flights.arrival_time ||' ');
dbms_output.put( c_flights.airport_arrival ||' ');
dbms_output.put_line('');
END LOOP;
return airport_city_in;
end;
/
exec dbms_output.put(get_flights_from_to('EG346', 'palestine'));

//// this is final solution
////
create or replace procedure get_flights_from_to_p(airport_name_in in varchar2, airport_city_in in varchar2) 
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
dbms_output.put_line('this is first line');
for c_flights in (select * from flight where (flight.airport_arrival = (select airport_id from airport where airport.airport_city= airport_city_in)))
loop
dbms_output.put_line('new line');
dbms_output.put( c_flights.flight_id ||' ');
dbms_output.put( c_flights.departure_time ||' ');
dbms_output.put( c_flights.arrival_time ||' ');
dbms_output.put( c_flights.airport_arrival ||' ');
dbms_output.put_line('');
END LOOP;
end;
/
exec get_flights_from_to_p('EG346', 'palestine');



create or replace function get_flights_from_to(airport_name_in in varchar2, airport_city_in in varchar2) 
return number
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
dbms_output.put_line('this is first line');
for c_flights in (select * from flight) 
loop
dbms_output.put_line('new line');
dbms_output.put( c_flights.flight_id ||' ');
dbms_output.put( c_flights.departure_time ||' ');
dbms_output.put( c_flights.arrival_time ||' ');
dbms_output.put( c_flights.airport_arrival ||' ');
dbms_output.put_line('');
END LOOP;
return null;
end;
/

-----------------------------------
--------------------------
----------------------------------
-- ░░░░░░███████ ]▄▄▄▄▄▄▄▄▃
-- ▂▄▅█████████▅▄▃▂
-- I███████████████████].
--  ◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙.
----------------------------------


--- جميع الرحلات من مطار معين في تاريخ معين 
create or replace procedure get_flights_by_date(airport_name_in in varchar2, flight_date in varchar2) 
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
dbms_output.put_line('ID     ' || 'departure_time   ' || 'arrival_time    ' || 'airport_arrival   ');
for c_flights in (select * from flight where (departure_time = flight_date))
loop
dbms_output.put( c_flights.flight_id ||'      ');
dbms_output.put( c_flights.departure_time ||'      ');
dbms_output.put( c_flights.arrival_time ||'      ');
dbms_output.put( c_flights.airport_arrival ||'     ');
dbms_output.put_line('');
END LOOP;
end;
/
SET serveroutput ON;
exec get_flights_by_date('EG346', '16-JUN-2019');


------------------------------------------------------------


--- خصم مبلغ على رحلة معينة 
select * FROM tickets where ticket_id='3001';
create or replace procedure discount(flight_id_in in number, amount in number)
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
update tickets SET  ticket_price= (ticket_price - amount) where tickets.flight_id =flight_id_in;
end;
/

exec discount('2831', 50);
select * FROM tickets where ticket_id='3001';


--------------------------------------------------------------


SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') FROM dual;

------------------------------------------------------------------



-------------------------------------------------------------------------------------


--error
-- تذكرة مجانية إذا صادف تاريخ الرحلة يوم تاريخ الميلاد
create or replace procedure Christmas_discount(ticket_id_in in varchar2)
is
CURSOR c_tickets IS
SELECT * FROM tickets ;
BEGIN
	update tickets SET ticket_price = 0 where 
	to_char(SYSDATE, 'DD-MON') =(select TO_CHAR(traveler_birthday,'DD-MON') from travelers 
	where 
	traveler_id=(select traveler_id from tickets where ticket_id = ticket_id_in));
end;
/
exec Christmas_discount('3003');


------/////////////////

create or replace procedure Christmas_discount(ticket_id_in in varchar2)
is
v_dep   date;
v_birth date;
BEGIN
    select departure_time into v_dep from flight where flight_id = (select flight_id from tickets where tickets.ticket_id= ticket_id_in);
    select traveler_birthday into v_birth from travelers where traveler_id=(select traveler_id from tickets where ticket_id = ticket_id_in);
	update tickets SET ticket_price = 0 where TO_CHAR(v_dep,'DD-MON')= TO_CHAR(v_birth,'DD-MON');
end;
/
exec Christmas_discount('3004');





--------------------------------------------------------------------


















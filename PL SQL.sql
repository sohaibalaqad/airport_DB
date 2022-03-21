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
exception 
when others then
dbms_output.put_line('thier is Erorr');
dbms_output.put_line(sqlerrm);
end;
/
SET serveroutput ON;
exec get_flights_by_date('EG346', '16-JUN-2019');


--------------------------------------------------------------------------


--- خصم مبلغ على رحلة معينة 
select * FROM tickets where ticket_id='3001'; --- test befor

create or replace procedure discount(flight_id_in in number, amount in number)
is
CURSOR c_flights IS
SELECT * FROM flight;
BEGIN
update tickets SET  ticket_price= (ticket_price - amount) where tickets.flight_id =flight_id_in;
exception 
when others then
dbms_output.put_line('thier is Erorr');
dbms_output.put_line(sqlerrm);
end;
/

exec discount('2831', 50);

select * FROM tickets where ticket_id='3001'; -- test after 


--------------------------------------------------------------------------


--- اضافة تذكرة مجانية لمن يملك 3 تذاكر أو أكثر 
create or replace procedure free_ticket(traveler_id_in in varchar2)
is
v_nmb number;
BEGIN
select COUNT(ticket_id) into v_nmb from tickets where tickets.traveler_id=traveler_id_in;
if 2< v_nmb then
insert into tickets (ticket_id,flight_id ,TRAVELER_ID,ticket_price,date_of_cancellation )
             values ('6001','2831', traveler_id_in ,0, '16-JUN-2021' );
ELSE
dbms_output.put('NO');
end if;
exception 
when others then
dbms_output.put_line('thier is Erorr');
dbms_output.put_line(sqlerrm);
end;
/
set SERVEROUTPUT on;
exec free_ticket('1100');





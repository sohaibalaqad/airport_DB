
CREATE TABLE airport ( airport_id VARCHAR2(5) , airport_name VARCHAR2(20) , airport_city VARCHAR2(10) );

CREATE TABLE planes ( plane_id VARCHAR2(5) , plane_name VARCHAR2(15), manufacture_company VARCHAR2(15) , number_of_seats NUMBER(3));

CREATE TABLE travelers ( traveler_id NUMBER(10) , traveler_name VARCHAR2(15) , traveler_birthday DATE , traveler_phone NUMBER(10) , traveler_sex VARCHAR2(1) CHECK(traveler_sex in ('m','f')));

CREATE TABLE flight ( flight_id VARCHAR2(5) , departure_time DATE , arrival_time DATE , airport_arrival VARCHAR2(20) , plane_id VARCHAR2(5) , airport_id varchar2(5));

CREATE TABLE employee ( employee_id NUMBER(10) , employee_name VARCHAR2(15) , employee_birthday DATE , employee_jop VARCHAR2(15) , employee_sallary NUMBER(5) , airport_id VARCHAR2(5) );

CREATE TABLE tickets ( ticket_id VARCHAR2(5) , flight_id VARCHAR2(5) , TRAVELER_ID NUMBER(10) , ticket_price NUMBER(5) , booking_date DATE DEFAULT sysdate , date_of_cancellation date);

------------------------------------------------------------------------------

alter table airport add CONSTRAINT pk_airport PRIMARY key ( AIRPORT_ID );

alter table planes add CONSTRAINT pk_planes PRIMARY key ( plane_id );

alter table TRAVELERS add CONSTRAINT pk_TRAVELERS PRIMARY key ( TRAVELER_ID );

alter table flight add CONSTRAINT pk_flight PRIMARY key ( flight_id );

alter table employee add CONSTRAINT pk_employee PRIMARY key ( employee_id );

alter table tickets add CONSTRAINT pk_ticket PRIMARY key ( ticket_id );

---------------------------------------------------------------------------------------

alter table flight add CONSTRAINT fk1_flight FOREIGN key (AIRPORT_id) REFERENCES airport(AIRPORT_id);

alter table flight add CONSTRAINT fk2_flight FOREIGN key ( plane_id ) REFERENCES planes( plane_id ) ;

alter table tickets add CONSTRAINT fk1_tickets FOREIGN key ( flight_id ) REFERENCES flight( flight_id ) ;

alter table tickets add CONSTRAINT fk2_tickets FOREIGN key (TRAVELER_ID) REFERENCES TRAVELERs(TRAVELER_ID);

alter table employee add CONSTRAINT fk1_employee FOREIGN key (AIRPORT_id) REFERENCES airport(AIRPORT_id);

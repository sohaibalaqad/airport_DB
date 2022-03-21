--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
tables
FOR

practices:

///////////////////////////////
CREATE TABLE salesman (
	salesman_id number(4) PRIMARY KEY
	,name varchar2(40)
	,city varchar2(30)
	,commission number(5)
	);

///////////////////////////////////
CREATE TABLE customer (
	customer_id number(4) PRIMARY KEY
	,cust_name varchar2(40)
	,city varchar2(30)
	,grade varchar2(3)
	,salesman_id number(4)
	,constraints customer_fk FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
	);

//////////////////////////////////
CREATE TABLE orders (
	order_id number(5) PRIMARY KEY
	,purchase_amount number(4)
	,ord_date varchar2(30)
	,customer_id number(4)
	,salesman_id number(4)
	,constraints orders_salesman_fk FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
	,constraints orders_customer_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
	);

///////////////////////////////////
INSERT INTO salesman
VALUES (
	5001
	,'James Hoog'
	,'New York'
	,0.15
	);

INSERT INTO salesman
VALUES (
	5002
	,'Nail Knite'
	,'Paris'
	,0.13
	);

INSERT INTO salesman
VALUES (
	5005
	,'Pit Alex'
	,'London'
	,0.11
	);

INSERT INTO salesman
VALUES (
	5006
	,'Mc Lyon'
	,'Paris'
	,0.14
	);

INSERT INTO salesman
VALUES (
	5007
	,'Paul Adam'
	,'Rome'
	,0.13
	);

INSERT INTO salesman
VALUES (
	5003
	,'Lauson Hen'
	,'San Jose'
	,0.12
	);

///////////////////////////////////////
INSERT INTO customer
VALUES (
	3002
	,'Nick Rimando'
	,'New York'
	,100
	,5001
	);

INSERT INTO customer
VALUES (
	3007
	,'Brad Davis'
	,'New York'
	,200
	,5001
	);

INSERT INTO customer
VALUES (
	3005
	,'Graham Zusi'
	,'California'
	,200
	,5002
	);

INSERT INTO customer
VALUES (
	3008
	,'Fabian Johnson'
	,'London'
	,300
	,5002
	);

INSERT INTO customer
VALUES (
	3004
	,'Nick Rimando'
	,'Paris'
	,300
	,5006
	);

INSERT INTO customer
VALUES (
	3009
	,'Geoff Cameron'
	,'Berlin'
	,100
	,5003
	);

INSERT INTO customer
VALUES (
	3003
	,'Jozy Altidor'
	,'Moscow'
	,200
	,5007
	);

INSERT INTO customer (
	customer_id
	,cust_name
	,city
	,salesman_id
	)
VALUES (
	3001
	,'Brad Guzan'
	,'London'
	,5005
	);

//////////////////////////////////////
INSERT INTO orders
VALUES (
	70001
	,150.5
	,'2012-10-05'
	,3005
	,5002
	);

INSERT INTO orders
VALUES (
	70009
	,270.65
	,'2012-09-10'
	,3001
	,5005
	);

INSERT INTO orders
VALUES (
	70002
	,65.26
	,'2012-10-05'
	,3002
	,5001
	);

INSERT INTO orders
VALUES (
	70004
	,110.5
	,'2012-08-17'
	,3009
	,5003
	);

INSERT INTO orders
VALUES (
	70007
	,948.5
	,'2012-09-10'
	,3005
	,5002
	);

INSERT INTO orders
VALUES (
	70005
	,2400.6
	,'2012-07-27'
	,3007
	,5001
	);

INSERT INTO orders
VALUES (
	70008
	,5760
	,'2012-09-10'
	,3002
	,5001
	);

INSERT INTO orders
VALUES (
	70010
	,1983.43
	,'2012-10-10'
	,3004
	,5006
	);

INSERT INTO orders
VALUES (
	70003
	,2480.4
	,'2012-10-10'
	,3009
	,5003
	);

INSERT INTO orders
VALUES (
	70012
	,250.45
	,'2012-06-27'
	,3008
	,5002
	);

INSERT INTO orders
VALUES (
	70011
	,75.29
	,'2012-08-17'
	,3003
	,5007
	);

INSERT INTO orders
VALUES (
	70013
	,3045.6
	,'2012-04-25'
	,3002
	,5001
	);

/////////////////////////////////////////////
TABLE
FOR
GROUP

by:

///////////////////////////////////////
CREATE TABLE agents (
	AGENT_CODE varchar2(6) PRIMARY KEY
	,AGENT_NAME varchar2(30)
	,WORKING_AREA varchar2(30)
	,COMMISSION number(3)
	,PHONE_NO varchar2(15)
	);

INSERT INTO agents
VALUES (
	'A007'
	,'Ramasundar'
	,'Bangalore'
	,0.15
	,'077-25814763'
	);

INSERT INTO agents
VALUES (
	'A003'
	,'Alex'
	,'London'
	,0.13
	,'075-12458969'
	);

INSERT INTO agents
VALUES (
	'A008'
	,'Alford'
	,'New York '
	,0.12
	,'044-25874365'
	);

INSERT INTO agents
VALUES (
	'A011'
	,'Ravi Kumar'
	,'Bangalore'
	,0.15
	,'077-45625874'
	);

INSERT INTO agents
VALUES (
	'A010'
	,'Santakumar'
	,'Chennai'
	,0.14
	,'007-22388644'
	);

INSERT INTO agents
VALUES (
	'A012'
	,'Lucida'
	,'San Jose'
	,0.12
	,'044-52981425'
	);

INSERT INTO agents
VALUES (
	'A005'
	,'Anderson'
	,'Brisban'
	,0.13
	,'045-21447739'
	);

INSERT INTO agents
VALUES (
	'A001'
	,'Subbarao'
	,'Bangalore'
	,0.14
	,'077-12346674'
	);

INSERT INTO agents
VALUES (
	'A002'
	,'Mukesh'
	,'Mumbai'
	,0.11
	,'029-12358964'
	);

INSERT INTO agents
VALUES (
	'A006'
	,'McDen'
	,'London'
	,0.15
	,'078-22255588'
	);

INSERT INTO agents
VALUES (
	'A004'
	,'Ivan'
	,'Torento'
	,0.15
	,'008-22544166'
	);

INSERT INTO agents
VALUES (
	'A009'
	,'Benjamin'
	,'Hampshair'
	,0.11
	,'008-22536178'
	);

-------------------------
TABLE
FOR

having:

CREATE TABLE customer2 (
	CUST_CODE varchar2(7) PRIMARY KEY
	,CUST_NAME varchar2(30)
	,CUST_CITY varchar2(30)
	,WORKING_AREA varchar2(30)
	,CUST_COUNTRY varchar2(30)
	,GRADE number(1)
	,OPENING_AMT number(8)
	,RECEIVE_AMT number(8)
	,PAYMENT_AMT number(8)
	,OUTSTANDING_AMT number(5)
	,PHONE_NO varchar2(9)
	,AGENT_CODE varchar2(4)
	);

------------------------------------
INSERT INTO customer2
VALUES (
	'C00013'
	,'Holmes'
	,'London'
	,'London'
	,'UK '
	,2
	,6000.00
	,5000.00
	,7000.00
	,4000.00
	,'BBBBBBB'
	,'A003'
	);

INSERT INTO customer2
VALUES (
	'C00001'
	,'Micheal'
	,'New York'
	,'New York'
	,'USA'
	,2
	,3000.00
	,5000.00
	,2000.00
	,6000.00
	,'CCCCCCC'
	,'A008'
	);

INSERT INTO customer2
VALUES (
	'C00020'
	,'Albert'
	,'New York'
	,'New York'
	,'USA'
	,3
	,5000.00
	,7000.00
	,6000.00
	,6000.00
	,'BBBBSBB'
	,'A008'
	);

INSERT INTO customer2
VALUES (
	'C00025'
	,'Ravindran'
	,'Bangalore'
	,'Bangalore'
	,'India'
	,2
	,5000.00
	,7000.00
	,4000.00
	,8000.00
	,'AVAVAVA'
	,'A011'
	);

INSERT INTO customer2
VALUES (
	'C00024'
	,'Cook'
	,'London'
	,'London'
	,'UK '
	,2
	,4000.00
	,9000.00
	,7000.00
	,6000.00
	,'FSDDSDF'
	,'A006'
	);

INSERT INTO customer2
VALUES (
	'C00015'
	,'Stuart'
	,'London'
	,'London'
	,'UK '
	,1
	,6000.00
	,8000.00
	,3000.00
	,11000.00
	,'GFSGERS'
	,'A003'
	);

INSERT INTO customer2
VALUES (
	'C00002'
	,'Bolt'
	,'New York '
	,'New York  '
	,'USA'
	,3
	,5000.00
	,7000.00
	,9000.00
	,3000.00
	,'DDNRDRH'
	,'A008'
	);

INSERT INTO customer2
VALUES (
	'C00018'
	,'Fleming'
	,'Brisban'
	,'Brisban'
	,'Australia'
	,2
	,7000.00
	,7000.00
	,9000.00
	,5000.00
	,'NHBGVFC'
	,'A005'
	);

INSERT INTO customer2
VALUES (
	'C00021'
	,'Jacks'
	,'Brisban'
	,'Brisban'
	,'Australia'
	,1
	,7000.00
	,7000.00
	,7000.00
	,7000.00
	,'WERTGDF'
	,'A005'
	);

INSERT INTO customer2
VALUES (
	'C00019'
	,'Yearannaidu'
	,'Chennai'
	,'Chennai'
	,'India'
	,1
	,8000.00
	,7000.00
	,7000.00
	,8000.00
	,'ZZZZBFV'
	,'A010'
	);

INSERT INTO customer2
VALUES (
	'C00005'
	,'Sasikant'
	,'Mumbai'
	,'Mumbai '
	,'India'
	,1
	,7000.00
	,11000.00
	,7000.00
	,11000.00
	,'147-25896312'
	,'A002'
	);

INSERT INTO customer2
VALUES (
	'C00007'
	,'Ramanathan '
	,'Chennai'
	,'Chennai'
	,'India'
	,1
	,7000.00
	,11000.00
	,9000.00
	,9000.00
	,'GHRDWSD'
	,'A010'
	);

INSERT INTO customer2
VALUES (
	'C00022'
	,'Avinash'
	,'Mumbai'
	,'Mumbai'
	,'India'
	,2
	,7000.00
	,11000.00
	,9000.00
	,9000.00
	,'113-12345678'
	,'A002'
	);

INSERT INTO customer2
VALUES (
	'C00004'
	,'Winston'
	,'Brisban'
	,'Brisban'
	,'Australia'
	,1
	,5000.00
	,8000.00
	,7000.00
	,6000.00
	,'AAAAAA'
	,'A005'
	);

INSERT INTO customer2
VALUES (
	'C00023'
	,'Karl'
	,'London'
	,'London'
	,'UK'
	,0
	,4000.00
	,6000.00
	,7000.00
	,3000.00
	,'AAAABA'
	,'A006'
	);

INSERT INTO customer2
VALUES (
	'C00006'
	,'Shilton'
	,'Torento'
	,'Torento'
	,'Canada'
	,1
	,10000.00
	,7000.00
	,6000.00
	,11000.00
	,'DDDDDD'
	,'A004'
	);

INSERT INTO customer2
VALUES (
	'C00010'
	,'Charles'
	,'Hampshair'
	,'Hampshair '
	,'UK'
	,3
	,6000.00
	,4000.00
	,5000.00
	,5000.00
	,'MMMMMM'
	,'A009'
	);

INSERT INTO customer2
VALUES (
	'C00017'
	,'Srinivas'
	,'Bangalore'
	,'Bangalore '
	,'India'
	,2
	,8000.00
	,4000.00
	,3000.00
	,9000.00
	,'AAAAAA'
	,'A007'
	);

INSERT INTO customer2
VALUES (
	'C00012'
	,'Steven'
	,'San Jose '
	,'San Jose'
	,'USA'
	,1
	,5000.00
	,7000.00
	,9000.00
	,3000.00
	,'KRFYGJ'
	,'A012'
	);

INSERT INTO customer2
VALUES (
	'C00008'
	,'Karolina'
	,'Torento'
	,'Torento'
	,'Canada'
	,1
	,7000.00
	,7000.00
	,9000.00
	,5000.00
	,'HJKORE'
	,'A004'
	);

INSERT INTO customer2
VALUES (
	'C00003'
	,'Martin'
	,'Torento'
	,'Torento'
	,'Canada'
	,2
	,8000.00
	,7000.00
	,7000.00
	,8000.00
	,'MJYURF'
	,'A004'
	);

INSERT INTO customer2
VALUES (
	'C00009'
	,'Ramesh'
	,'Mumbai'
	,'Mumbai'
	,'India'
	,3
	,8000.00
	,7000.00
	,3000.00
	,12000.00
	,'adsdasd '
	,'A002'
	);

INSERT INTO customer2
VALUES (
	'C00014'
	,'Rangarappa'
	,'Bangalore'
	,'Bangalore '
	,'India'
	,2
	,8000.00
	,11000.00
	,7000.00
	,12000.00
	,'AAAATG'
	,'A001'
	);

INSERT INTO customer2
VALUES (
	'C00016'
	,'Venkatpati'
	,'Bangalore'
	,'Bangalore '
	,'India'
	,2
	,8000.00
	,11000.00
	,7000.00
	,12000.00
	,'JRTVFD'
	,'A007'
	);

INSERT INTO customer2
VALUES (
	'C00011'
	,'Sundariya'
	,'Chennai  '
	,'Chennai'
	,'India'
	,3
	,7000.00
	,11000.00
	,7000.00
	,11000.00
	,'PPHGRT'
	,'A010'
	);

---------------------
-- ░░░░░░███████ ]▄▄▄▄▄▄▄▄▃
-- ▂▄▅█████████▅▄▃▂
-- I███████████████████].
--  ◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙.
---------------------
SET serveroutput ON;

BEGIN
	dbms_output.put_line('sohaib alaqad');
END;/

----------------------------


/////////////

CUST_CODE varchar2(7) PRIMARY KEY
	,CUST_NAME varchar2(30)
	,CUST_CITY varchar2(30)
	,WORKING_AREA varchar2(30)
	,CUST_COUNTRY varchar2(30)
	,GRADE number(1)
	,OPENING_AMT number(8)
	,RECEIVE_AMT number(8)
	,PAYMENT_AMT number(8)
	,OUTSTANDING_AMT number(5)
	,PHONE_NO varchar2(9)
	,AGENT_CODE varchar2(4)
	);

////////////////
SET serveroutput ON;

DECLARE v_name customer2.cust_name % type;

BEGIN
	SELECT cust_name
	INTO v_name
	FROM customer2
	WHERE cust_code = 'C00016';

	dbms_output.put_line(v_name);
END;
/

------------------------------
SET serveroutput ON;

DECLARE v_cus customer2%rowtype;

BEGIN
	SELECT *
	INTO v_cus
	FROM customer2
	WHERE cust_code = 'C00016';
	dbms_output.put_line(v_cus.CUST_CODE);
	dbms_output.put_line(v_cus.CUST_NAME);
END;
/
---------------------------------------
SET serveroutput ON;

DECLARE v_numb number : = & enternumber;

BEGIN
	IF v_numb > 0 then dbms_output.put_line('****************');
		dbms_output.put_line('**  positive  **');

	dbms_output.put_line('****************');

	elsif v_numb < 0 then dbms_output.put_line('****************');

	dbms_output.put_line('**  negative  **');

	dbms_output.put_line('****************');ELSE

	dbms_output.put_line('****************');

	dbms_output.put_line('**    zero    **');

	dbms_output.put_line('****************');
END

IF ;END;/
-----
	SET serveroutput ON;

DECLARE v_g CHAR : = upper('&v_g');

BEGIN
	IF v_g = 'A' then dbms_output.put_line('Excellent');
		elsif v_g = 'B' then dbms_output.put_line('v.good');

	elsif v_g = 'C' then dbms_output.put_line('good');ELSE

	dbms_output.put_line('not found');
END

IF ;END;/
---------------------------------------------------
	SET serveroutput ON;

DECLARE v_g CHAR : = upper('&v_g');

BEGIN
	CASE v_g
			WHEN 'A'
				THEN dbms_output.put_line('Excellent');
			WHEN 'B'
				THEN dbms_output.put_line('v.good');
			WHEN 'C'
				THEN dbms_output.put_line('good');
			ELSE dbms_output.put_line('not found');
			END CASE ;END;/
---------
			SET serveroutput ON;DECLARE v_g CHAR : = upper('&v_g');BEGIN
			CASE 
					WHEN v_g = 'A'
						THEN dbms_output.put_line('Excellent');
					WHEN v_g = 'B'
						THEN dbms_output.put_line('v.good');
					WHEN v_g = 'C'
						THEN dbms_output.put_line('good');
					ELSE dbms_output.put_line('not found');
					END CASE ;END;/
-------
					SET serveroutput ON;DECLARE v_g CHAR(1) : = upper('&v_g');app varchar2(20);BEGIN
					app : = CASE 
							WHEN v_g = 'A'
								THEN 'Excellent'
							WHEN v_g = 'B'
								THEN 'v.good'
							WHEN v_g = 'C'
								THEN 'good'
							ELSE 'not found'
							END;

					dbms_output.put_line(app);
				END;/
----------------------------------------------------
--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
DECLARE 
c number : = 0;

BEGIN
	LOOP dbms_output.put_line('sohaib');
	c : = c + 1;
	EXIT 
	when(c = 10);
END

LOOP;
END;
/
----------

--- error ---
DECLARE 
c number : = 0;
n boolean := true;
BEGIN
while n
	LOOP 
	c := c +1;
	dbms_output.put_line(c);
	if c = 10 then 
	n := false;
	end if;
END LOOP;
END;
/

--------------------------------------
DECLARE 
BEGIN
	for i in 1 .. 10 loop
	 dbms_output.put_line(i);	
	
end loop ;
END;
/
---------------------------------------
declare
cursor c_cust is select cust_name from customer ;
v_name customer.cust_name%type;
begin
open c_cust;
loop 
fetch c_cust into v_name;
exit when c_cust%notfound ;
dbms_output.put_line(v_name);
end loop;
close c_cust;
end ;
/

















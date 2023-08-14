--QUERY1-DISPLAY LIST OF ALL PASSENGERS & ALL FLIGHTS--
SELECT * FROM PASSENGER;
SELECT * FROM FLIGHTS F,FLIGHT_DETAILS D WHERE F.FLIGHT_ID=D.FLIGHT_ID;

--QUERY2-DISPLAY DETAILS OF ALL FLIGHTS SCHEDULED IN MONTH OF MARCH 2023--
SELECT * FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME>TO_DATE('28-02-2023') AND TRAVEL_DATE_TIME<TO_DATE('01-04-2023');

--QUERY3 DISPLAY DETAILS OF ALL BOOKINGS PASSENGERWISE--
SELECT FNAME,LNAME,EMAIL,AGE,FLIGHT_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,SEAT_TYPES,TRAVEL_DATE_TIME 
FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID;

--QUERY4-DISPLAY COLLECTION OF REVENUE MONTH WISE--
SELECT TO_CHAR(TRAVEL_DATE_TIME,'MONTH') AS MONTHLY, SUM(FARE) AS MONTHLYREVENUE FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,
FLIGHT_DETAILS F WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID 
GROUP BY TO_CHAR(TRAVEL_DATE_TIME,'MONTH') ;

--QUERY5-DISPLAY TOTAL NUMBER OF SEATS OCCUPIED PER FLIGHT
SELECT FLIGHT_DETAIL_ID,(TOTAL_NOOFSEATS-(SEAT_AVAILABLE_F+SEAT_AVAILABLE_B+SEAT_AVAILABLE_E))AS TOTAL_SEATS_BOOKED  FROM FLIGHTS F,
FLIGHT_DETAILS D WHERE F.FLIGHT_ID =D.FLIGHT_ID ;

--QUERY6-DISPLAY LIST OF ALL PASSENGERS ASCENDING ORDER OF AGE
SELECT * FROM PASSENGER ORDER BY AGE ASC;

--QUERY7-DISPLAY DATA OF ALL FLIGHTS WITH ALL TRAVELLING DETAILS
SELECT * FROM FLIGHT_DETAILS;

--QUERY8-DISPLAY DETAILS OF ALL BOOKINGS DONE BY ALL THOSE PASSENGERS WHOSE AGE IS BETWEEN 30 AND 50.
SELECT FNAME,LNAME,EMAIL,AGE,FLIGHT_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,SEAT_TYPES,TRAVEL_DATE_TIME 
FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID AND 30<AGE AND AGE<50;

--QUERY9-DISPLAY NUMBER OF SEATS AVAILABLE BASED ON FLIGHT_ID AND FLIGHT_CLASSS.
SELECT FLIGHT_ID,SEAT_AVAILABLE_F,SEAT_AVAILABLE_B,SEAT_AVAILABLE_E FROM FLIGHT_DETAILS;

--QUERY10-DISPLAY COLLECTION OF REVENUE BASED ON FLIGHT CLASS.
SELECT SEAT_TYPES,SUM(FARE) AS FLIGHT_CLASS_BASED_REVENUE FROM TRAVEL_BOOKING_DETAILS GROUP BY SEAT_TYPES;

--QUERY11-DISPLAY DETAILS OF FLIGHT BASED ON SOURCE AND DESTINATION
SELECT * FROM FLIGHT_DETAILS ORDER BY FLIGHT_SRC;
SELECT * FROM FLIGHT_DETAILS ORDER BY FLIGHT_DES;

--QUERY12-DISPLAY FLIGHT DETAILS FOR CURRENT DATE SAY THE CURRENT DATE IS ('07-04-2023')
SELECT * FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME>=TO_DATE('07-04-2023') AND TRAVEL_DATE_TIME<TO_DATE('08-04-2023');

--QUERY13-DISPLAY FLIGHT DETAILS BETWEEN TWO DATES SAY FROM '24-03-2023' TO '06-04-2023'.
SELECT * FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME>=TO_DATE('24-03-2023') AND TRAVEL_DATE_TIME<TO_DATE('06-04-2023');

--QUERY14-DISPLAY FLIGHT DETAILS FOR SPECIFIC CLASS SAY 'ECONOMYCLASS'.
SELECT FNAME,LNAME,EMAIL,AGE,FLIGHT_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,SEAT_TYPES,TRAVEL_DATE_TIME 
FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID AND SEAT_TYPES='ECONOMYCLASS'

--QUERY15-DISPLAY TOTAL NUMBER OF FLIGHTS FOR SPECIFIC DATE SAY '03-04-2023'.
SELECT * FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME>=TO_DATE('03-04-2023') AND TRAVEL_DATE_TIME<TO_DATE('04-04-2023');

--QUERY16-DISPLAY TOTAL NUMBER OF PASSENGERS TRAVELLING FROM GIVEN SOURCE AND DESTINATION  
--FROM SOURCE
SELECT FLIGHT_SRC, COUNT(FLIGHT_SRC) AS NOOFPASSENGERS  FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID GROUP BY FLIGHT_SRC
--FROM DESTINATION
SELECT FLIGHT_DES, COUNT(FLIGHT_DES) AS NOOFPASSENGERS FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID GROUP BY FLIGHT_DES

--QUERY17-DISPLAY TOTAL FARE FOR A GIVEN CLASS SAY 'FIRSTCLASS'.
SELECT SEAT_TYPES,SUM(FARE) AS TOTAL_FARE_FOR_GIVEN_CLASS FROM TRAVEL_BOOKING_DETAILS WHERE SEAT_TYPES='FIRSTCLASS' GROUP BY SEAT_TYPES ;

--QUERY18-DISPLAY DETAILS OF ALL TRAVELS FOR A GIVEN CLASS SAY 'ECONOMYCLASS'.
SELECT * FROM TRAVEL_BOOKING_DETAILS T,PASSENGER P WHERE T.PASS_ID=P.PASS_ID AND SEAT_TYPES='ECONOMYCLASS'

--QUERY19-DISPLAY DETAILS OF FLIGHTS IN ORDER OF THEIR OCCUPANCY 
 SELECT FLIGHT_DETAIL_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,(TOTAL_NOOFSEATS-(SEAT_AVAILABLE_F+SEAT_AVAILABLE_B+SEAT_AVAILABLE_E))AS
 TOTAL_SEATS_BOOKED , TRAVEL_DATE_TIME  FROM FLIGHTS F,FLIGHT_DETAILS D WHERE F.FLIGHT_ID =D.FLIGHT_ID ;
 
--QUERY20-Display complete details of all users and admins.
SELECT * FROM USERTABLE;

--QUERY21-DISPLAY PASSENGER'S TRAVEL HISTORY FOR A GIVEN NAME OF PASSENGER
SELECT PASS_ID,COUNT(PASS_ID) AS PREVIOUS_HISTORY FROM PASSENGER GROUP BY PASS_ID HAVING COUNT(PASS_ID)>1;

--QUERY22-DISPLAY TOTAL NUMBER OF USERS AVAILABLE
SELECT * FROM USERTABLE WHERE USERTYPE='USER'

--QUERY23-DISPLAY TOTAL DISCOUNT OFFERED CLASS WISE.
SELECT SEAT_TYPES,SUM(DISCOUNTAMMOUNT) FROM TRAVEL_BOOKING_DETAILS GROUP BY SEAT_TYPES

--QUERY24-DISPLAY DETAILS OF ALL SEATS BOOKED FOR GIVEN FLIGHT_ID SAY FLIGHT_ID =2562  
SELECT FNAME,LNAME,EMAIL,AGE,FLIGHT_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,SEAT_TYPES,TRAVEL_DATE_TIME 
FROM PASSENGER P,TRAVEL_BOOKING_DETAILS D,TRAVEL_DETAILS T,FLIGHT_DETAILS F
WHERE P.PASS_ID=D.PASS_ID AND D.TRAVEL_ID=T.TRAVEL_ID AND F.FLIGHT_DETAIL_ID=T.FLIGHT_DETAIL_ID AND FLIGHT_ID=2562;

--QUERY25-GIVE DISCOUNT OF 10% TO ALL THOSE FLIGHTS SCHEDULE ON GIVEN DATE SAY DATE='03-04-2023' .
SELECT FLIGHT_DETAIL_ID,FLIGHT_ID,FLIGHT_COMPANY,FLIGHT_SRC,FLIGHT_DES,PRICE_FIRST,(PRICE_FIRST-PRICE_FIRST*0.1) AS DISCOUNT_PRICE_FIRST,
PRICE_ECONOMY,(PRICE_ECONOMY-PRICE_ECONOMY*0.1) AS DISCOUNT_PRICE_ECONOMY,PRICE_BUSINESS,(PRICE_BUSINESS-PRICE_BUSINESS*0.1),TRAVEL_DATE_TIME 
FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME>='03-04-2023'AND TRAVEL_DATE_TIME<'04-04-2023';

--QUERY26 ADD NEW COLUMN IN PASSENGER TO STORE ADDRESS.
ALTER TABLE PASSENGER ADD ADDRESS VARCHAR2(80);
DESC PASSENGER;
SELECT * FROM PASSENGER;
ALTER TABLE PASSENGER DROP COLUMN ADDRESS;

--QUERY27 INSERT DEFAULT VALUE IN ADDRESS COLUMN AS 'MUMBAI'.
ALTER TABLE PASSENGER ADD ADDRESS  VARCHAR2(80) DEFAULT('MUMBAI');
DESC PASSENGER;
SELECT * FROM PASSENGER;
ALTER TABLE PASSENGER DROP COLUMN ADDRESS;

--QUERY28 DELETE ALL FLIGHTS SCHEDULE 2 YEARS BACK FROM CURRENT DATE  SAY FROM '24-03-2021' TO '24-03-2023' 
SELECT* FROM FLIGHT_DETAILS;
DELETE FROM FLIGHT_DETAILS WHERE TRAVEL_DATE_TIME<'24-03-2023' AND TRAVEL_DATE_TIME>='24-03-2021'
 --INSERT ALL THE ELEMENTS AGAIN INTO FLIGHT DETAILS

--QUERY29 REMOVE ALL 'ADMIN'  USERS 
SELECT * FROM USERTABLE
DELETE FROM USERTABLE  WHERE USERTYPE='ADMIN'; --ADD USER ADMINS AGAIN

--QUERY30 DELETE TRAVEL DETAILS TABLE.
DROP TABLE TRAVEL_DETAILS; -- TO DELETE THIS WE HAVE TO DELETE TRAVEL_BOOKING_DETAILS FIRST
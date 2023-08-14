DROP TABLE PASSENGER
--CREATING PASSSENGER TABLE
CREATE TABLE PASSENGER(PASS_ID INTEGER PRIMARY KEY,
FNAME VARCHAR2(50) NOT NULL,
LNAME VARCHAR2(30) NOT NULL,
EMAIL VARCHAR2(60) UNIQUE NOT NULL,
AGE INTEGER NOT NULL CHECK(AGE<100)
)
DROP TABLE FLIGHTS
--CREATING FLIGHTS TABLE
CREATE TABLE FLIGHTS(FLIGHT_ID INTEGER PRIMARY KEY,
FIRSTCLASS_NOOFSEATS INTEGER CHECK(0<FIRSTCLASS_NOOFSEATS),
ECONOMYCLASS_NOOFSEATS INTEGER CHECK(0<ECONOMYCLASS_NOOFSEATS),
BUSSINESSCLASS_NOOFSEATS INTEGER  CHECK(0<BUSSINESSCLASS_NOOFSEATS),
TOTAL_NOOFSEATS INTEGER  CHECK(0<TOTAL_NOOFSEATS) 
)
DROP TABLE FLIGHT_DETAILS
--CREATING FLIGHT_DETAILS TABLE
CREATE TABLE FLIGHT_DETAILS(
FLIGHT_DETAIL_ID INTEGER PRIMARY KEY,
FLIGHT_ID INTEGER REFERENCES FLIGHTS(FLIGHT_ID),
FLIGHT_COMPANY VARCHAR2(30) NOT NULL,
FLIGHT_SRC VARCHAR2(30) NOT NULL,
FLIGHT_DES VARCHAR2(30) NOT NULL,
TRAVEL_DATE_TIME TIMESTAMP,
SEAT_AVAILABLE_F INTEGER CHECK(0<SEAT_AVAILABLE_F),
SEAT_AVAILABLE_B INTEGER CHECK(0<SEAT_AVAILABLE_B),
SEAT_AVAILABLE_E INTEGER CHECK(0<SEAT_AVAILABLE_E),
PRICE_FIRST DECIMAL(9,4) CHECK(0<PRICE_FIRST),
PRICE_ECONOMY DECIMAL(9,4) CHECK(0<PRICE_ECONOMY),
PRICE_BUSINESS DECIMAL(9,4) CHECK(0<PRICE_BUSINESS)
)
DROP TABLE USERTABLE
--CREATING USERTABLE TABLE
CREATE TABLE USERTABLE(
USERID INTEGER PRIMARY KEY,
EMAIL VARCHAR2(50) NOT NULL,
PASS VARCHAR2(50) NOT NULL,
USERTYPE VARCHAR2(20) CHECK(USERTYPE='ADMIN' OR USERTYPE= 'USER') )


DROP TABLE TRAVEL_DETAILS
--CREATING TRAVEL_DETAILS TABLE
CREATE TABLE TRAVEL_DETAILS(
TRAVEL_ID INTEGER PRIMARY KEY,
USER_ID INTEGER REFERENCES USERTABLE(USERID),
FLIGHT_DETAIL_ID INTEGER REFERENCES FLIGHT_DETAILS(FLIGHT_DETAIL_ID),
BOOKING_DATE TIMESTAMP,
TOTAL_SEATS INTEGER CHECK(1<=TOTAL_SEATS),
TOTAL_FARE DECIMAL(9,4))

DROP TABLE TRAVEL_BOOKING_DETAILS
--CREATING TRAVEL_BOOKING_DETAILS TABLE
CREATE TABLE TRAVEL_BOOKING_DETAILS(
PNR INTEGER PRIMARY KEY,
TRAVEL_ID INTEGER REFERENCES TRAVEL_DETAILS(TRAVEL_ID),
PASS_ID INTEGER REFERENCES PASSENGER(PASS_ID),
SEAT_NUMBER INTEGER,
SEAT_TYPES CHAR(20) CHECK(SEAT_TYPES='BUSINESSCLASS' OR SEAT_TYPES='FIRSTCLASS' OR SEAT_TYPES='ECONOMYCLASS'),
FARE DECIMAL(9,4),
DISCOUNTAMMOUNT DECIMAL(9,4)
)
 
DROP SEQUENCE PNR_GENERATION_SEQ
--CREATING SEQUENCE FOR PNR
 CREATE SEQUENCE PNR_GENERATION_SEQ
  START WITH 1000000001
  INCREMENT BY 1
  CACHE 50;
    UPDATE TRAVEL_BOOKING_DETAILS
   SET PNR = PNR_GENERATION_SEQ.nextval;
CREATE OR REPLACE TRIGGER trg_TRAVEL_BOOKING_DETAILS_PNR
  BEFORE INSERT ON TRAVEL_BOOKING_DETAILS
  FOR EACH ROW
BEGIN
  :new.PNR := PNR_GENERATION_SEQ.nextval;
END;
  

 

 
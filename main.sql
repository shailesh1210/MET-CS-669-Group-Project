/*Bus reservation system Posgresql
7Tables 
*/

CREATE TABLE "Schedule" (
  "Schedule_id" DECIMAL (12),
  "Arrival_date_time" DATE,
  "Departure_date_time" DATE,
  "Bus_id" DECIMAL (12),
  PRIMARY KEY ("Schedule_id")
);

CREATE TABLE "Transaction" (
  "Transaction_id" DECIMAL (12),
  "Status" VARCHAR (32),
  PRIMARY KEY ("Transaction_id")
);

CREATE TABLE "Amenities" (
  "Amenities_id" DECIMAL (12) NOT NULL UNIQUE,
  "Meals" VARCHAR (4),
  "WiFi" VARCHAR (4),
  "Bathroom" VARCHAR (4),
  PRIMARY KEY ("Amenities_id")
);

CREATE TABLE "Bus " (
  "Bus_id" DECIMAL (12),
  "Start_City" VARCHAR (32),
  "Destination_City" VARCHAR (32),
  "Fare" DECIMAL (8, 2),
  "Amenities_id" DECIMAL (12),
  PRIMARY KEY ("Bus_id"),
  CONSTRAINT "FK_Bus.Amenities_id"
    FOREIGN KEY ("Amenities_id")
      REFERENCES "Amenities"("Amenities_id")
);
CREATE TABLE "Reservation" (
  "Reservation_id" DECIMAL (12),
  "Seat_Num" VARCHAR (4),
  "Date_booked" DATE,
  "Transaction_id" DECIMAL (12),
  "Bus_id" DECIMAL (12),
  PRIMARY KEY ("Reservation_id"),
  CONSTRAINT "FK_Reservation.Transaction_id"
    FOREIGN KEY ("Transaction_id")
      REFERENCES "Transaction"("Transaction_id"),
 CONSTRAINT "FK_Reservation.Bus_id"
    FOREIGN KEY ("Bus_id")
      REFERENCES "Bus "("Bus_id")
);
CREATE TABLE "Tracker" (
  "Tracker_id" DECIMAL (12),
  "Location" VARCHAR (32),
  "Bus_id" DECIMAL (12),
  PRIMARY KEY ("Tracker_id")
);

CREATE TABLE "Passenger" (
  "Passenger_id" DECIMAL (12),
  "First_Name" VARCHAR (32),
  "Last_Name" VARCHAR (32),
  "Gender" VARCHAR (6),
  "Email" VARCHAR (32),
  "Cell_Number" DECIMAL (10),
  "Reservation_id" DECIMAL (12),
  PRIMARY KEY ("Passenger_id", "Reservation_id")
);

/* Amenities table gives different combinations of amenities available in the buses. 1 indicates enabled, 0 indicated disabled*/

INSERT INTO Amenities(“Amenities_id”, Meals, WiFi, Bathroom)
VALUES (1,1,1,0);
INSERT INTO Amenities(“Amenities_id”, “Meals”, “WiFi”, “Bathroom”)
VALUES (2,1,0,1);
INSERT INTO Amenities(“Amenities_id”, “Meals”, “WiFi”, “Bathroom”)
VALUES (3,0,1,1);
INSERT INTO Amenities(“Amenities_id”, “Meals”, “WiFi”, “Bathroom”)
VALUES (4,0,1,0);
INSERT INTO Amenities(“Amenities_id”, “Meals”, “WiFi”, “Bathroom”)
VALUES (5,1,1,1);

/* Bus table gives details of the buses whose reservations are managed by the DBMS*/
INSERT INTO public."Bus "("Bus_id", "Start_City", "Destination_City", "Fare", "Amenities_id")
	VALUES (111,'New York','Boston',1245, 1);
  
INSERT INTO public."Bus "("Bus_id", "Start_City", "Destination_City", "Fare", "Amenities_id")
	VALUES(222,'New York','Washington',1125, 2);
  
  INSERT INTO public."Bus "(
	"Bus_id", "Start_City", "Destination_City", "Fare", "Amenities_id")
	VALUES (333,'New York','Hamptons',1555, 3);
  
  INSERT INTO public."Bus "(
	"Bus_id", "Start_City", "Destination_City", "Fare", "Amenities_id")
	VALUES(444,'New York','New Jersey',2225, 4);
  
  INSERT INTO public."Bus "(
	"Bus_id", "Start_City", "Destination_City", "Fare", "Amenities_id")
	VALUES(555,'New York','Connecticut',2225, 5);

/* Passenger table contains details about the passengers using the bus reservation system*/
INSERT INTO public."Passenger"(
	"Passenger_id", "First_Name", "Last_Name", "Gender", "Email", "Cell_Number", "Reservation_id")
	VALUES (1,'Maka','Makh','female','uservns1111@gmail.com','7376319132', 505);
INSERT INTO public."Passenger"(
	"Passenger_id", "First_Name", "Last_Name", "Gender", "Email", "Cell_Number", "Reservation_id")
	VALUES  (2,'Ilan','Zlot','male','user@gmail.com','7376349112', 404);
INSERT INTO public."Passenger"(
	"Passenger_id", "First_Name", "Last_Name", "Gender", "Email", "Cell_Number", "Reservation_id")
	VALUES  (3,'Artem','Gur','male','anuruser@gmail.com','7376359132', 303);
INSERT INTO public."Passenger"(
	"Passenger_id", "First_Name", "Last_Name", "Gender", "Email", "Cell_Number", "Reservation_id")
	VALUES  (4,'Laura','Auk','female','userns1111@gmail.com','7376319132', 202);
INSERT INTO public."Passenger"(
	"Passenger_id", "First_Name", "Last_Name", "Gender", "Email", "Cell_Number", "Reservation_id")
	VALUES  (5,'Evelina','Chuma','female','useragvns1111@gmail.com','7876349132', 101);


/* Transaction table keeps a log of all transactions(payments) attemted in the system*/
INSERT INTO Transaction("Transaction_id", "Status")
VALUES (24,’success’);
INSERT INTO Transaction("Transaction_id", "Status")
VALUES (25,’success’);
INSERT INTO Transaction("Transaction_id", "Status")
VALUES (26,’success’);
INSERT INTO Transaction("Transaction_id", "Status")
VALUES (27,’fail’);
INSERT INTO Transaction("Transaction_id", "Status")
VALUES (28,’success’);

/*Before INSERT into Reservation table, a trigger goes off. This trigger raises an exception if the transaction is marked as Fail. */
/*The code for trigger is present in functions.sql*/


 INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES (101, 2020,'2021-06-13', 28 , 555);
 INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES  (202, 2020,'2021-06-14', 27 , 444);
 INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES  (303, 2020,'2021-06-15', 26 , 333);
 INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES  (404, 2020,'2021-06-16', 25 , 222);
  INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES  (505, 2020,'2021-06-17', 24 , 111);
	
/*Schedule table consists of the schedule of each bus*/



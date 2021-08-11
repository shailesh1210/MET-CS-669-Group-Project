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

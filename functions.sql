
/* This function is used to get the booking details when the admin inputs passenger ID and Reservation ID */

CREATE FUNCTION Get_BookingDetails(passengerID DECIMAL,ReservationID DECIMAL)
RETURNS  table ( first_name VARCHAR,
			   last_name VARCHAR,
			   Seat_number DECIMAL,
			   Date_Booked DATE,
			   Start_City VARCHAR,
			   Destination_City VARCHAR) 
language plpgsql
as $$
	BEGIN
		RETURN QUERY select (Passenger.First_Name,Passenger.Last_Name,Reservation.Seat_Num,Reservation.Date_booked, Bus.Start_City,Bus.Destination_City) 
		
		FROM Passenger 
		JOIN Reservation ON Passenger.Reservation_id=Reservation.Reservation_id
		JOIN Bus ON Reservation.Bus_id=Bus.Bus_id
		WHERE Passenger.Passenger_id=passengerID AND Reservation.Reservation_id=ReservationID;
	END;
$$

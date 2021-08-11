/*This file consists of statements that show the databse's functionality*/

INSERT INTO public."Reservation"(
	"Reservation_id", "Seat_Num", "Date_booked", "Transaction_id", "Bus_id")
	VALUES  (202, 2020,'2021-06-14', 27 , 444);
  
  --The above statement throws an exception because the transaction_id 27 corrresponds to a failed transaction.
  --The trigger prevents its insert into the Reservation table.
  
  Get_BookingDetails(3,303);
  
  --The above statement fetchesreservation details corresponding to passenger id 3 and reservation id 303
  
  


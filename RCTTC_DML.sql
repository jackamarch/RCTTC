use rcttc;

insert into customer (first_name, last_name, customer_email, customer_phone, customer_address)
select distinct customer_first, customer_last, customer_email, customer_phone, customer_address
from `rcttc_data`;

insert into theater (theater_name, theater_address, theater_phone, theater_email)
select distinct theater, theater_address, theater_phone, theater_email
from `rcttc_data`;

insert into showing (showing_name, showing_date, showing_price, theater_id)
select distinct `show`, `date`, ticket_price, t.theater_id
from `rcttc_data` r
inner join theater t on t.theater_name = r.theater;


insert into ticket (seat, showing_id, customer_id)
select r.`seat`, s.showing_id, c.customer_id
from `rcttc_data` r
inner join showing s on s.showing_name = r.show and s.showing_date = r.`date` and s.showing_price = r.ticket_price
inner join customer c on c.customer_email = r.customer_email;


-- UPDATE
-- 		The Little Fitz's 2021-03-01 performance of The Sky Lit Up is listed with a $20 ticket price. 
-- 			The actual price is $22.25 because of a visiting celebrity actor. (Customers were notified.)
-- 			Update the ticket price for that performance only.

set sql_safe_updates = 0;
update showing set
	showing_price = '22.25'
where showing_name = 'The Sky Lit Up' and showing_date = '2021-03-01';
set sql_safe_updates = 1;

select * from showing
where showing_name = 'The Sky Lit Up' and showing_date = '2021-03-01';

-- 		In the Little Fitz's 2021-03-01 performance of The Sky Lit Up, Pooh Bedburrow and Cullen Guirau seat reservations aren't in the same row.
-- 			Adjust seating so all groups are seated together in a row. This may require updates to all reservations for that performance.
-- 			Confirm that no seat is double-booked and that everyone who has a ticket is as close to their original seat as possible.

set sql_safe_updates = 0;
update ticket set
	seat = 'B4'
where ticket_id = 98;
set sql_safe_updates = 1;

set sql_safe_updates = 0;
update ticket set
	seat = 'C2'
where ticket_id = 100;
set sql_safe_updates = 1;

set sql_safe_updates = 0;
update ticket set
	seat = 'A4'
where ticket_id = 101;
set sql_safe_updates = 1;

-- 		Update Jammie Swindles's phone number from "801-514-8648" to "1-801-EAT-CAKE".

set sql_safe_updates = 0;
update customer set
	customer_phone = '1-801-EAT-CAKE'
where first_name = 'Jammie' and last_name = 'Swindles';
set sql_safe_updates = 1;


-- DELETE
-- 		Delete all single-ticket reservations at the 10 Pin. (You don't have to do it with one query.)

select c.*, count(c.customer_id) ticket_count from ticket t
inner join customer c on c.customer_id = t.customer_id
inner join showing s on s.showing_id = t.showing_id
inner join theater r on r.theater_id = s.theater_id
where r.theater_id = 1
group by c.customer_id
having ticket_count = 1;

delete ticket from ticket
where customer_id in (7, 8, 10, 15, 18, 19, 22, 25, 26);

-- 		Delete the customer Liv Egle of Germany. It appears their reservations were an elaborate joke.

select * from customer c
inner join ticket t on t.customer_id = c.customer_id
inner join showing s on s.showing_id = t.showing_id
inner join theater r on r.theater_id = s.theater_id
where c.first_name = 'Liv';

delete ticket from ticket where customer_id = 65;
delete customer from customer where customer_id = 65;







use rcttc;

-- select * from customer;
-- select * from theater;
-- select * from showing;
-- select * from ticket;


-- #1.) Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).

-- select * from showing
-- where showing_date between '2021-10-01' and '2021-12-31';

-- ===========================================================================================================

-- #2.) List customers without duplication.

-- select * from customer;

-- ===========================================================================================================

-- #3.) Find all customers without a .com email address.

-- select * from customer
-- where customer_email not like '%.com';

-- ===========================================================================================================

-- #4.) Find the three cheapest shows.

-- select * from showing
-- order by showing_price asc
-- limit 3;

-- ===========================================================================================================

-- #5.) List customers and the show they're attending with no duplication.

-- select distinct c.*, s.* from ticket t
-- inner join customer c on c.customer_id = t.customer_id
-- inner join showing s on s.showing_id = t.showing_id;

-- ===========================================================================================================

-- #6.) List customer, show, theater, and seat number in one query.

-- select c.first_name, c.last_name, s.showing_name, s.showing_date, r.theater_name, t.seat from ticket t
-- inner join customer c on c.customer_id = t.customer_id
-- inner join showing s on s.showing_id = t.showing_id
-- inner join theater r on r.theater_id = s.theater_id;

-- ===========================================================================================================

-- #7.) Find customers without an address.

-- select * from customer
-- where ifnull(customer_address, '') = '';

-- ===========================================================================================================

-- #8.) Recreate the spreadsheet data with a single query.

-- select c.first_name, c.last_name, c.customer_email, c.customer_phone, c.customer_address,
-- t.seat,
-- s.showing_name, s.showing_price, s.showing_date,
-- r.theater_name, r.theater_address, r.theater_phone, r.theater_email
--  from ticket t
-- inner join customer c on c.customer_id = t.customer_id
-- inner join showing s on s.showing_id = t.showing_id
-- inner join theater r on r.theater_id = s.theater_id;

-- ===========================================================================================================

-- #9.) Count total tickets purchased per customer.

-- select c.first_name, c.last_name, count(t.ticket_id) total_tickets from customer c
-- inner join ticket t on t.customer_id = c.customer_id
-- group by c.customer_id;

-- ===========================================================================================================

-- #10.) Calculate the total revenue per show based on tickets sold.

-- select s.showing_name, s.showing_price * count(ticket_id) as revenue from showing s
-- inner join ticket t on t.showing_id = s.showing_id
-- group by s.showing_id;

-- ===========================================================================================================

-- #11.) Calculate the total revenue per theater based on tickets sold.

-- select r.theater_name, sum(s.showing_price) revenue from theater r
-- inner join showing s on s.theater_id = r.theater_id
-- inner join ticket t on t.showing_id = s.showing_id
-- group by r.theater_id;

-- ===========================================================================================================

-- #12.) Who is the biggest supporter of RCTTC? Who spent the most in 2021?

-- select c.customer_id, c.first_name, c.last_name, sum(s.showing_price) as total_spent from customer c
-- inner join ticket t on t.customer_id = c.customer_id
-- inner join showing s on t.showing_id = s.showing_id
-- group by customer_id;

-- ===========================================================================================================




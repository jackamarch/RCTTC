use rcttc;

select * from customer;
select * from theater;
select * from showing;
select * from ticket;

select c.*, count(c.customer_id) ticket_count from ticket t
inner join customer c on c.customer_id = t.customer_id
inner join showing s on s.showing_id = t.showing_id
inner join theater r on r.theater_id = s.theater_id
where r.theater_id = 1
group by c.customer_id
having ticket_count = 1;


-- #1.) Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).
-- #2.) List customers without duplication.
-- #3.) Find all customers without a .com email address.
-- #4.) Find the three cheapest shows.
-- #5.) List customers and the show they're attending with no duplication.
-- #6.) List customer, show, theater, and seat number in one query.
-- #7.) Find customers without an address.
-- #8.) Recreate the spreadsheet data with a single query.
-- #9.) Count total tickets purchased per customer.
-- #10.) Calculate the total revenue per show based on tickets sold.
-- #11.) Calculate the total revenue per theater based on tickets sold.
-- #12.) Who is the biggest supporter of RCTTC? Who spent the most in 2021?


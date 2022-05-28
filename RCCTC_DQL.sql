use rcttc;

select * from customer;
select * from theater;
select * from showing;
select * from ticket;




select count(customer_id) from ticket
where showing_id = 1
group by customer_id
having count(customer_id) = 1;

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


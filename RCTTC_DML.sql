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



-- select distinct d.`seat`, s.showing_id, c.customer_id
-- from `rcttc_data` d
-- inner join showing s on s.showing_date = d.`date`
-- inner join customer c on c.customer_email = d.customer_email;


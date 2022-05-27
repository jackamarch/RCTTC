use rcttc;

insert into customer (first_name, last_name, customer_email, customer_phone, customer_address)
select distinct customer_first, customer_last, customer_email, customer_phone, customer_address
from `rcttc_data`;

insert into theater (theater_name, theater_address, theater_phone, theater_email)
select distinct theater, theater_address, theater_phone, theater_email
from `rcttc_data`;

insert into showing (showing_name, showing_date, showing_price, theater_id)
select distinct `show`, `date`, `ticket_price`, theater_id
from `rcttc_data` d
inner join theater t on t.theater_name = d.theater;

insert into ticket (seat, showing_id, customer_id)
select distinct seat, showing_id, customer_id
from `rcttc_data` d
inner join showing s on s.showing_name = d.`show`
inner join customer c on c.customer_email = d.customer_email;




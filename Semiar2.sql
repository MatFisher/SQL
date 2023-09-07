use lesson_2;
create table sales
(
id int primary key not null auto_increment,
order_date date not null,
count_product int not null
);

insert into sales (order_date, count_product)
values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

select * from sales

select
	id as 'id заказа',
	if (count_product < 100, 'Маленький заказ', 
		if (count_product between 100 and 300, 'Средний заказ', 'Большой заказ')
	) as 'Тип заказа'	
from sales;

create table orders (
	id int primary key not null auto_increment,
	employee_id varchar(5) not null,
	amount float(7,2) not null,
    order_status varchar(5) not null
);

insert into `orders` (employee_id, amount, order_status)
values 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

select 
	employee_id as 'Номер заказа',
	amount as 'Сумма заказа',
    case order_status 
		when 'OPEN' then 'Order is in open state'
		when 'CLOSED' then 'Order is closed'
		when 'CANCELLED' then 'Order is cancelled'
	end as 'full_order_status'	
from orders;
create database truYum;
use truYum;

create table menu_items (
	item_id int primary key,
    item_name varchar(50),
    price float,
    date_of_launch date not null,
    free_delivery varchar(3),
    active varchar(3)
);
create table users (
	user_id int primary key,
    user_name varchar(60),
    address varchar(60)
);
create table cart (
	cart_id int primary key,
    item_id int,
    user_id int,
    foreign key (user_id) references users(user_id),
    foreign key (item_id) references menu_items(item_id)
);

insert into menu_items values (1, 'Sandwich', 99.00, '2017-03-15', 'Yes', 'Yes');
insert into menu_items values (2, 'Burger', 129.00, '2017-12-23', 'No', 'yes');
insert into menu_items values  (3, 'Pizaa', 149.00, '2017-08-21', 'no', 'Yes');
insert into menu_items values  (4, 'french fries', 57.00, '2017-07-02', 'Yes', 'No');
insert into menu_items values  (5, 'chocolate brownie', 32.00, '2022-11-02', 'No', 'Yes');menu_items

select * from menu_items;

select * from menu_items where date_of_launch >= '2021-01-20' and active = 'Yes';

select item_name from menu_items where item_id = 5;

update menu_items set price = 150 where item_id = 2;
update menu_items set price = 100 where item_id = 3;


insert into users values (1, 'abi', 'chennai');
insert into users values (2, 'bala', 'coimbatore');

insert into cart values (1, 2, 1), (2, 3, 1), (3, 5, 1);

select a.item_name from menu_items as a join cart as b on a.item_id = b.item_id where b.user_id = 1;

select sum(a.price) from menu_items as a join cart as b on a.item_id = b.item_id where b.user_id = 1;

delete from cart where user_id = 1 and item_id = 3;
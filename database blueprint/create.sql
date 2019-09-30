drop database mypersonalchef;

create database if not exists mypersonalchef;	

use  mypersonalchef;

CREATE TABLE users (
    user_id integer primary key AUTO_INCREMENT,
    pswd blob NOT NULL,
    first_name varchar(32) not null,
    last_name varchar(32) not null,
	email_id varchar(64) not null,
    mobile_no bigint not null,
    street1 varchar(64) not null,
    street2 varchar(64) not null,
    city varchar(32) not null,
    state varchar(2) not null,
    zipcode varchar(8) not null,
    valid boolean
    
);

select * from users;

create table if not exists orders(
order_id INT AUTO_INCREMENT,
user_id INT,
order_date date,
price DECIMAL(6,2),
delivered boolean,
PRIMARY KEY (order_id),
FOREIGN KEY (user_id) REFERENCES users(user_id));

select * from orders;

create table cuisines(
cusine_id int auto_increment,
cusine_name varchar(64),
primary key (cusine_id));
 
create table if not exists recipes(
recipe_id int auto_increment,
cuisine_id int,
recipe_name varchar(64),
veg boolean,
remarks varchar(256),
primary key ( recipe_id ) ,
foreign key ( cuisine_id ) references cuisines(cusine_id) );

create table if not exists order_details(
order_id int ,
recipe_id int ,
quantity int,
primary key ( order_id , recipe_id ),
foreign key (order_id) references orders(order_id),
foreign key ( recipe_id) references recipes(recipe_id) );

create table if not exists ingredients(
ingredient_id int auto_increment,
ingredient_name varchar(64),
veg boolean,
remarks varchar(255),
primary key ( ingredient_id));

select * from ingredients;

create table if not exists recipe_content(
recipe_id int,
ingredient_id int,
primary key ( recipe_id , ingredient_id ) ,
foreign key ( recipe_id ) references recipes(recipe_id),
foreign key ( ingredient_id ) references ingredients(ingredient_id) );

show tables;

use  mypersonalchef;

alter table recipes 
add column price_kit DECIMAL(6,2),
add column price_readymade decimal(6,2);

select * from recipes;



alter table ingredients 
drop column veg;

show tables;
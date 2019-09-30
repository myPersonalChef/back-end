use mypersonalchef;

insert into cuisines(cusine_name)
values
	('Indian'),
    ('Chinese'),
    ('Mexican');
    

insert into recipes(cuisine_id,recipe_name,veg,remarks)
values
	(1,'Palak Paneer',1,'North Indian Spicy Delicious Gravy'),
    (1,'Mushroom Masala',1,'North Indian Dry Sabji');
    
insert into ingredients(ingredient_name,remarks)
values
	('Paneer','Cottage Cheese'),
    ('Tomato','Finely Chopped'),
    ('Onions','Finely Chopped'),
    ('Mushrooms','Chopped') ;

insert into recipe_content
values
	(1,1),
    (1,2),
    (1,3),
    (2,2),
    (2,3),
    (2,4);
 
  
 insert into users(pswd,first_name,last_name,email_id,mobile_no,street1,street2,city,state,zipcode,valid)
 values
 ( 'passowrd','Sukhada','Sheth','sukhada@gmail.com',1234567890,'Lake Street','apt','White Plains','NY',10604,1);
 	  
insert into orders(user_id,order_date,price,delivered)
values
(1,'2019-04-22',100,0);

insert into order_details(order_id,recipe_id,quantity)
values(1,1,2),(1,2,3);


select * from users;
select * from ingredients;
select * from recipe_content order by recipe_id; 
select * from cuisines;
select * from recipes;
select * from order_details;
select * from orders;


select u.user_id , first_name, o.order_id, quantity, recipe_name , ingredient_name 
from users as u join orders as o
on u.user_id = o.user_id
join order_details 
on o.order_id = order_details.order_id
join recipes
on order_details.recipe_id = recipes.recipe_id
join recipe_content
on recipe_content.recipe_id = recipes.recipe_id
join ingredients
on ingredients.ingredient_id = recipe_content.ingredient_id
where u.user_id = 1; 

select r.recipe_id , r.recipe_name , r.veg , r.remarks  'Recipe' ,
r.price_kit , r.price_Readymade , c.ingredient_id , i.ingredient_name , i.remarks as 'Ingredient Remark' from 
recipes as r join recipe_content as c 
on r.recipe_id = c.recipe_id 
join ingredients as i 
on i.ingredient_id = c.ingredient_id;

#where r.recipe_id = 1 ;

select * from orders;

#delete from order_details;
ALTER TABLE order_details AUTO_INCREMENT = 1;
#delete from orders;
ALTER TABLE orders AUTO_INCREMENT = 1;
#delete from recipe_content;
ALTER TABLE recipe_content AUTO_INCREMENT = 1;
#delete from recipes;
ALTER TABLE recipes AUTO_INCREMENT = 1;
#delete from ingredients;
ALTER TABLE ingredients AUTO_INCREMENT = 1;


select * from ingredients;
select * from recipes;


insert into ingredients(ingredient_name)
values ('Bhindi Spices'), 
('Biryani Gravy '), 
('Boiled Chickpeas'), 
('Boiled Vegetable Mix'), 
('Breads'), 
('Chole '), 
('Chooped Onions'), 
('Chopped Bhindi'), 
('Chopped Capsicum '), 
('Chopped Mix Vegetables'), 
('Chopped Onions'), 
('Cooked Chicken Pieces'), 
('Cooked Dal'), 
('Cream'), 
('Fired Onions'), 
('Indian Spice Mix'), 
('Lemons'), 
('Mushrooms'), 
('Paneer Cubes'), 
('Pavbhaji Indian Spice Mix'), 
('Peas'), 
('Semi Cooked Rice'), 
('Tomato Onion Gravy');


insert into recipes(cuisine_id, recipe_name, veg,price_kit,price_readymade)
values 
 (1 , ' Mushroom Masala ' , 1 , 6 , 10 ) , 
(1 , ' Chicken Dum Biryani ' , 0 , 10 , 15 ) , 
(1 , ' Butter Chicken ' , 0 , 10 , 15 ) , 
(1 , ' Chole  ' , 1 , 6 , 8 ) , 
(1 , ' Alo Paratha ' , 1 , 4 , 7 ) , 
(1 , ' Pav Bhaji ' , 1 , 10 , 15 ) , 
(1 , ' Bhindi Fry ' , 1 , 6 , 10 ) , 
(1 , ' Dal Makhni ' , 1 , 5 , 8 ) , 
(1 , ' Mix Veg ' , 1 , 7 , 10 ) ,
(1 , ' Mutter Paneer ' , 1 , 10 , 15 ) ;



select * from recipes;

select * from recipe_content;

DELETE FROM recipe_content where recipe_id =1 and 2;
DELETE FROM recipe_content where recipe_id =2;

insert into recipe_content(recipe_id , ingredient_id)
values  (10,19),
(10,21),
(10,23),
(10,11),
(10,16),
(10,14),
(1,18),
(1,23),
(1,11),
(1,16),
 ( 5 , 16 ) ,
 ( 5 , 21 ) ,
 ( 6 , 4 ) ,
 ( 6 , 11 ) ,
 ( 6 , 5 ) ,
 ( 6 , 17 ) ,
 ( 6 , 9 ) ,
 ( 6 , 20 ) ,
 ( 2 , 22 ) ,
 ( 2 , 2 ) ,
 ( 2 , 15 ) ,
 ( 2 , 16 ) ,
 ( 7 , 8 ) ,
 ( 7 , 1 ) ,
 ( 3 , 12 ) ,
 ( 3 , 23 ) ,
 ( 3 , 16 ) ,
 ( 8 , 13 ) ,
 ( 8 , 16 ) ,
 ( 8 , 23 ) ,
 ( 8 , 14 ) ,
 ( 4 , 3 ) ,
 ( 4 , 23 ) ,
 ( 4 , 16 ) ,
 ( 4 , 11 ) ,
 ( 9 , 10 ) ,
 ( 9 , 23 ) ,
 ( 9 , 16 ) ,
 ( 9 , 7 ) ,
 ( 9 , 14 );
 
 select * from recipe_content;
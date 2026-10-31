create database book_store;
use book_store;
select * from orders;
select * from books;
select * from customers;

-- 1) Retrieve all books in the "Fiction" genre:
select title from books
where genre= 'fiction';


-- 2) Find books published after the year 1950:
select title from books
where published_year>1950;

-- 3) List all customers from the Canada:
select name from customers
where country='canada';

-- 4) Show orders placed in November 2023:
select order_id from orders
where order_date between '2023-11-1' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select sum(stock) from books;

-- 6) Find the details of the most expensive book:
select * from books 
where price= (select max(price) from books);

-- 7) Show all customers who ordered more than 1 quantity of a book:
select customer_id from orders
where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select order_id from orders
where total_amount >20;

-- 9) List all genres available in the Books table:
select distinct(genre) from books;

-- 10) Find the book with the lowest stock:
select title from books 
where stock= (select min(stock) from books);

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) from orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select b.genre, count(o.book_id) from books b join orders o
on b.book_id=o.book_id
group by 1;


-- 2) Find the average price of books in the "Fantasy" genre:
select avg(price) from books 
where genre = 'fantasy';

-- 3) List customers who have placed at least 2 orders:
select c.customer_id,c.name,count(o.order_id) from customers c join orders o
on c.customer_id=o.customer_id
group by 1,2
having count(o.order_id)>=2;

-- 4) Find the most frequently ordered book:
select o.book_id, b.title, count(o.order_id) as order_count
from orders o
join books b on o.book_id=b.book_id
group by o.book_id, b.title
order by order_count desc limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select title, price from books 
group by 1,2
order by 2 desc 
limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select b.author , count(o.quantity) from books b join orders o on 
b.book_id=o.book_id
group by 1;


-- 7) List the cities where customers who spent over $30 are located:
select distinct c.city,o.total_amount from customers c join orders o 
on c.customer_id=o.customer_id
where o.total_amount> 30;

-- 8) Find the customer who spent the most on orders:
select c.customer_id,sum(o.total_amount) from customers c join orders o
on c.customer_id=o.customer_id
group by 1
order by 2 desc;
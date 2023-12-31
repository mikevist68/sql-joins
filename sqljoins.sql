/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT categories.name, products.name
FROM products
inner join categories ON categories.CategoryID = products.CategoryID
 WHERE categories.name = "computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.name, products.price, reviews.Rating
from products
inner join reviews on reviews.ProductID = products.ProductID
where Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, sum(sales.Quantity)
from employees 
inner join sales on employees.EmployeeID = sales.EmployeeID
group by employees.FirstName order by sum(sales.Quantity) desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select categories.name , departments.name
from categories
inner join departments on departments.DepartmentID = categories.DepartmentID
where categories.name = "appliances" or categories.name = "games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.name, sum(sales.Quantity), sum(sales.PricePerUnit*sales.Quantity)
from products
inner join sales on sales.ProductID = products.ProductID
where products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.Rating, reviews.Comment
from products
inner join reviews on reviews.ProductID = products.ProductID
where reviews. rating = 1 and products.Name = "visio tv";

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.name, sales.quantity
from employees
inner join sales on sales.EmployeeID = employees.EmployeeID
inner join products on sales.ProductID = products.ProductID
order by employees.EmployeeID, employees.FirstName, employees.LastName, products.name, sales.quantity;

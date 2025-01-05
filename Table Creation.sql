---- Creating Table Customers 
Create Table Customers(
  CustomerID INT PRIMARY KEY, 
  CustomerName varchar(20), 
  ContactName varchar(20), 
  Address varchar(50), 
  City varchar(20), 
  PostalCode varchar(20), 
  Country varchar(20)
);

-- Inserting into Table Customers
Insert into Customers 
values 
  (
    1, 'Alfred Futterkiste', 'Maria Anders', 
    'Obere Str. 57', 'Berlin', '12209 ', 
    'Germany'
  ), 
  (
    2, 'Ana Trujillo Emparedados y helados', 
    'Ana Trujillo', 'Avda. de la Constitución 2222', 
    'México D.F', '05021 ', 'Mexico'
  ), 
  (
    3, 'Antonio Moreno Taquería', 'Antonio Moreno', 
    'Mataderos 2312', 'México D.F', 
    '05023 ', 'Mexico'
  ), 
  (
    4, 'Around the Horn', 'Thomas Hardy', 
    '120 Hanover Sq', 'London', 'WA1 1DP ', 
    'UK'
  );
select 
  * 
from 
  Customers;
---- Creating Table Products 
Create Table Products(
  ProductID INT PRIMARY KEY, 
  ProductName varchar(20), 
  SupplierID INT, 
  CategoryID INT, 
  Unit varchar(20), 
  Price INT
);

-- Inserting into Table Products
Insert into Products 
values 
  (
    1, 'Chais', 1, 1, '10 boxes x 20 bags', 
    18
  ), 
  (
    2, 'Chang', 1, 1, '24 - 12 oz bottles', 
    19
  ), 
  (
    3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 
    10
  ), 
  (
    4, "Chef Anton's Cajun Seasoning", 
    2, 2, '48 - 6 oz jars', 22
  ), 
  (
    5, "Chef Anton's Gumbo Mix", 2, 2, 
    '36 boxes', 21.35
  );
select 
  * 
from 
  Products;
--Creating Table Employees
Drop 
  table Employees;
create table Employees (
  EmployeeID INT primary key, 
  LastName Varchar(20), 
  FirstName Varchar(20), 
  BirthDate date, 
  Notes varchar(100)
);
-- Inserting into Table Employees
Insert into Employees 
values 
  (
    1, 'Davolio', 'Nancy', '1968-12-08', 
    'Education includes a BA in psychology from Colorado State University. She also completed The Art of the Cold Call. Nancy is a member of Toastmasters International'
  ), 
  (
    2, 'Fuller', 'Andrew', '1952-02-19', 
    'Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association'
  ), 
  (
    3, 'Leverling', 'Janet', '1963-08-30', 
    'Janet has a BS degree in chemistry from Boston College. She has also completed a certificate program in food retailing management Janet was hired as a sales associate and was promoted to sales representative'
  ), 
  (
    4, 'Peacock', 'Margaret', '1958-09-19', 
    'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle'
  );

--Creating Table with Foreign Key

create table Orders(
  OrderID INT PRIMARY KEY, 
  EmployeeID INT Unique, 
  OrderDate date, 
  ShipperID int unique, 
  CustomerID INT, 
  constraint FK_Customer FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

---- Creating Table Customers 
Create Table Customers(CustomerID INT PRIMARY KEY, CustomerName varchar(20),ContactName varchar(20),Address varchar(50), City varchar(20),
    PostalCode varchar(20), Country varchar(20));

Insert into Customers  values(1 ,'Alfred Futterkiste' 	,'Maria Anders', 	'Obere Str. 57' ,	'Berlin', 	'12209 ',	'Germany' ),
    (2 ,'Ana Trujillo Emparedados y helados' 	,'Ana Trujillo', 	'Avda. de la Constitución 2222' ,	'México D.F', 	'05021 ',	'Mexico' ),
    (3 ,'Antonio Moreno Taquería' 	,'Antonio Moreno', 	'Mataderos 2312' ,	'México D.F', 	'05023 ',	'Mexico' ),
    (4  ,'Around the Horn' 	,'Thomas Hardy', 	'120 Hanover Sq' ,	'London', 	'WA1 1DP ',	'UK' );
    

select * from Customers;

---- Creating Table Products 
Create Table Products(ProductID INT PRIMARY KEY, ProductName varchar(20),SupplierID INT,CategoryID INT, Unit varchar(20),
   Price INT );

Insert into Products  values(1, 	'Chais' ,	1 ,	1 ,	'10 boxes x 20 bags' 	,18 ),
    (2, 	'Chang' ,	1 ,	1 ,	'24 - 12 oz bottles' 	,19 ),
    (3, 	'Aniseed Syrup' ,	1 ,	2 ,	'12 - 550 ml bottles' 	,10 ),
    (4, 	"Chef Anton's Cajun Seasoning" ,	2 ,	2 ,	'48 - 6 oz jars' 	,22 ), 
    (5 ,"Chef Anton's Gumbo Mix", 	2, 	2, 	'36 boxes', 	21.35 );
    

select * from Products;

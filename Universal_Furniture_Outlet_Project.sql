---PART 2--- 
----(d)----

---Creation of Tables---

CREATE TABLE Customer
(   Customer_account_number NUMBER(10) NOT NULL PRIMARY  KEY,     
    Customer_name VARCHAR2(30),
    Billing_address VARCHAR2(50),
    Contact NUMBER(10)
); 

CREATE TABLE Orders
(   Order_number NUMBER(10) NOT NULL PRIMARY KEY,
    Customer_account_number NUMBER(10),
    Delivery_Address VARCHAR2(40) DEFAULT NULL,
    CONSTRAINT OC_Customer_account_number_fk FOREIGN KEY (Customer_account_number) REFERENCES Customer(Customer_account_number)
); 


CREATE TABLE Furniture
(
    Item_Code  NUMBER(4) NOT NULL PRIMARY KEY,
    Description    VARCHAR2(30),
    Unit_Price   NUMBER(30),
    Quantity_in_Stock NUMBER(30) 
);


CREATE TABLE Truck
(   Vehicle_number NUMBER(6) NOT NULL PRIMARY KEY,
    Lic_plate_number NUMBER(10),
    Lic_exp_date DATE NOT NULL,
    Inspection_exp_date DATE NOT NULL,
    SSN NUMBER(10)
);
ALTER TABLE Truck
ADD CONSTRAINT fk_Truck_SSN
FOREIGN KEY (SSN)
REFERENCES Driver(SSN);    

CREATE TABLE Employee
(   SSN NUMBER(10) NOT NULL PRIMARY KEY,     
    Emp_name VARCHAR2(20) NOT NULL,
    Emp_address VARCHAR2(30),
    Salary NUMBER(8,2) NOT NULL,
    Phone NUMBER(9),
    Employee_type VARCHAR2(20) CHECK (Employee_type IN ('Driver', 'Sales_reps'))
);


CREATE TABLE Driver
(   SSN NUMBER(10) NOT NULL PRIMARY KEY,
    Driver_license NUMBER(10) NOT NULL,
    DL_exp_date DATE,
    CONSTRAINT DE_SSN_fk FOREIGN KEY (SSN) REFERENCES Employee(SSN)   
);


CREATE TABLE Sales_reps
(   Commission VARCHAR2(3),
    SSN NUMBER(10) NOT NULL PRIMARY KEY,
    Order_number NUMBER(10) NOT NULL,
    CONSTRAINT Sales_reps_Employee_fk FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    CONSTRAINT Sales_reps_Orders_fk FOREIGN KEY (Order_number) REFERENCES Orders(Order_number)
);


CREATE TABLE Order_Item
(
    Item_Code NUMBER(10),
    Order_number NUMBER(10),
    Quantity NUMBER(4),
    CONSTRAINT Order_Item_Item_code_fk FOREIGN KEY(Item_Code)REFERENCES Furniture(Item_Code),
    CONSTRAINT Order_Item_Order_number_fk FOREIGN KEY(Order_number)REFERENCES Orders(Order_number)
);
    
    
CREATE TABLE Shipment
(   Shipment_ID NUMBER(4) NOT NULL PRIMARY KEY,
    Vehicle_number NUMBER(6),
    Order_number NUMBER(10) NOT NULL,
    CONSTRAINT ST_Order_number_fk FOREIGN KEY(Order_number)REFERENCES Orders(Order_number),
    CONSTRAINT ST_Vehicle_number_fk FOREIGN KEY(Vehicle_number)REFERENCES Truck(Vehicle_number)
);


----Inserting Values into Tables----

INSERT INTO Customer VALUES(1000380001,'John Smith','Arlington,TX,US',6833486487);
INSERT INTO Customer VALUES(1000324302,'Max Jones','703,Arlington,TX,US',6853486205);
INSERT INTO Customer VALUES(1003240003,'Ashley James','Forthworth,TX,US',6833876487);
INSERT INTO Customer VALUES(1000000384,'Thomas Maxwel','Dallas,TX,US',6833486753);
INSERT INTO Customer VALUES(1042000005,'Albert Edison','San Antonio,TX,US',6833486129);
INSERT INTO Customer VALUES(1000045746,'Jane Doe','Austin,TX,US',6837486098);

INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (451,1000380001);
INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (452,1000324302); 
INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (453,1003240003); 
INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (454,1000000384); 
INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (455,1042000005); 
INSERT INTO Orders (Order_number,Customer_account_number)
VALUES (456, 1000045746);


INSERT INTO Furniture VALUES(1000,'Chair',50,130);
INSERT INTO Furniture VALUES(1001,'Desk',100,150);
INSERT INTO Furniture VALUES(1002,'Sofa',1000,200);
INSERT INTO Furniture VALUES(1003,'Recliner',400,100);
INSERT INTO Furniture VALUES(1004,'Bed_Frame',600,30);
INSERT INTO Furniture VALUES(1005,'Book_shelf',250,75);


INSERT INTO Truck VALUES(104631, 1233244490, TO_DATE('2023-07-26', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'),1234567890);
INSERT INTO Truck VALUES(123481, 2343252901, TO_DATE('2024-05-23', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'),3456789012);
INSERT INTO Truck VALUES(132451, 1654646464, TO_DATE('2025-09-29', 'YYYY-MM-DD'), TO_DATE('2026-08-04', 'YYYY-MM-DD'),5678901234);


INSERT INTO Employee VALUES (1234567890, 'John Doe', '1234 Main St, Anytown', 50000.00, 987654321,'Driver');
INSERT INTO Employee VALUES (2345678901, 'Jane Smith', '4321 Elm St, Newtown', 55000.00, 876543210,'Sales_reps');
INSERT INTO Employee VALUES (3456789012, 'Alice Johnson', '789 Pine Ave, Oldtown', 60000.00, 765432109,'Driver');
INSERT INTO Employee VALUES (4567890123, 'Bob Brown', '101 Oak Rd, Westcity', 45000.00, 654321098,'Sales_reps');
INSERT INTO Employee VALUES (5678901234, 'Charlie Green', '202 Maple Blvd, Eastville', 65000.00, 543210987,'Driver');
INSERT INTO Employee VALUES (6789012345, 'Diana White', '303 Birch Ln, Southtown', 70000.00, 432109876,'Sales_reps');


INSERT INTO Driver VALUES (1234567890, 1328478240, TO_DATE('2023-11-26', 'YYYY-MM-DD'));
INSERT INTO Driver VALUES (3456789012, 3264286745, TO_DATE('2024-05-15', 'YYYY-MM-DD'));
INSERT INTO Driver VALUES (5678901234, 4567890123, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

INSERT INTO Sales_Reps VALUES(20,2345678901,452);
INSERT INTO Sales_Reps VALUES(10,6789012345,451);
INSERT INTO Sales_Reps VALUES(30,4567890123,455);

INSERT INTO Order_Item VALUES(1001,451,5);
INSERT INTO Order_Item VALUES(1002,452,15);
INSERT INTO Order_Item VALUES(1003,453,12);
INSERT INTO Order_Item VALUES(1004,454,10);
INSERT INTO Order_Item VALUES(1005,455,60);
INSERT INTO Order_Item VALUES(1000,456,100);


INSERT INTO Shipment VALUES(1087,104631,451);
INSERT INTO Shipment VALUES(1088,132451,452);
INSERT INTO Shipment VALUES(1089,123481,453);

---Describing the Tables using "Describe" Command---
---Displaying Table content using "SELECT" Command---

Describe Customer;
SELECT * FROM Customer;

Describe Orders;
SELECT * FROM Orders;

Describe Furniture;
SELECT * FROM Furniture;

Describe Truck;
SELECT * FROM Truck;

Describe Employee;
SELECT * FROM Employee;

Describe Driver;
SELECT * FROM Driver;

Describe Sales_reps;
SELECT * FROM Sales_reps;

Describe Order_Item;
SELECT * FROM Order_Item;

Describe Shipment;
SELECT * FROM Shipment;

---Granting Permission of "SELECT" of tables to TA and Professor---

GRANT SELECT ON Customer TO dxr5351;
GRANT SELECT ON Driver TO dxr5351;
GRANT SELECT ON Employee TO dxr5351;
GRANT SELECT ON Furniture TO dxr5351;
GRANT SELECT ON Orders TO dxr5351;
GRANT SELECT ON Sales_reps TO dxr5351;
GRANT SELECT ON Shipment TO dxr5351;
GRANT SELECT ON Truck TO dxr5351;
GRANT SELECT ON Order_Item to dxr5351;

GRANT SELECT ON Customer TO guz;
GRANT SELECT ON Driver TO guz;
GRANT SELECT ON Employee TO guz;
GRANT SELECT ON Furniture TO guz;
GRANT SELECT ON Orders TO guz;
GRANT SELECT ON Sales_reps TO guz;
GRANT SELECT ON Shipment TO guz;
GRANT SELECT ON Truck TO guz;
GRANT SELECT ON Order_Item to guz;


---PART 2---
----(e)----


---Solution 1---
SELECT Customer_name, Billing_address, Contact
FROM Customer;


---Solution 2---
SELECT o.Order_number, o.Delivery_Address, c.Customer_name, c.Billing_address, c.Contact,
       oi.Item_Code, f.Description, f.Unit_Price, oi.Quantity
FROM Orders o
JOIN Customer c ON o.Customer_account_number = c.Customer_account_number
JOIN Order_Item oi ON o.Order_number = oi.Order_number
JOIN Furniture f ON oi.Item_Code = f.Item_Code
WHERE o.Order_number = 451; 

---Solution 3---
SELECT e.Phone
FROM Employee e
JOIN Sales_reps s ON e.SSN = s.SSN
JOIN Orders o ON s.Order_number = o.Order_number
WHERE o.Order_number = 451; 


---Solution 4---
SELECT c.Customer_name, c.Billing_address, c.Contact
FROM Customer c
JOIN Orders o ON c.Customer_account_number = o.Customer_account_number
JOIN Shipment s ON o.Order_number = s.Order_number
JOIN Truck t ON s.Vehicle_number = t.Vehicle_number
JOIN Driver d ON t.SSN = d.SSN
WHERE d.SSN = 5678901234; 


---Solution 5---
SELECT f.Description, f.Unit_Price, f.Quantity_in_Stock, (f.Quantity_in_Stock * f.Unit_Price) AS Total_Value
FROM Furniture f
WHERE f.Unit_Price > 25;




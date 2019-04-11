CREATE TABLE Branch (
  Branch_id int NOT NULL CHECK (Branch_id > 0),
  Branch_name varchar(255),
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State char(2) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  Telephone_no char(10),
  Sales_tax DECIMAL(5,4) NOT NULL CHECK (Sales_tax BETWEEN 0.0000 AND 1.0000),
  PRIMARY KEY (Branch_id)
);

INSERT INTO Branch (Branch_id, Branch_name, Street, Apt, State, City, Zipcode, Telephone_no, Sales_tax)
VALUES
  (3, 'BranchA', 'Renwick Drive', 'A', 'OH', 'Columbus', '19714', '5555555555', 0.0700),
  (1, 'BranchB', 'Cooper Drive', NULL, 'AZ', 'Pheonix', '83292', '1234567890', 0.0820),
  (2, 'BranchC', 'Norton Avenue', 'C', 'WA', 'Cleveland', '12304', '5555555555', 0.0650);

CREATE TABLE Department (
  Dept_id int NOT NULL CHECK (Dept_id > 0),
  Dept_type char(1) NOT NULL CHECK (Dept_type='o' OR Dept_type='f' OR Dept_type='w' OR Dept_type='s'),
  Branch_id int NOT NULL CHECK (Branch_id > 0),
  Mgr_employee_id int CHECK (Mgr_employee_id > 0),
  Primary_contact int CHECK (Primary_contact > 0),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
  FOREIGN KEY (Mgr_employee_id) REFERENCES Employee(Employee_id)
  FOREIGN KEY (Primary_contact) REFERENCES Employee(Employee_id)
);

INSERT INTO Department (Dept_id, Dept_type, Branch_id, Mgr_employee_id, Primary_contact)
VALUES
  (52, 's', 3, 1, 4),
  (53, 'w', 3, 2, 2),
  (54, 'f', 1, 3, 4),
  (55, 'o', 1, 4, 4);
--
CREATE TABLE Customer (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  First_Name varchar(255),
  Middle_Name varchar(255),
  Last_Name varchar(255),
  Discount DECIMAL(5,4) NOT NULL DEFAULT 0.0000 CHECK (Discount BETWEEN 0.0000 AND 1.0000),
  Tax_exempt BOOlEAN NOT NULL DEFAULT FALSE,
  Branch_id int NOT NULL CHECK (Branch_id > 0),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

INSERT INTO Customer (Cust_id, First_Name, Middle_Name, Last_Name, Discount, Tax_exempt, Branch_id)
VALUES
  (5622, 'Sam', 'Bob','Cool', 0.0000, TRUE, 1),
  (823, 'Bo', 'Jim', 'Jamison', 0.0500, FALSE, 3),
  (9102, 'Ivan', 'Christopher', 'Unkrich', 0.0000, FALSE, 3);

CREATE TABLE Customer_address (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State varchar(255) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  is_shipping BOOLEAN NOT NULL DEFAULT FALSE,
  is_billing BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_address (Cust_id, Street, Apt, State, City, Zipcode, is_shipping, is_billing)
VALUES
  (5622, 'Acorn Street', 'A', 'OH', 'Columbus', '43210', TRUE, TRUE),
  (823, 'Jackson St', NULL, 'AZ', 'Pheonix', '34821', TRUE, TRUE),
  (5622, 'Woodruff Ave', NULL, 'WA', 'Seattle', '24921', FALSE, FALSE);

CREATE TABLE Customer_fax (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_fax (Cust_id, Fax_no)
VALUES
  (5622, '1234567890'),
  (823, '4333477423'),
  (9102, '8329103823')

CREATE TABLE Customer_phone (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_phone (Cust_id, Phone_no, is_primary)
VALUES
  (823, '1234567890', TRUE),
  (823, '5555555555', FALSE),
  (9102, '9234276894', TRUE);

CREATE TABLE Customer_email (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_email (Cust_id, Email, is_primary)
VALUES
  (5622, 'scool@email.com', TRUE),
  (9102, 'kev.unkrich@gmail.com', TRUE),
  (823, 'bojam@gmail.com', TRUE);

CREATE TABLE Customer_contact (
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Name varchar(255),
  Phone_number char(10),
  Email_address varchar(255),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_contact (Cust_id, Name, Phone_number, Email_address)
VALUES
  (5622, 'Alex Tibble', '1234567890', 'atibs@email.com'),
  (5622, 'Dan Chips', '6555555859', 'd.chips@gmail.com'),
  (823, 'Chris Walker', '4549890394', 'clare.fitz@gmail.com')
--
CREATE TABLE Manufacturer (
  Name varchar(255) NOT NULL,
  PRIMARY KEY (Name)
);

INSERT INTO Manufacturer (Name)
VALUES
  ('Manufacturer inc.'),
  ('Manufacturing R Us'),
  ('Manufacture More');

CREATE TABLE Manufacturer_address (
  Man_name varchar(255) NOT NULL,
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State char(2) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  is_shipping BOOLEAN NOT NULL DEFAULT FALSE,
  is_billing BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_address (Man_name, Street, Apt, State, City, Zipcode, is_shipping, is_billing)
VALUES
  ('Manufacturer inc.', 'Apple Street', 'A', 'OH', 'Columbus', '43210', TRUE, TRUE),
  ('Manufacturing R Us', 'Woodruff Ave.', NULL, 'OH', 'Cleveland', '48292', TRUE, TRUE),
  ('Manufacture More', 'Greystone', 'D', 'OH', 'Columbus', '32812', TRUE, TRUE);

CREATE TABLE Manufacturer_fax (
  Man_name varchar(255) NOT NULL,
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_fax (Man_name, Fax_no)
VALUES
  ('Manufacturer inc.', '1234567890'),
  ('Manufacturer inc.','5555555555'),
  ('Manufacture More','6555555859');

CREATE TABLE Manufacturer_phone (
  Man_name varchar(255) NOT NULL,
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_phone (Man_name, Phone_no, is_primary)
VALUES
  ('Manufacture More', '1234567890', TRUE),
  ('Manufacturing R Us', '6555555859', TRUE),
  ('Manufacturing R Us', '5326339008', TRUE);

CREATE TABLE Manufacturer_email (
  Man_name varchar(255) NOT NULL,
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_email (Man_name, Email, is_primary)
VALUES
  ('Manufacturer inc.', 'maninc@gmail.com', TRUE),
  ('Manufactuerer inc.', 'manfac@gmail.com', TRUE),
  ('Manufacture More', 'manmore@gmail.com', TRUE);

CREATE TABLE Manufacturer_contact (
  Man_name varchar(255) NOT NULL,
  Name varchar(255),
  Phone_number char(10),
  Email_address varchar(255),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_contact (Man_name, Name, Phone_number, Email_address)
VALUES
  ('Manufacturer inc.', 'John Collins', '1234567890', 'jcollins@email.com'),
  ('Manufacture More', 'Terry Crew', '1234567888', 'crewt@email.com'),
  ('Manufacturing R Us', 'Ryan Smith', '1111567890', 'ry.smith@email.com');
--
CREATE TABLE Part (
  Part_no int NOT NULL CHECK (Part_no > 0),
  Part_name varchar(255),
  Reorder_cap int NOT NULL DEFAULT 0 CHECK (Reorder_cap >= 0),
  PRIMARY KEY(Part_no)
);

INSERT INTO Part (Part_no, Part_name, Reorder_cap)
VALUES
  (123, 'PartA', 500),
  (456, 'PartB', 50),
  (789, 'PartC', 1000);

CREATE TABLE Product (
  Prod_no int NOT NULL CHECK (Prod_no > 0),
  Prod_name varchar(255),
  Sale_price DECIMAL(12, 2) NOT NULL CHECK (Sale_price > 0000000000.00),
  Route_no int NOT NULL CHECK (Route_no > 0),
  Bom_id int NOT NULL CHECK (Bom_id > 0),
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id)
);

INSERT INTO Product (Prod_no, Prod_name, Sale_price, Route_no, Bom_id)
VALUES
  (909, 'motorA', 0000000089.99, 31, 4455),
  (808, 'motorB', 0000000400.39, 32, 2233),
  (707, 'motorC', 0000000115.32, 33, 7788);

CREATE TABLE BoM (
  Bom_id int NOT NULL CHECK (Bom_id > 0),
  PRIMARY KEY (Bom_id)
);

INSERT INTO BoM (Bom_id)
VALUES
  (4455),
  (2233),
  (7788);

CREATE TABLE Payment (
  Payment_no int NOT NULL CHECK (Payment_no > 0),
  Payment_amount DECIMAL(12,2) NOT NULL CHECK (Payment_amount > 0000000000.00),
  Payment_date DATE NOT NULL DEFAULT CURDATE()  CHECK (Payment_date <= CURDATE()),
  Invoice_no int NOT NULL CHECK (Invoice_no > 0),
  PRIMARY KEY (Payment_no),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no)
);

INSERT INTO Payment (Payment_no, Payment_amount, Payment_date, Invoice_no)
VALUES
  (74, 32.99, '2019-05-13', 321),
  (75, 312.93, '2019-11-07', 321),
  (83, 343.39, '2018-05-13', 344);

CREATE TABLE Order (
  Order_no int NOT NULL CHECK (Order_no > 0),
  Description varchar(1000) NOT NULL,
  Date_ordered DATE NOT NULL DEFAULT CURDATE() CHECK (Date_ordered <= CURDATE()),
  Total_price DECIMAL(12, 2) NOT NULL CHECK (Total_price >= 0000000000.00),
  Approved_denied BOOLEAN,
  Reason varchar(255),
  Cust_id int NOT NULL CHECK (Cust_id > 0),
  Invoice_no int NOT NULL CHECK (Invoice_no > 0),
  Salesperson_id int CHECK (Salesperson_id > 0),
  PRIMARY KEY (Order_no),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no),
  FOREIGN KEY (Salesperson_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Order (Order_no, Date_ordered, Approved_denied, Reason, Cust_id, Invoice_no, Salesperson_id)
VALUES
  (111111, '2019-05-13', TRUE, NULL, 5622, 321, 1),
  (222222, 2012-08-08, TRUE, NULL, 823, 344, 1),
  (333333, 2002-03-08, FALSE, 'Insufficient Inventory', 232, 232, NULL);

CREATE TABLE Routing_sheet (
  Route_no int NOT NULL CHECK (Route_no > 0),
  PRIMARY KEY (Route_no)
);

INSERT INTO Routing_sheet (Route_no)
VALUES
  (31),
  (32),
  (33);
  
CREATE TABLE Assembly_stage (
  Route_no int NOT NULL CHECK (Route_no > 0),
  Stage_no int  NOT NULL CHECK (Stage_no > 0),
  Description varchar(1000) NOT NULL,
  Expected_duration TIME NOT NULL,
  Start_time TIME DEFAULT CURRENT_TIME(),
  End_time TIME,
  PRIMARY KEY (Route_no, Stage_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no)
);

INSERT INTO Assembly_stage (Route_no, Stage_no, Expected_duration, Start_time, End_time)
VALUES
  (31, 1, '00:15:00','02:15:00','02:30:00'),
  (31, 2, '01:00:00','03:15:00','04:45:00'),
  (32, 1, '00:40:00','01:15:00','01:45:00');

CREATE TABLE Invoice (
  Invoice_no int NOT NULL CHECK (Invoice_no > 0),
  Due_date DATE NOT NULL,
  Date_shipped DATE,
  PRIMARY KEY (Invoice_no)
);

INSERT INTO Invoice (Invoice_no, Due_date, Date_shipped)
VALUES
  (321, 2019-06-13, 2019-05-13),
  (335, 2017-09-29, 2017-09-12),
  (344, 2018-12-11, 2018-10-18);

CREATE TABLE Employee (
  Employee_id int NOT NULL CHECK (Employee_id > 0),
  Employee_type char(1) NOT NULL CHECK (Dept_type='o' OR Dept_type='f' OR Dept_type='w' OR Dept_type='s'),
  Dept_id int NOT NULL CHECK (Dept_id > 0),
  First_Name varchar(255) NOT NULL,
  Middle_Name varchar(255),
  Last_Name varchar(255) NOT NULL,
  Gender char(1) CHECK (Gender='m' OR Gender='f'),
  Birth_date DATE NOT NULL,
  SSN varchar(9) NOT NULL,
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State char(2) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  Mobile_phone_no char(10),
  Home_phone_no char(10),
  Work_phone_no char(10),
  Marital_status BOOLEAN,
  Job_title varchar(255) NOT NULL,
  Part_dental BOOLEAN NOT NULL DEFAULT FALSE,
  Part_vision BOOLEAN NOT NULL DEFAULT FALSE,
  Part_health BOOLEAN NOT NULL DEFAULT FALSE,
  401k DECIMAL(5,4) NOT NULL DEFAULT 0.0000 CHECK (401k BETWEEN 0.0000 AND 1.0000),
  Hours_vacation DECIMAL(5,2) NOT NULL CHECK (Hours_vacation >= 000.00),
  Hours_sick DECIMAL(5,2) NOT NULL CHECK (Hours_sick >= 000.00),
  Work_email varchar(255),
  Username varchar(255),
  Password varchar(255),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

INSERT INTO Employee (Employee_id, Employee_type, Dept_id, First_Name, Middle_Name, Last_Name, Gender, Birth_date, SSN, Street, Apt, State, City, Zipcode, Mobile_phone_no, Home_phone_no, Work_phone_no, Marital_status, Job_title, Part_dental, Part_vision, 401k, Hours_vacation, Hours_sick, Work_email, Username, Password)
VALUES
  (1, 's', 52, 'Jeff', 'Bob', 'Smith', 'm', '1967-05-13', '321543621', 'Apple Street', 'OH', 'Columbus', 43210, '5555555555', '8888888888', '9999999999', TRUE, 'salesperson', TRUE, FALSE, 0.0875, 013.00, 022.00, 'jeff.smith@email.com', 'jeffsmith', 'password'),
  (2, 'w', 53, 'Anthony', NULL, 'Bennett', 'm', '1984-06-09', '333224444', 'Orange Road', 'OH', 'Columbus', 43201, '762333444', NULL, NULL, FALSE, 'warehouse manager', TRUE, TRUE, 0.1000, 036.00, 008.00, 'ab23@email.com', 'ab23', 'wordpass'),
  (3, 'f', 54, 'Terra', 'Lee', 'Freeman', 'f', '1982-08-08', '111112345', 'Roader Street', 'AZ', 'Pheonix', 73494, '1446623323', NULL, '1231234444', TRUE, 'factory line worker', FALSE, FALSE, 0.0620, 000.00, 014.00, 'terraf@email.com', 'freemant', 'swordpa'),
  (4, 'o', 55, 'Gretta', 'NULL', 'Gill', 'f', '1990-07-04', '776776677', 'Oiler Street', 'AZ', 'Pheonix', 73494, NULL, '4423324444', '7227727722', FALSE, 'office coordinator', TRUE, TRUE, 0.0900, 024.00, 024.00, 'ggill@email.com', 'grettagill', 'passsss');

CREATE TABLE Dependent (
  Employee_id int NOT NULL CHECK (Employee_id > 0),
  Name varchar(255) NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State char(2),
  City varchar(255),
  Zipcode char(5),
  Phone_no char(10),
  Email_address varchar(255),
  PRIMARY KEY (Employee_id, Name),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Dependent (Employee_id, Name, Street, Apt, State, City, Zipcode, Phone_no, Email_address)
VALUES
  (1, 'Jack', 'Apple Street', 'A', 'OH', 'Columbus', '43210', '5555555555', 'jack.smith@email.com'),
  (1, 'Thomas', 'Green Street', NULL, 'OH', 'Cincinnati', '45140', '1234567899', NULL),
  (3, 'Sarah', NULL, NULL, NULL, NULL, NULL, '3245557777', 'Sarah44@yahoo.com');
--
CREATE TABLE Office_worker (
  Employee_id int NOT NULL CHECK (Employee_id > 0),
  Salary_amount DECIMAL(11,2) NOT NULL CHECK (Salary_amount > 000000000.00),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Office_worker (Employee_id, Salary_amount)
VALUES
  (4, 000075000.00);

CREATE TABLE Factory_worker (
  Employee_id int NOT NULL CHECK (Employee_id > 0),
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00 CHECK (Hours_worked >= 000.00),
  Hourly_rate DECIMAL(5,2)  NOT NULL CHECK (Hourly_rate >= 000.00),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Factory_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (3, 056.02, 022.99);

CREATE TABLE Warehouse_worker (
  Employee_id int NOT NULL,
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00 CHECK (Hours_worked >= 000.00),
  Hourly_rate DECIMAL(5,2)  NOT NULL CHECK (Hourly_rate >= 000.00),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Warehouse_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (2, 043.80, 012.22);

CREATE TABLE Salesperson (
  Employee_id int NOT NULL CHECK (Employee_id > 0),
  Salary_amount DECIMAL(11,2) NOT NULL CHECK (Salary_amount >= 000000000.00),
  Commission_rate DECIMAL(5,4) NOT NULL CHECK (Commission_rate BETWEEN 0.0000 AND 1.0000),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Salesperson (Employee_id, Salary_amount, Commission_rate)
VALUES
  (1, 000033333.23, 0.1000);
--
CREATE TABLE OrderContainsProduct (
  Order_no int NOT NULL CHECK (Order_no > 0),
  Prod_no int NOT NULL CHECK (Prod_no > 0),
  Quantity int NOT NULL CHECK (Quantity_no > 0),
  PRIMARY KEY (Order_no, Prod_no),
  FOREIGN KEY (Order_no) REFERENCES Order(Order_no),
  FOREIGN KEY (Prod_no) REFERENCES Product(Prod_no)
);

INSERT INTO OrderContainsProduct (Order_no, Prod_no, Quantity)
VALUES
  (111111,909,22),
  (111111,808,10),
  (222222,909,45);

CREATE TABLE BomContainsPart (
  Bom_id int NOT NULL CHECK (Bom_id > 0),
  Part_no int NOT NULL CHECK (Part_no > 0),
  Quantity int NOT NULL CHECK (Quantity > 0),
  PRIMARY KEY (Bom_id, Part_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no)
);

INSERT INTO BomContainsPart (Bom_id, Part_no, Quantity)
VALUES
  (4455,123,6),
  (4455,456,1),
  (2233,456,3),
  (2233,789,12);

CREATE TABLE ManufacturerMakesPart (
  Part_no int NOT NULL CHECK (Part_no > 0),
  Man_name varchar(255) NOT NULL,
  Cost DECIMAL(11,2) NOT NULL CHECK (Cost >= 000000000.00),
  PRIMARY KEY (Part_no, Man_name),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO ManufacturerMakesPart (Part_no, Man_name, Cost)
VALUES
  (123, 'Manufacturer inc.', 54.99),
  (123, 'Manufacturing R Us', 44.79),
  (456, 'Manufacturing R Us', 28.99),
  (789, 'Manufacturing R Us', 234.89);

CREATE TABLE BranchStocksPart (
  Part_no int NOT NULL CHECK (Part_no > 0),
  Branch_id int NOT NULL CHECK (Branch_id > 0),
  Quantity int NOT NULL CHECK (Quantity > 0),
  PRIMARY KEY (Part_no, Branch_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

INSERT INTO BranchStocksPart (Part_no, Branch_id, Quantity)
VALUES
  (123,1,500),
  (456,1,225),
  (789,3,2500);

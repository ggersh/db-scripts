CREATE TABLE Branch (
  Branch_id int NOT NULL,
  Branch_name varchar(255),
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State char(2) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  Telephone_no char(10),
  Sales_tax DECIMAL(5,4) NOT NULL,
  PRIMARY KEY (Branch_id)
);

INSERT INTO Branch (Branch_id, Branch_name, Street, Apt, State, City, Zipcode, Telephone_no, Sales_tax)
VALUES
  (3, "BranchA", "Renwick Drive", "A", "OH", "Newark", "19714", '5555555555', 7.2),
  (),
  ()

CREATE TABLE Department (
  Dept_id int NOT NULL,
  Dept_type char(1) NOT NULL CHECK (Dept_type='o' OR Dept_type='f' OR Dept_type='w' OR Dept_type='s'),
  Branch_id int NOT NULL,
  Mgr_employee_id int,
  Primary_contact int,
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
  FOREIGN KEY (Mgr_employee_id) REFERENCES Employee(Employee_id)
  FOREIGN KEY (Primary_contact) REFERENCES Employee(Employee_id)
);

INSERT INTO Department (Dept_id, Dept_type, Branch_id, Mgr_employee_id, Primary_contact)
VALUES
  (1, 'o', 1, 1, 1),
  (),
  ()
--
CREATE TABLE Customer (
  Cust_id int NOT NULL,
  First_Name varchar(255),
  Middle_Name varchar(255),
  Last_Name varchar(255),
  Discount DECIMAL(5,4) NOT NULL DEFAULT 0.0000 CHECK (Discount <= 1.0000),
  Tax_exempt BOOlEAN NOT NULL DEFAULT FALSE,
  Branch_id int NOT NULL,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

INSERT INTO Customer (Cust_id, First_Name, Middle_Name, Last_Name, Discount, Tax_exempt, Branch_id)
VALUES
  (1, "Jeff", "Bob","Smith", 0.32, true, 1),
  (),
  ()

CREATE TABLE Customer_address (
  Cust_id int NOT NULL,
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
  (1, "Apple Street", "A", "OH", "Columbus", "43210", true, true),
  (),
  ()

CREATE TABLE Customer_fax (
  Cust_id int NOT NULL,
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_fax (Cust_id, Fax_no)
VALUES
  (1, '1234567890'),
  (),
  ()

CREATE TABLE Customer_phone (
  Cust_id int NOT NULL,
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_phone (Cust_id, Phone_no, is_primary)
VALUES
  (1, '1234567890', true),
  (),
  ()

CREATE TABLE Customer_email (
  Cust_id int NOT NULL,
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_email (Cust_id, Email, is_primary)
VALUES
  (1, "jeff.smith@email.com", true),
  (),
  ()

CREATE TABLE Customer_contact (
  Cust_id int NOT NULL,
  Name varchar(255),
  Phone_number char(10),
  Email_address varchar(255),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_contact (Cust_id, Name, Phone_number, Email_address)
VALUES
  (1, "Jim Smith", '1234567890', "jeff.smith@email.com"),
  (),
  ()
--
CREATE TABLE Manufacturer (
  Name varchar(255) NOT NULL,
  PRIMARY KEY (Name)
);

INSERT INTO Manufacturer (Name)
VALUES
  ("Manufacturer inc."),
  (),
  ()

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
  ("Manufacturer inc.", "Apple Street", "A", "Columbus", "43210", true, true),
  (),
  ()

CREATE TABLE Manufacturer_fax (
  Man_name varchar(255) NOT NULL,
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_fax (Man_name, Fax_no)
VALUES
  ("Manufacturer inc.", '1234567890'),
  (),
  ()

CREATE TABLE Manufacturer_phone (
  Man_name varchar(255) NOT NULL,
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_phone (Man_name, Phone_no, is_primary)
VALUES
  ("Manufacturer inc.", '1234567890', true),
  (),
  ()

CREATE TABLE Manufacturer_email (
  Man_name varchar(255) NOT NULL,
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_email (Man_name, Email, is_primary)
VALUES
  ("Manufacturer inc.", "jeff.smith@gmail.com", true),
  (),
  ()

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
  ("Manufacturer inc.", "Jeff Smith", '1234567890', "jeff.smith@email.com"),
  (),
  ()
--
CREATE TABLE Part (
  Part_no int NOT NULL,
  Part_name varchar(255),
  Reorder_cap int NOT NULL DEFAULT 0,
  PRIMARY KEY(Part_no)
);

INSERT INTO Part (Part_no, Part_name, Reorder_cap)
VALUES
  (1, "PartA", 1),
  (),
  ()

CREATE TABLE Product (
  Prod_no int NOT NULL,
  Prod_name varchar(255),
  Sale_price DECIMAL(12, 2) NOT NULL,
  Route_no int NOT NULL,
  Bom_id int NOT NULL,
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id)
);

INSERT INTO Product (Prod_no, Prod_name, Sale_price, Route_no, Bom_id)
VALUES
  (1, "motorA", 54.99, 1, 1),
  (),
  ()

CREATE TABLE BoM (
  Bom_id int NOT NULL,
  PRIMARY KEY (Bom_id)
);

INSERT INTO BoM (Bom_id)
VALUES
  (1),
  (),
  ()

CREATE TABLE Payment (
  Payment_no int NOT NULL,
  Payment_amount DECIMAL(12,2) NOT NULL,
  Payment_date DATE NOT NULL,
  Invoice_no int NOT NULL,
  PRIMARY KEY (Payment_no),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no)
);

INSERT INTO Payment (Payment_no, Payment_amount, Payment_date, Invoice_no)
VALUES
  (1, 32.99, 2019-05-13, 1),
  (),
  ()

CREATE TABLE Order (
  Order_no int NOT NULL,
  Date_ordered DATE NOT NYLL,
  Approved_denied BOOLEAN,
  Reason varchar(255),
  Cust_id int NOT NULL,
  Invoice_no int NOT NULL,
  Salesperson_id int,
  PRIMARY KEY (Order_no),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Order (Order_no, Date_ordered, Approved_denied, Reason, Cust_id, Invoice_no, Salesperson_id)
VALUES
  (1, 2019-05-13, false, "Scratches on surface", 1, 1, 1),
  (),
  ()

CREATE TABLE Routing_sheet (
  Route_no int NOT NULL,
  PRIMARY KEY (Route_no),
);

INSERT INTO Routing_sheet (Route_no)
VALUES
  (1),
  (),
  ()

CREATE TABLE Assembly_stage (
  Route_no int NOT NULL,
  Stage_no int  NOT NULL,
  Expected_duration TIME NOT NULL,
  Start_time TIME,
  End_time TIME,
  PRIMARY KEY (Route_no, Stage_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no)
);

INSERT INTO Assembly_stage (Route_no, Stage_no, Expected_duration, Start_time, End_time)
VALUES
  (1,1, '10:15:00','02:15:00','083000', '104500'),
  (),
  ()

CREATE TABLE Invoice (
  Invoice_no int NOT NULL,
  Due_date DATE NOT NULL,
  Date_shipped DATE,
  PRIMARY KEY (Invoice_no)
);

INSERT INTO Invoice (Invoice_no, Term, Date_shipped)
VALUES
  (1, 2019-03-13, 2019-05-13),
  (),
  ()

CREATE TABLE Employee (
  Employee_id int NOT NULL,
  Employee_type char(1) NOT NULL CHECK (Dept_type='o' OR Dept_type='f' OR Dept_type='w' OR Dept_type='s'),
  Dept_id int NOT NULL,
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
  401k DECIMAL(5,4) NOT NULL DEFAULT 0.0000 CHECK (401k <= 0.10000),
  Hours_vacation DECIMAL(5,2),
  Hours_sick DECIMAL(5,2),
  Work_email varchar(255),
  Username varchar(255),
  Password varchar(255),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

INSERT INTO Employee (Employee_id, Employee_type, Dept_id, First_Name, Middle_Name, Last_Name, Gender, Birth_date, SSN, Street, Apt, State, City, Zipcode, Mobile_phone_no, Home_phone_no, Work_phone_no, Marital_status, Job_title, Part_dental, Part_vision, 401k, Hours_vacation, Hours_sick, Work_email, Username, Password)
VALUES
  (1, 'o', 1, "Jeff", "Bob", "Smith", "Male", 1967-05-13, 321543621, "Apple Street", "OH", "Columbus", 43210, '5555555555', '5555555555', '5555555555', "Married", "salesperson", true, true, 0.0875, 13, 7, "jeff.smith@email.com", "jeffsmith", "password"),
  (),
  ()

CREATE TABLE Dependent (
  Employee_id int NOT NULL,
  Name varchar(255) NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode char(5),
  Phone_no char(10),
  Email_address varchar(255),
  PRIMARY KEY (Employee_id, Name),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Dependent (Employee_id, Name, Street, Apt, State, City, Zipcode, Phone_no, Email_address)
VALUES
  (1, "Jeff", "Apple Street", "A", "OH", "Columbus", '43210', '5555555555', "jeff.smith@email.com"),
  (),
  ()
--
CREATE TABLE Office_worker (
  Employee_id int NOT NULL,
  Salary_amount DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Office_worker (Employee_id, Salary_amount)
VALUES
  (1, 333333.32),
  (),
  ()

CREATE TABLE Factory_worker (
  Employee_id int NOT NULL,
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00,
  Hourly_rate DECIMAL(5,2)  NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Factory_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (1, 2.02, 32.99),
  (),
  ()

CREATE TABLE Warehouse_worker (
  Employee_id int NOT NULL,
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00,
  Hourly_rate DECIMAL(5,2)  NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Warehouse_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (1, 2.02, 32.99),
  (),
  ()

CREATE TABLE Salesperson (
  Employee_id int NOT NULL,
  Salary_amount DECIMAL(11,2) NOT NULL,
  Commission_rate DECIMAL(5,4) NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Salesperson (Employee_id, Salary_amount, Commission_rate)
VALUES
  (1, 333333.23, 32.99),
  (),
  ()
--
CREATE TABLE OrderContainsProduct (
  Order_no int NOT NULL,
  Prod_no int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Order_no, Prod_no),
  FOREIGN KEY (Order_no) REFERENCES Order(Order_no),
  FOREIGN KEY (Prod_no) REFERENCES Product(Prod_no)
);

INSERT INTO OrderContainsProduct (Order_no, Prod_no, Quantity)
VALUES
  (1,1,1),
  (),
  ()

CREATE TABLE BomContainsPart (
  Bom_id int NOT NULL,
  Part_no int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Bom_id, Part_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no)
);

INSERT INTO BomContainsPart (Bom_id, Part_no, Quantity)
VALUES
  (1,1,1),
  (),
  ()

CREATE TABLE ManufacturerMakesPart (
  Part_no int NOT NULL,
  Man_name varchar(255) NOT NULL,
  Cost DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (Part_no, Man_name),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO ManufacturerMakesPart (Part_no, Man_name, Cost)
VALUES
  (1, "Manufacturer inc.", 54.99),
  (),
  ()

CREATE TABLE BranchStocksPart (
  Part_no int NOT NULL,
  Branch_id int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Part_no, Branch_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

INSERT INTO BranchStocksPart (Part_no, Branch_id, Quantity)
VALUES
  (1,1,1),
  (),
  ()

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
CREATE TABLE Customer_fax (
  Cust_id int NOT NULL,
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_phone (
  Cust_id int NOT NULL,
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_email (
  Cust_id int NOT NULL,
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_contact (
  Cust_id int NOT NULL,
  Name varchar(255),
  Phone_number char(10),
  Email_address varchar(255),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
--
CREATE TABLE Manufacturer (
  Name varchar(255) NOT NULL,
  PRIMARY KEY (Name)
);
CREATE TABLE Manufacturer_address (
  Man_name varchar(255) NOT NULL,
  Street varchar(255) NOT NULL,
  Apt varchar(255),
  State charchar(2) NOT NULL,
  City varchar(255) NOT NULL,
  Zipcode char(5) NOT NULL,
  is_shipping BOOLEAN NOT NULL DEFAULT FALSE,
  is_billing BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_fax (
  Man_name varchar(255) NOT NULL,
  Fax_no char(10) NOT NULL,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_phone (
  Man_name varchar(255) NOT NULL,
  Phone_no char(10) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_email (
  Man_name varchar(255) NOT NULL,
  Email varchar(255) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_contact (
  Man_name varchar(255) NOT NULL,
  Name varchar(255),
  Phone_number varchar(15),
  Email_address varchar(255),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
--
CREATE TABLE Part (
  Part_no int NOT NULL,
  Part_name varchar(255),
  Reorder_cap int NOT NULL DEFAULT 0,
  PRIMARY KEY(Part_no)
);
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
CREATE TABLE BoM (
  Bom_id int NOT NULL,
  PRIMARY KEY (Bom_id)
);
CREATE TABLE Payment (
  Payment_no int NOT NULL,
  Payment_amount DECIMAL(12,2) NOT NULL,
  Payment_date DATE NOT NULL,
  Invoice_no int NOT NULL,
  PRIMARY KEY (Payment_no),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no)
);
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
CREATE TABLE Routing_sheet (
  Route_no int NOT NULL,
  PRIMARY KEY (Route_no),
);
CREATE TABLE Assembly_stage (
  Route_no int NOT NULL,
  Stage_no int  NOT NULL,
  Expected_duration TIME NOT NULL,
  Start_time TIME,
  End_time TIME,
  PRIMARY KEY (Route_no, Stage_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no)
);
CREATE TABLE Invoice (
  Invoice_no int NOT NULL,
  Due_date DATE NOT NULL,
  Date_shipped DATE,
  PRIMARY KEY (Invoice_no)
);
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
  Mobile_phone_no varchar(10),
  Home_phone_no varchar(10),
  Work_phone_no varchar(10),
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
CREATE TABLE Dependent (
  Employee_id int NOT NULL,
  Name varchar(255) NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode char(5),
  Phone_no varchar(10),
  Email_address varchar(255),
  PRIMARY KEY (Employee_id, Name),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
--
CREATE TABLE Office_worker (
  Employee_id int NOT NULL,
  Salary_amount DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Factory_worker (
  Employee_id int NOT NULL,
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00,
  Hourly_rate DECIMAL(5,2)  NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Warehouse_worker (
  Employee_id int NOT NULL,
  Hours_worked DECIMAL(5,2) NOT NULL DEFAULT 000.00,
  Hourly_rate DECIMAL(5,2)  NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Salesperson (
  Employee_id int NOT NULL,
  Salary_amount DECIMAL(11,2) NOT NULL,
  Commission_rate DECIMAL(5,4) NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
--
CREATE TABLE OrderContainsProduct (
  Order_no int NOT NULL,
  Prod_no int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Order_no, Prod_no),
  FOREIGN KEY (Order_no) REFERENCES Order(Order_no),
  FOREIGN KEY (Prod_no) REFERENCES Product(Prod_no)
);
CREATE TABLE BomContainsPart (
  Bom_id int NOT NULL,
  Part_no int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Bom_id, Part_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no)
);
CREATE TABLE ManufacturerMakesPart (
  Part_no int NOT NULL,
  Man_name varchar(255) NOT NULL,
  Cost DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (Part_no, Man_name),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE BranchStocksPart (
  Part_no int NOT NULL,
  Branch_id int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (Part_no, Branch_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

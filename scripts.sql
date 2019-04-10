CREATE TABLE Branch (
  Branch_id int NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State char(2) NOT NULL,
  City varchar(255),
  Zipcode char(5),
  Telephone_no char(10),
  Sales_tax DECIMAL(5,4) NOT NULL,
  PRIMARY KEY (Branch_id)
);

INSERT INTO Branch (Branch_id, Street, Apt, State, City, Zipcode, Telephone_no, Sales_tax)
VALUES
  (3, "Renwick Drive", "A", "OH", "Newark", "19714", "484-309-3510", 7.2),
  (3, "Renwick Drive", "A", "OH", "Newark", "19714", "484-309-3510", 7.2),
  (3, "Renwick Drive", "A", "OH", "Newark", "19714", "484-309-3510", 7.2)


CREATE TABLE Department (
  Dept_id int NOT NULL,
  Dept_type char(1) NOT NULL CHECK (Dept_type='o' OR Dept_type='f' OR Dept_type='w' OR Dept_type='s'),
  Branch_id int NOT NULL,
  Mgr_employee_id int,
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
  FOREIGN KEY (Mgr_employee_id) REFERENCES Branch(Employee_id)
);

INSERT INTO Department (Dept_id, Dept_type, Branch_id, Mgr_employee_id)
VALUES
  (),
  (),
  ()

CREATE TABLE Office (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Branch(Branch_id),
);

INSERT INTO Office (Dept_id, Manager, Primary_contact)
VALUES
  (),
  (),
  ()

CREATE TABLE Factory (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Branch(Branch_id),
);

INSERT INTO Factory (Dept_id, Manager, Primary_contact)
VALUES
  (),
  (),
  ()

CREATE TABLE Warehouse (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id),
);

INSERT INTO Warehouse (Dept_id, Manager, Primary_contact)
VALUES
  (),
  (),
  ()

CREATE TABLE Sales (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id),
);

INSERT INTO Sales (Dept_id, Manager, Primary_contact)
VALUES
  (),
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

INSERT INTO Customer (Dept_id, Manager, Primary_contact)
VALUES
  (),
  (),
  ()

CREATE TABLE Customer_address (
  Cust_id int NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  is_shipping BOOLEAN NOT NULL DEFAULT FALSE,
  is_billing BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_address (Cust_id, Street, Apt, State, City, Zipcode, is_shipping, is_billing)
VALUES
  (),
  (),
  ()

CREATE TABLE Customer_fax (
  Cust_id int NOT NULL,
  Fax_no char(10),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_fax (Cust_id, Fax_no)
VALUES
  (),
  (),
  ()

CREATE TABLE Customer_phone (
  Cust_id int NOT NULL,
  Phone_no char(10),
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_phone (Cust_id, Phone_no, is_primary)
VALUES
  (),
  (),
  ()

CREATE TABLE Customer_email (
  Cust_id int NOT NULL,
  Email varchar(255),
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

INSERT INTO Customer_email (Cust_id, Email, is_primary)
VALUES
  (),
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
  (),
  (),
  ()
--
CREATE TABLE Manufacturer (
  Name varchar(255) NOT NULL,
  PRIMARY KEY (Name)
);

INSERT INTO Manufacturer (Name)
VALUES
  (),
  (),
  ()

CREATE TABLE Manufacturer_address (
  Man_name varchar(255) NOT NULL,
  Street varchar(255) NOT NULL,
  Apt varchar(255) NOT NULL,
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
  (),
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
  (),
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
  (),
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
  (),
  (),
  ()

CREATE TABLE Manufacturer_contact (
  Man_name varchar(255) NOT NULL,
  Name varchar(255),
  Phone_number varchar(15),
  Email_address varchar(255),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO Manufacturer_contact (Man_name, Name, Phone_number, Email_address)
VALUES
  (),
  (),
  ()
--
CREATE TABLE Part (
  Part_no int NOT NULL,
  Reorder_cap int,
  PRIMARY KEY(Part_no)
);

INSERT INTO Part (Part_no, Reorder_cap)
VALUES
  (),
  (),
  ()

CREATE TABLE Product (
  Prod_no int NOT NULL,
  Prod_name varchar(255),
  Sale_price DECIMAL(12, 2),
  Route_no int,
  Bom_id int,
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id)
);

INSERT INTO Product (Prod_no, Prod_name, Sale_price, Route_no, Bom_id)
VALUES
  (),
  (),
  ()

CREATE TABLE BoM (
  Bom_id int,
  PRIMARY KEY (Bom_id)
);

INSERT INTO BoM (Bom_id)
VALUES
  (),
  (),
  ()

CREATE TABLE Payment (
  Payment_no int,
  Payment_amount DECIMAL(100,4),
  Payment_date DATE,
  Invoice_no int,
  PRIMARY KEY (Payment_no),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no)
);

INSERT INTO Payment (Payment_no, Payment_amount, Payment_date, Invoice_no)
VALUES
  (),
  (),
  ()

CREATE TABLE Order (
  Order_no int,
  Date_ordered DATE,
  Approved_denied BOOLEAN,
  Reason varchar(255),
  Cust_id int NOT NULL,
  Invoice_no int,
  Employee_id int,
  PRIMARY KEY (Order_no),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Order (Order_no, Date_ordered, Approved_denied, Reason, Cust_id, Invoice_no, Employee_id)
VALUES
  (),
  (),
  ()

CREATE TABLE Routing_sheet (
  Route_no int,
  PRIMARY KEY (Route_no),
  FOREIGN KEY (Route_no) REFERENCES Product(Route_no)
);

INSERT INTO Routing_sheet (Route_no)
VALUES
  (),
  (),
  ()

CREATE TABLE Assembly_stage (
  Route_no int,
  Stage_no int,
  Expected_duration TIME,
  Start_time TIME,
  End_time TIME,
  Route_no int,
  PRIMARY KEY (Route_no),
  PRIMARY KEY (Stage_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no)
);

INSERT INTO Assembly_stage (Route_no, Stage_no, Expected_duration, Start_time, End_time, Route_no)
VALUES
  (),
  (),
  ()

CREATE TABLE Invoice (
  Invoice_no int,
  Term varchar(255),
  Date_shipped DATE,
  PRIMARY KEY (Invoice_no)
);

INSERT INTO Invoice (Invoice_no, Term, Date_shipped)
VALUES
  (),
  (),
  ()

CREATE TABLE Employee (
  Employee_id int,
  Employee_type varchar(255),
  First_Name varchar(255),
  Middle_Name varchar(255),
  Last_Name varchar(255),
  Gender varchar(255),
  Birth_date DATE,
  SSN varchar(9),
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  Mobile_phone_no varchar(15),
  Home_phone_no varchar(15),
  Work_phone_no varchar(15),
  Marital_status varchar(255),
  Job_title varchar(255),
  Part_dental varchar(255),
  Part_vision varchar(255),
  Part_health varchar(255),
  401k varchar(255),
  Hours_vacation int,
  Hours_sick int,
  Work_email varchar(255),
  Username varchar(255),
  Password varchar(255),
  PRIMARY KEY (Employee_id),
);

INSERT INTO Employee (Employee_id, Employee_type, First_Name, Middle_Name, Last_Name, Gender, Birth_date, SSN, Street, Apt, State, City, Zipcode, Mobile_phone_no, Home_phone_no, Work_phone_no, Marital_status, Job_title, Part_dental, Part_vision, 401k, Hours_vacation, Hours_sick, Work_email, Username, Password)
VALUES
  (),
  (),
  ()

CREATE TABLE Dependent (
  Employee_id int,
  Name varchar(255),
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  Phone_no varchar(15),
  Email_address varchar(255),
  PRIMARY KEY (Employee_id),
  PRIMARY KEY (Name),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Dependent (Employee_id, Name, Street, Apt, State, City, Zipcode, Phone_no, Email_address)
VALUES
  (),
  (),
  ()
--
CREATE TABLE Office_worker (
  Employee_id int,
  Salary_amount DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Office_worker (Employee_id, Salary_amount)
VALUES
  (),
  (),
  ()

CREATE TABLE Factory_worker (
  Employee_id int,
  Hours_worked int,
  Hourly_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Factory_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (),
  (),
  ()

CREATE TABLE Warehouse_worker (
  Employee_id int,
  Hours_worked int,
  Hourly_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Warehouse_worker (Employee_id, Hours_worked, Hourly_rate)
VALUES
  (),
  (),
  ()

CREATE TABLE Salesperson (
  Employee_id int,
  Salary_amount DECIMAL(7,2),
  Commission_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Salesperson (Employee_id, Salary_amount, Commission_rate)
VALUES
  (),
  (),
  ()
--
CREATE TABLE OrderContainsProduct (
  Order_no int,
  Prod_no int,
  Quantity int,
  PRIMARY KEY (Order_no),
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Order_no) REFERENCES Order(Order_no),
  FOREIGN KEY (Prod_no) REFERENCES Product(Prod_no)
);

INSERT INTO OrderContainsProduct (Order_no, Prod_no, Quantity)
VALUES
  (),
  (),
  ()

CREATE TABLE BomContainsPart (
  Bom_id int,
  Part_no int,
  Quantity int,
  PRIMARY KEY (Bom_id),
  PRIMARY KEY (Part_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no)
);

INSERT INTO BomContainsPart (Bom_id, Part_no, Quantity)
VALUES
  (),
  (),
  ()

CREATE TABLE ManufacturerMakesPart (
  Part_no int,
  Man_name varchar(255),
  Cost DECIMAL(10,2),
  PRIMARY KEY (Part_no),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);

INSERT INTO ManufacturerMakesPart (Part_no, Man_name, Cost)
VALUES
  (),
  (),
  ()

CREATE TABLE EmployeeWorksDepartment (
  Employee_id int,
  Dept_id int,
  Office_no int,
  PRIMARY KEY (Employee_id),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

INSERT INTO EmployeeWorksDepartment (Employee_id, Dept_id, Office_no)
VALUES
  (),
  (),
  ()

CREATE TABLE BranchStocksPart (
  Part_no int,
  Branch_id int,
  Quantity int,
  PRIMARY KEY (Part_no),
  PRIMARY KEY (Branch_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);

INSERT INTO BranchStocksPart (Part_no, Branch_id, Quantity)
VALUES
  (),
  (),
  ()

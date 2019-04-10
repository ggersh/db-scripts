CREATE TABLE Branch (
  Branch_id int NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  Telephone_no varchar(15),
  Sales_tax DECIMAL(3,4),
  PRIMARY KEY (Branch_id)
);
CREATE TABLE Department (
  Dept_id int NOT NULL,
  Dept_type varchar(255),
  Branch_id int NOT NULL,
  Mgr_employee_id int NOT NULL,
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id),
  FOREIGN KEY (Mgr_employee_id) REFERENCES Branch(Employee_id)
);
CREATE TABLE Office (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Branch(Branch_id),
);
CREATE TABLE Factory (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Branch(Branch_id),
);
CREATE TABLE Warehouse (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id),
);
CREATE TABLE Sales (
  Dept_id int NOT NULL,
  Manager varchar(255),
  Primary_contact varchar(255),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id),
);
--
CREATE TABLE Customer (
  Cust_id int NOT NULL,
  First_Name varchar(255),
  Middle_Name varchar(255),
  Last_Name varchar(255),
  Discount DECIMAL(10,4),
  Tax_exempt BOOlEAN,
  Branch_id int NOT NULL,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);
CREATE TABLE Customer_address (
  Cust_id int NOT NULL,
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  is_shipping BOOLEAN,
  is_billing BOOLEAN,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_fax (
  Cust_id int NOT NULL,
  Fax_no int,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_phone (
  Cust_id int NOT NULL,
  Phone_no varchar(15),
  is_primary BOOLEAN,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_email (
  Cust_id int NOT NULL,
  Email varchar(255),
  is_primary BOOLEAN,
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Customer_contact (
  Cust_id int NOT NULL,
  Name varchar(255),
  Phone_number varchar(15),
  Email_address varchar(255),
  PRIMARY KEY (Cust_id),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
--
CREATE TABLE Manufacturer (
  Name varchar(255),
  PRIMARY KEY (Name)
);
CREATE TABLE Manufacturer_address (
  Man_name varchar(255),
  Street varchar(255),
  Apt varchar(255),
  State varchar(255),
  City varchar(255),
  Zipcode int,
  is_shipping BOOLEAN,
  is_billing BOOLEAN,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Cust_id) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_fax (
  Man_name varchar(255),
  Fax_no int,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Cust_id) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_phone (
  Man_name varchar(255),
  Phone_no varchar(15),
  is_primary BOOLEAN,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Cust_id) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_email (
  Man_name varchar(255),
  Email varchar(255),
  is_primary BOOLEAN,
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Cust_id) REFERENCES Manufacturer(Name)
);
CREATE TABLE Manufacturer_contact (
  Man_name varchar(255),
  Name varchar(255),
  Phone_number varchar(15),
  Email_address varchar(255),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Cust_id) REFERENCES Manufacturer(Name)
);
--
CREATE TABLE Part (
  Part_no int NOT NULL,
  Reorder_cap int,
  PRIMARY KEY(Part_no)
);
CREATE TABLE Product (
  Prod_no int NOT NULL,
  Prod_name varchar(255),
  Sale_price DECIMAL(100, 4),
  Route_no int,
  Bom_id int,
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Route_no) REFERENCES Routing_sheet(Route_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id)
);
CREATE TABLE BoM (
  Bom_id int,
  PRIMARY KEY (Bom_id)
);
CREATE TABLE Payment (
  Payment_no int,
  Payment_amount DECIMAL(100,4),
  Payment_date DATE,
  Invoice_no int,
  PRIMARY KEY (Payment_no),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no)
);
CREATE TABLE Order (
  Order_no int,
  Date_ordered DATE,
  Apperoved_denied BOOLEAN,
  Reason varchar(255),
  Cust_id int NOT NULL,
  Invoice_no int,
  Employee_id int,
  PRIMARY KEY (Order_no),
  FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
  FOREIGN KEY (Invoice_no) REFERENCES Invoice(Invoice_no),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Routing_sheet (
  Route_no int,
  PRIMARY KEY (Route_no),
  FOREIGN KEY (Route_no) REFERENCES Product(Route_no)
);
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
CREATE TABLE Invoice (
  Invoice_no int,
  Term varchar(255),
  Date_shipped DATE,
  PRIMARY KEY (Invoice_no)
);
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
--
CREATE TABLE Office_worker (
  Employee_id int,
  Salary_amount DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Factory_worker (
  Employee_id int,
  Hours_worked int,
  Hourly_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Warehouse_worker (
  Employee_id int,
  Hours_worked int,
  Hourly_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
CREATE TABLE Salesperson (
  Employee_id int,
  Salary_amount DECIMAL(7,2),
  Commission_rate DECIMAL(7,2),
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
--
CREATE TABLE OrderContainsProduct (
  Order_no int,
  Prod_no int,
  PRIMARY KEY (Order_no),
  PRIMARY KEY (Prod_no),
  FOREIGN KEY (Order_no) REFERENCES Order(Order_no),
  FOREIGN KEY (Prod_no) REFERENCES Product(Prod_no)
);
CREATE TABLE BomContainsPart (
  Bom_id int,
  Part_no int,
  PRIMARY KEY (Bom_id),
  PRIMARY KEY (Part_no),
  FOREIGN KEY (Bom_id) REFERENCES BoM(Bom_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no)
);
CREATE TABLE ManufacturerMakesPart (
  Part_no int,
  Man_name varchar(255),
  Cost DECIMAL(10,2),
  PRIMARY KEY (Part_no),
  PRIMARY KEY (Man_name),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Man_name) REFERENCES Manufacturer(Name)
);
CREATE TABLE EmployeeWorksDepartment (
  Employee_id int,
  Dept_id int,
  Office_no int,
  PRIMARY KEY (Employee_id),
  PRIMARY KEY (Dept_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
  FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);
CREATE TABLE BranchStocksPart (
  Part_no int,
  Branch_id int,
  PRIMARY KEY (Part_no),
  PRIMARY KEY (Branch_id),
  FOREIGN KEY (Part_no) REFERENCES Part(Part_no),
  FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
);



CREATE DATABASE HospitalManagementSystem;
GO


USE HospitalManagementSystem;
GO

---------Departments-------------------


CREATE TABLE Departments (
    DepartmentID    INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName  VARCHAR(100) NOT NULL,
    Description     VARCHAR(255)
);
INSERT INTO Departments VALUES 
('Cardiology', 'Heart related issues'),
('Neurology', 'Brain and nervous system'),
('Pediatrics', 'Child healthcare'),
('Orthopedics', 'Bone and joint care'),
('Dermatology', 'Skin and hair care');
GO

----------Doctors-------------
CREATE TABLE Doctors (
    DoctorID        INT PRIMARY KEY IDENTITY(1,1),
    FullName        VARCHAR(100) NOT NULL,
    Specialization  VARCHAR(100),
    Phone           VARCHAR(20),
    Email           VARCHAR(100),
    DepartmentID    INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
INSERT INTO Doctors VALUES 
('Dr. Ahmed Khan', 'Cardiologist', '01711111111', 'ahmed@hospital.com', 1),
('Dr. Sara Ali', 'Neurologist', '01822222222', 'sara@hospital.com', 2),
('Dr. Nawab Sakib', 'Surgeon', '01933333333', 'sakib@hospital.com', 3),
('Dr. Maria Gomez', 'Orthopedic Surgeon', '01544444444', 'maria@hospital.com', 4),
('Dr. Rayhan Uddin', 'Dermatologist', '01655555555', 'rayhan@hospital.com', 5);
GO

-----------Patients---------------
CREATE TABLE Patients (
    PatientID       INT PRIMARY KEY IDENTITY(1,1),
    FullName        VARCHAR(100) NOT NULL,
    DateOfBirth     DATE,
    Gender          VARCHAR(10),
    Phone           VARCHAR(20),
    Email           VARCHAR(100),
    Address         VARCHAR(255),
    BloodGroup      VARCHAR(5),
    RegisteredAt    DATETIME DEFAULT GETDATE()
);
INSERT INTO Patients (FullName, DateOfBirth, Gender, Phone, Email, Address, BloodGroup) VALUES 
('Abdur Rahim', '1990-05-15', 'Male', '01700000001', 'rahim@mail.com', 'Dhaka', 'A+'),
('Karima Begum', '1985-10-20', 'Female', '01700000002', 'karima@mail.com', 'Barishal', 'B+'),
('John Doe', '2000-01-01', 'Male', '01700000003', 'john@mail.com', 'Chittagong', 'O+'),
('Sumaiya Akter', '1995-12-12', 'Female', '01700000004', 'sumaiya@mail.com', 'Sylhet', 'AB+'),
('Tanvir Hossain', '1988-03-25', 'Male', '01700000005', 'tanvir@mail.com', 'Khulna', 'O-');
GO

------------OPD_Appointments---------------


CREATE TABLE OPD_Appointments (
    AppointmentID   INT PRIMARY KEY IDENTITY(1,1),
    PatientID       INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID        INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATETIME NOT NULL,
    Status          VARCHAR(20) DEFAULT 'Pending',
    Notes           VARCHAR(255)
);
INSERT INTO OPD_Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES 
(1, 1, '2026-05-10 10:00', 'Confirmed'),
(2, 2, '2026-05-10 11:00', 'Pending'),
(3, 3, '2026-05-11 09:00', 'Confirmed'),
(4, 4, '2026-05-11 14:00', 'Cancelled'),
(5, 5, '2026-05-12 16:00', 'Pending');
GO

---------Rooms-----------------


CREATE TABLE Rooms (
    RoomID          INT PRIMARY KEY IDENTITY(1,1),
    RoomNumber      VARCHAR(20) NOT NULL,
    RoomType        VARCHAR(50),
    IsAvailable     BIT DEFAULT 1,
    PricePerDay     DECIMAL(10,2)
);
INSERT INTO Rooms VALUES 
('101', 'General', 1, 1000.00),
('201', 'Private', 1, 3000.00),
('301', 'ICU', 0, 10000.00),
('401', 'VIP', 1, 8000.00),
('501', 'Emergency', 1, 2000.00);
GO

---------Medicines---------------


CREATE TABLE Medicines (
    MedicineID      INT PRIMARY KEY IDENTITY(1,1),
    MedicineName    VARCHAR(100) NOT NULL,
    Category        VARCHAR(50),
    Stock           INT DEFAULT 0,
    Price           DECIMAL(10,2),
    ExpiryDate      DATE
);
INSERT INTO Medicines VALUES 
('Napa Extend', 'Paracetamol', 500, 5.00, '2027-12-31'),
('Seclo 20', 'Gastric', 300, 7.00, '2026-06-30'),
('Azithromycin', 'Antibiotic', 100, 35.00, '2028-01-15'),
('Fenadin', 'Antihistamine', 200, 8.00, '2027-05-20'),
('Sergel 20', 'Gastric', 400, 10.00, '2026-09-10');
GO

--------LabTests---------------


CREATE TABLE LabTests (
    TestID          INT PRIMARY KEY IDENTITY(1,1),
    TestName        VARCHAR(100) NOT NULL,
    Price           DECIMAL(10,2),
    Description     VARCHAR(255)
);
INSERT INTO LabTests VALUES 
('Blood Sugar', 200.00, 'Diabetes test'),
('CBC', 400.00, 'Complete Blood Count'),
('ECG', 600.00, 'Heart rhythm test'),
('X-Ray Chest', 800.00, 'Chest imaging'),
('Lipid Profile', 1200.00, 'Cholesterol test');
GO

------GeneralAccounts-------------


CREATE TABLE GeneralAccounts (
    AccountID       INT PRIMARY KEY IDENTITY(1,1),
    AccountName     VARCHAR(100) NOT NULL,
    AccountType     VARCHAR(50),
    Balance         DECIMAL(12,2) DEFAULT 0
);
INSERT INTO GeneralAccounts VALUES 
('Main Cash', 'Asset', 500000.00),
('Bank Account', 'Asset', 2000000.00),
('Pharmacy Income', 'Revenue', 50000.00),
('Lab Income', 'Revenue', 30000.00),
('Operational Expense', 'Expense', 10000.00);
GO

---------Employees-------------


CREATE TABLE Employees (
    EmployeeID      INT PRIMARY KEY IDENTITY(1,1),
    FullName        VARCHAR(100) NOT NULL,
    Position        VARCHAR(100),
    DepartmentID    INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Phone           VARCHAR(20),
    Email           VARCHAR(100),
    JoinDate        DATE,
    Salary          DECIMAL(10,2)
);
INSERT INTO Employees VALUES 
('Kamal Hossain', 'Manager', 1, '01911111111', 'kamal@hospital.com', '2022-01-01', 45000.00),
('Jasmine Akter', 'Nurse', 1, '01922222222', 'jasmine@hospital.com', '2023-05-10', 25000.00),
('Sabbir Ahmed', 'Receptionist', 2, '01933333333', 'sabbir@hospital.com', '2024-02-15', 18000.00),
('Nasrin Sultana', 'Lab Assistant', 3, '01944444444', 'nasrin@hospital.com', '2023-11-20', 22000.00),
('Rafiqul Islam', 'Driver', 4, '01955555555', 'rafiq@hospital.com', '2025-01-05', 15000.00);
GO

---------Vaccines------------


CREATE TABLE Vaccines (
    VaccineID       INT PRIMARY KEY IDENTITY(1,1),
    VaccineName     VARCHAR(100) NOT NULL,
    Manufacturer    VARCHAR(100),
    Stock           INT DEFAULT 0,
    Price           DECIMAL(10,2)
);
INSERT INTO Vaccines VALUES 
('BCG', 'Serum Institute', 100, 0.00),
('Pentavalent', 'GSK', 50, 500.00),
('COVID-19', 'Pfizer', 200, 0.00),
('Polio', 'Sanofi', 150, 0.00),
('Hepatitis B', 'Beximco', 80, 800.00);
GO



select * from Vaccines


PRINT 'Hospital Database with Dummy Data Created Successfully!';
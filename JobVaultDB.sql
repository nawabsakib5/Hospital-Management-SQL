CREATE DATABASE JobVaultDB;
GO

USE JobVaultDB;
GO


-----------Create Data Table----------------
CREATE TABLE Company (
    CompanyId INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(150) NOT NULL UNIQUE,
    RegistrationNo VARCHAR(100) NULL,
    EstablishDate DATE NULL,
    TotalWorker INT NULL,
    Website VARCHAR(300) NULL,
    LinkedinLink VARCHAR(500) NULL
);
GO

CREATE TABLE CompanyAddress (
    AddressId INT PRIMARY KEY IDENTITY(1,1),
    CompanyId INT NOT NULL,
    ComAddress VARCHAR(200) NULL,
    City VARCHAR(100) NULL,
    FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);
GO


CREATE TABLE CompanyContact (
    ContactId INT PRIMARY KEY IDENTITY(1,1),
    CompanyId INT NOT NULL,
    CompanyEmail VARCHAR(200) NULL,
    PhoneNo VARCHAR(50) NULL,
    ContactPerson VARCHAR(200) NULL,
    Designation VARCHAR(200) NULL,
    FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId)
);
GO

CREATE TABLE JobPosition (
    PositionId INT PRIMARY KEY IDENTITY(1,1),
    JobsPositionName VARCHAR(100) NOT NULL
);
GO


-------------- Insert Table Data--------------------
INSERT INTO Company (CompanyName) VALUES
('Skill.jobs'),
('edvoy'),
('HTHIUM'),
('Astha'),
('Kriyakarak'),
('Golden Harvest'),
('What My Buseness.com'),
('IGL Web Ltd'),
('PRAN/RFL'),
('AANGINA CTY PURBACHAL'),
('BizMappers Ltd.'),
('6sense Technologies'),
('Beyond Bracket Ltd.'),
('Microdeft'),
('Bizcope'),
('Coders Bucket'),
('I Creative Marcom'),
('Real IT Solution'),
('Serviq'),
('PeopleNtech'),
('commjunc'),
('Lighthouse Buseness Consulting Ltd'),
('E-Shikhon.com'),
('Incetum IT'),
('Taqwa Tech'),
('Color Hut'),
('Xpro IT'),
('Tech Cafe'),
('Techlyn'),
('Softvence Agency'),
('EMSIS Tech'),
('Mainul Lifestyle'),
('Annex Migration'),
('BEAUTYOLOGY'),
('UniEducare'),
('JBCCI'),
('Tirzok Private Limited'),
('werbackspace'),
('Zero IT Marketing'),
('Go Edu'),
('Hoque Consultancy Ltd'),
('Mars & Venus International'),
('Job Bee'),
('BAITS'),
('Wazih'),
('Pizza Hut'),
('NANDINI Hotel');
GO

INSERT INTO CompanyContact (CompanyId, ContactPerson, PhoneNo, CompanyEmail, Designation) VALUES

((SELECT CompanyId FROM Company WHERE CompanyName='Skill.jobs'), 'Khaled Newaz', '8801841590420', 'sales12@skill.jobs', 'Sales & Marketing Executive'),

((SELECT CompanyId FROM Company WHERE CompanyName='Skill.jobs'), 'Mithila', '8801847027535', NULL, 'Job Posting'),

((SELECT CompanyId FROM Company WHERE CompanyName='edvoy'), 'Shibly Qureshi', '8801321220377', 'shibly@edvoy.com', 'Manager'),

((SELECT CompanyId FROM Company WHERE CompanyName='edvoy'), 'Fazley', '8801958622933', NULL, 'Recruiter'),

((SELECT CompanyId FROM Company WHERE CompanyName='HTHIUM'), 'Yamamul Haque', '8801335135400', 'haque104833@gmail.com', 'HR/Admin'),

((SELECT CompanyId FROM Company WHERE CompanyName='Astha'), 'Meraj Bhuiyan', '8801321134884', 'meraj.hr@asthafeed.com', 'HR/Admin'),

((SELECT CompanyId FROM Company WHERE CompanyName='Kriyakarak'), NULL, '8801301207090', 'contact@kriyakarak.com', 'HR/Admin'),

((SELECT CompanyId FROM Company WHERE CompanyName='Kriyakarak'), NULL, '8801316700900', 'contact@kriyakarak.com', 'HR/Admin'),

((SELECT CompanyId FROM Company WHERE CompanyName='Golden Harvest'), 'Md.Adnanul Islam', '8801713558585', NULL, 'Senior Executive HR'),

((SELECT CompanyId FROM Company WHERE CompanyName='IGL Web Ltd'), 'Mohiuddin Moin', '8801814445932', '445900@iglweb.com', 'HR'),

((SELECT CompanyId FROM Company WHERE CompanyName='IGL Web Ltd'), 'Raj Bormon', '8801958666999', '445974@iglweb.com', 'Graphic & Marketing'),

((SELECT CompanyId FROM Company WHERE CompanyName='PRAN/RFL'), 'Hasan', '8801704130825', NULL, 'Assist HR'),

((SELECT CompanyId FROM Company WHERE CompanyName='PRAN/RFL'), 'Ashraful Islam', '8801704130858', NULL, 'HR'),

((SELECT CompanyId FROM Company WHERE CompanyName='Serviq'), 'Partha Nath Sarkar', '8801844231446', 'partha@serviq.limited', 'Executive Talent Acquisition'),

((SELECT CompanyId FROM Company WHERE CompanyName='Serviq'), 'Munzurul Islam', '8801717797681', 'munzurul@serviq.limited', 'Head of Staffing'),

((SELECT CompanyId FROM Company WHERE CompanyName='Serviq'), 'Khandaker Rayhan', '8801844231433', 'rayhan@serviq.limited', 'Senior Manager'),

((SELECT CompanyId FROM Company WHERE CompanyName='Pizza Hut'), 'Md. Ariful Islam', '8801828939556', NULL, 'Restaurant Manager'),

((SELECT CompanyId FROM Company WHERE CompanyName='NANDINI Hotel'), 'Shihabur Rahman', '8801810193513', 'sales3@hotelnandini.com', 'Sr Executive Sales');
GO

INSERT INTO JobPosition (JobsPositionName) VALUES
('Sales & Marketing Executive'),
('Manager'),
('Recruiter'),
('HR/Admin'),
('Software Engineer'),
('Graphic Designer'),
('Restaurant Manager');
GO


-------------Data Table View----------------------
select * from Company
select * from CompanyAddress
select * from CompanyContact
select * from JobPosition
CREATE DATABASE HEALTH_CARE;
USE HEALTH_CARE;

-- Create Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT  ,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DOB DATE,
    Gender NVARCHAR(10),
    ContactNumber NVARCHAR(15),
    Address NVARCHAR(255),
    Status NVARCHAR(50)
);

-- Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Specialty NVARCHAR(50),
    ContactNumber NVARCHAR(15),
    Email NVARCHAR(100)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create MedicalRecords Table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Diagnosis NVARCHAR(255),
    Treatment NVARCHAR(255),
    RecordDate DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Prescriptions Table
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY AUTO_INCREMENT ,
    RecordID INT,
    Medication NVARCHAR(255),
    Dosage NVARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Create Billing Table
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY AUTO_INCREMENT ,
    PatientID INT,
    Amount DECIMAL(10, 2),
    BillingDate DATE,
    PaymentStatus NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT ,
    DepartmentName NVARCHAR(50),
    HeadDoctorID INT,
    FOREIGN KEY (HeadDoctorID) REFERENCES Doctors(DoctorID)
);

-- Create HospitalStaff Table
CREATE TABLE HospitalStaff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT ,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(50),
    DepartmentID INT,
    ContactNumber NVARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into Patients Table
INSERT INTO Patients (FirstName, LastName, DOB, Gender, ContactNumber, Address, Status)
VALUES
('Arjun', 'Verma', '1985-04-12', 'Male', '9876543210', 'Mumbai, Maharashtra', 'Active'),
('Neha', 'Sharma', '1990-07-23', 'Female', '9876543211', 'Delhi, Delhi', 'Active'),
('Rohan', 'Singh', '1982-01-30', 'Male', '9876543212', 'Bangalore, Karnataka', 'Active'),
('Priya', 'Mehta', '1995-09-15', 'Female', '9876543213', 'Chennai, Tamil Nadu', 'InActive'),
('Amit', 'Kumar', '1987-05-20', 'Male', '9876543214', 'Pune, Maharashtra', 'Active'),
('Sneha', 'Patel', '1991-12-11', 'Female', '9876543215', 'Ahmedabad, Gujarat', 'Active'),
('Vikram', 'Joshi', '1984-08-25', 'Male', '9876543216', 'Kolkata, West Bengal', 'Active'),
('Pooja', 'Rao', '1993-11-30', 'Female', '9876543217', 'Hyderabad, Telangana', 'Active'),
('Rahul', 'Nair', '1988-03-22', 'Male', '9876543218', 'Thiruvananthapuram, Kerala', 'Active'),
('Anita', 'Desai', '1992-10-05', 'Female', '9876543219', 'Jaipur, Rajasthan', 'Active');

-- Insert data into Doctors Table
INSERT INTO Doctors (FirstName, LastName, Specialty, ContactNumber, Email) VALUES
('Dr. Ravi', 'Patel', 'Cardiology', '9876543215', 'ravi.patel@example.com'),
('Dr. Sunita', 'Desai', 'Neurology', '9876543216', 'sunita.desai@example.com'),
('Dr. Anil', 'Joshi', 'Orthopedics', '9876543217', 'anil.joshi@example.com'),
('Dr. Meera', 'Rao', 'Pediatrics', '9876543218', 'meera.rao@example.com'),
('Dr. Vikram', 'Kapoor', 'Dermatology', '9876543219', 'vikram.kapoor@example.com');

-- Insert data into Appointments Table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1, 1, '2024-07-01 10:00:00', 'Completed'),
(2, 2, '2024-07-05 11:00:00', 'Completed'),
(3, 3, '2024-07-10 12:00:00', 'Completed'),
(4, 4, '2024-07-15 09:00:00', 'Completed'),
(5, 5, '2024-07-20 14:00:00', 'Completed'),
(6, 1, '2024-08-01 10:30:00', 'Completed'),
(7, 1, '2024-08-06 11:30:00', 'Completed'),
(8, 2, '2024-08-11 12:30:00', 'Pending'),
(9, 3, '2024-08-16 09:30:00', 'Pending'),
(10, 3, '2024-08-21 14:30:00', 'Pending');

-- Insert data into MedicalRecords Table
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, RecordDate)
VALUES
(1, 1, 'Hypertension', 'Medication', '2024-07-01 10:00:00'),
(2, 2, 'Migraine', 'Therapy', '2024-07-05 11:00:00'),
(3, 3, 'Fracture', 'Surgery', '2024-07-10 12:00:00'),
(4, 4, 'Flu', 'Medication', '2024-07-15 09:00:00'),
(5, 5, 'Skin Allergy', 'Topical Cream', '2024-07-20 14:00:00'),
(6, 1, 'Diabetes', 'Insulin', '2024-08-01 10:30:00'),
(7, 2, 'Epilepsy', 'Medication', '2024-08-06 11:30:00');

-- Insert data into Prescriptions Table
INSERT INTO Prescriptions (RecordID, Medication, Dosage, StartDate, EndDate)
VALUES
(1, 'Amlodipine', '5mg', '2024-07-01', '2024-07-31'),
(2, 'Sumatriptan', '50mg', '2024-07-05', '2024-07-15'),
(3, 'Ibuprofen', '400mg', '2024-07-10', '2024-07-20'),
(4, 'Oseltamivir', '75mg', '2024-07-15', '2024-07-25'),
(5, 'Hydrocortisone', '1%', '2024-07-20', '2024-07-30'),
(6, 'Metformin', '500mg', '2024-08-01', '2024-08-31'),
(7, 'Carbamazepine', '200mg', '2024-08-06', '2024-08-16');



-- Insert data into Billing Table
INSERT INTO Billing (PatientID, Amount, BillingDate, PaymentStatus)
VALUES
(1, 1500.00, '2024-07-02', 'Paid'),
(2, 2000.00, '2024-07-06', 'Paid'),
(3, 2000.00, '2024-07-11', 'Pending'),
(4, 500.00, '2024-07-16', 'Paid'),
(5, 800.00, '2024-07-21', 'Paid'),
(6, 1800.00, '2024-08-02', 'Pending'),
(7, 2200.00, '2024-08-07', 'Paid');



-- Insert data into Departments Table
INSERT INTO Departments (DepartmentName, HeadDoctorID) VALUES
('Cardiology', 1),
('Neurology', 2),
('Orthopedics', 3),
('Pediatrics', 4),
('Dermatology', 5);

-- Insert data into HospitalStaff Table
INSERT INTO HospitalStaff (FirstName, LastName, Position, DepartmentID, ContactNumber) VALUES
('Ramesh', 'Khan', 'Nurse', 1, '9876543220'),
('Sita', 'Gupta', 'Technician', 2, '9876543221'),
('Arvind', 'Nair', 'Surgeon', 3, '9876543222'),
('Pooja', 'Bose', 'Nurse', 4, '9876543223'),
('Kiran', 'Yadav', 'Technician', 5, '9876543224');

SELECT * FROM Patients ;
SELECT * FROM Doctors ;
SELECT * FROM Appointments ;
SELECT * FROM MedicalRecords ;
SELECT * FROM Prescriptions ;
SELECT * FROM Billing ;
SELECT * FROM Departments ;
SELECT * FROM HospitalStaff ;

DESC Patients ;
DESC Doctors ;
DESC Appointments ;
DESC MedicalRecords ;
DESC Prescriptions ;
DESC Billing ;
DESC Departments ;
DESC HospitalStaff ;


--
--- updates the contact number of the patient with PatientID = 1.
UPDATE Patients
SET ContactNumber = '9876543225'
WHERE PatientID = 1;

--- Find the total amount billed to a specific patient.
SELECT PatientID, SUM(Amount) AS TotalAmount
FROM Billing
WHERE PatientID = 1
GROUP BY PatientID;

--- Find doctors who have seen more than 2 patients.
SELECT D.FirstName, D.LastName, COUNT(A.PatientID) AS NumberOfPatients
FROM Doctors D
JOIN Appointments A ON D.DoctorID = A.DoctorID
GROUP BY D.DoctorID
HAVING COUNT(A.PatientID) > 2;

--- Find the names of patients who have appointments with specific doctors.
SELECT FirstName, LastName
FROM Patients
WHERE PatientID IN (
    SELECT PatientID 
    FROM Appointments
    WHERE DoctorID IN (1, 2, 3)
);

--- the status of the appointment with AppointmentID = 2 to 'PENDING'.
UPDATE Appointments
SET Status = 'PENDING'
WHERE AppointmentID = 2;

--- query selects all doctors who specialize in Cardiology.
SELECT * FROM Doctors
WHERE Specialty = 'Cardiology';

--- query retrieves all patients whose last names start with the letter 'S'.
SELECT * FROM Patients
WHERE LastName LIKE 'S%';

--- query selects all appointments scheduled between August 1st and August 10th, 2024.
SELECT * FROM Appointments
WHERE AppointmentDate BETWEEN '2024-08-01 00:00:00' AND '2024-08-10 23:59:59';

--- query retrieves all medical records where the diagnosis includes the word "Flu".
SELECT * FROM MedicalRecords
WHERE Diagnosis LIKE '%Flu%';

--- query updates the contact number and email of the doctor with DoctorID = 5
UPDATE Doctors
SET ContactNumber = '9876543226', Email = 'vikram.kapoor_updated@example.com'
WHERE DoctorID = 5;

--- query retrieves all hospital staff who work in the department with DepartmentID = 3
SELECT * FROM HospitalStaff
WHERE DepartmentID = 3;

--- retrieves the 3 most recent appointments by ordering the Appointments IN desc
SELECT * FROM Appointments
ORDER BY AppointmentDate DESC
LIMIT 3;

--- Retrieve the names of patients who have had appointments with a doctor specializing in "Cardiology."
SELECT FirstName, LastName FROM Patients
WHERE PatientID IN (
    SELECT PatientID FROM Appointments
    WHERE DoctorID IN (SELECT DoctorID  FROM Doctors 
        WHERE Specialty = 'Cardiology'
    )
);

--- Retrieve the PatientID and FirstName of patients who have a pending appointment and 
---- are under the care of the head doctor of the "Neurology" department.

SELECT PatientID, FirstName FROM Patients
WHERE PatientID IN (
    SELECT PatientID 
    FROM Appointments
    WHERE Status = 'Pending'
    AND DoctorID = (
        SELECT HeadDoctorID
        FROM Departments
        WHERE DepartmentName = 'Neurology'
    )
);



-- Select Statement: --
--- Select All Columns from a Table
SELECT FirstName, LastName FROM Doctors;

--- Select Specific Columns from a Table
SELECT FirstName, LastName FROM Doctors;

-- Where Clauses: --
--- Filter ALL Records Using WHERE Clause
SELECT * FROM Patients WHERE Gender = 'Female';

--- Filter Specific Columns Using WHERE Clause
SELECT FirstName, LastName FROM Doctors WHERE FirstName ='DR. Ravi';

-- Order By : --
-- Sorts the result set in ascending or descending order. ASC FOR Ascending Order & DESC For Descending Order --
SELECT * FROM Patients ORDER BY LastName ASC;

-- Count Function : --
--- Returns the number of rows that match a specified condition. Count(*) || Count(Column_Name)  || Count(1/2..) 
SELECT COUNT(*) FROM Appointments;

-- Aggregate Functions:  SUM, AVG, MIN, MAX --
--- Sum():Returns the sum of a numeric column.
--- Avg():Returns the average value of a numeric column.
--- Min():Returns the minimum value of a column.
--- Max():Returns the maximum value of a column.
SELECT SUM(Amount) AS TotalBilling FROM Billing;
SELECT Avg(Amount) AS AvgBilling FROM Billing;
SELECT Max(Amount) AS HighestBilling FROM Billing;
SELECT Min(Amount) AS LowestBilling FROM Billing;

-- Subqueries :--
-- Question: Retrieve doctors who have appointments scheduled after '2023-01-01'
SELECT FirstName, LastName FROM Doctors
WHERE DoctorID IN (SELECT DoctorID FROM Appointments WHERE AppointmentDate > '2023-01-01');

-- Joins : --
--- Question: Retrieve patients who have never had an appointment. names for all appointments.
SELECT P.FirstName, P.LastName
FROM Patients P
LEFT JOIN Appointments A ON P.PatientID = A.PatientID
WHERE A.AppointmentDate IS NULL;

--- Question: Retrieve patients' names along with their doctors' names for all appointments.
SELECT P.FirstName AS PatientFirstName, P.LastName AS PatientLastName, D.FirstName AS DoctorFirstName, D.LastName AS DoctorLastName
FROM Appointments A
INNER JOIN Patients P ON A.PatientID = P.PatientID
INNER JOIN Doctors D ON A.DoctorID = D.DoctorID;

--  GROUP BY: -- 
--- Question: Count the number of patients by gender.
SELECT Gender, COUNT(*) AS NumberOfPatients
FROM Patients
GROUP BY Gender;

-- HAVING Clause :--
--- Question: Retrieve doctors who have more than 10 appointments.
SELECT DoctorID, COUNT(*) AS AppointmentCount
FROM Appointments
GROUP BY DoctorID
HAVING COUNT(*) > 10;

-- Union / Union All Operator : --
--- Question: Retrieve names from both the Doctors and Patients tables.
SELECT FirstName, LastName FROM Doctors
UNION
SELECT FirstName, LastName FROM Patients;

--- Retrieve patients with pending appointments.
SELECT P.FirstName, P.LastName
FROM Patients P
WHERE EXISTS (SELECT 1 FROM Appointments A WHERE A.PatientID = P.PatientID AND A.Status = 'Pending');

-- We have covered almost all main topics used in SQL and here  are some question to practice in health System Project 
-- Question: List all patients' names and their contact numbers.
SELECT FirstName, LastName, ContactNumber
FROM Patients;

--- Question: Find the number of male and female Active patients.
SELECT Gender, COUNT(*) AS NumberOfPatients
FROM Patients
Where Status = 'Active'
GROUP BY Gender;

--- Question: List all doctors along with their specialties.
SELECT FirstName, LastName, Specialty
FROM Doctors;

--- Question: Find the number of doctors in each specialty.
SELECT Specialty, COUNT(*) AS NumberOfDoctors
FROM Doctors
GROUP BY Specialty;

--- Question: List the appointments that are still pending (status 'Pending').
SELECT *
FROM Appointments
WHERE Status = 'Pending';

--- Question: Retrieve the details of appointments along with patient and doctor names.
SELECT A.AppointmentID, P.FirstName AS PatientFirstName, P.LastName AS PatientLastName,
       D.FirstName AS DoctorFirstName, D.LastName AS DoctorLastName, A.AppointmentDate
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;

--- Question: Find the most common diagnosis given by doctors.
SELECT Diagnosis, COUNT(*) AS Frequency
FROM MedicalRecords
GROUP BY Diagnosis
ORDER BY Frequency DESC;

--- Question: Find the medications that have been prescribed the most.
SELECT Medication, COUNT(*) AS PrescriptionCount
FROM Prescriptions
GROUP BY Medication
ORDER BY PrescriptionCount DESC;

--- Question: Retrieve the details of unpaid bills.
SELECT *
FROM Billing
WHERE PaymentStatus = 'Pending';

--- Question: Find the number of staff members in each department.
SELECT Dept.DepartmentName, COUNT(*) AS StaffCount
FROM HospitalStaff HS
JOIN Departments Dept ON HS.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName;


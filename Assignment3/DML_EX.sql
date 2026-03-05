--1:SELECT: Retrieve all columns from the Doctor table.
select * from Doctor;
--2:ORDER BY: List patients in the Patient table in ascending order of their ages.
SELECT * FROM Patient
ORDER BY Age ASC;
--3:OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
SELECT * FROM Patient
ORDER BY UR_Number
OFFSET 4 ROWS
FETCH NEXT 10 ROWS ONLY;
--4:SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
SELECT TOP 5 * FROM Doctor;
--5:SELECT DISTINCT: Get a list of unique address from the Patient table.
SELECT DISTINCT Address FROM Patient;
--6:WHERE: Retrieve patients from the Patient table who are aged 25.
SELECT * FROM Patient
WHERE Age = 25;
--7:NULL: Retrieve patients from the Patient table whose email is not provided.
SELECT * FROM Patient
WHERE Email IS NULL;
--8:AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.
SELECT * FROM Doctor
WHERE YearsOfExperience > 5
AND Specialty = 'Cardiology';
--9:IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
SELECT * FROM Doctor
WHERE Specialty IN ('Dermatology','Oncology');
--10:BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
SELECT * FROM Patient
WHERE Age BETWEEN 18 AND 30;
--11:LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT * FROM Doctor
WHERE Name LIKE 'Dr.%';
--12:Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
SELECT Name AS DoctorName,Email AS DoctorEmail FROM Doctor;
--13:Joins: Retrieve all prescriptions with corresponding patient names.
SELECT P.UR_Number, P.Name, PR.DrugID, PR.PrescriptionDate, PR.Quantity
FROM Prescription PR
JOIN Patient P
ON PR.UR_Number = P.UR_Number;
--14:GROUP BY: Retrieve the count of patients grouped by their cities.
SELECT Address, COUNT(*) AS NumberOfPatients
FROM Patient
GROUP BY Address;
--15:HAVING: Retrieve cities with more than 3 patients.
SELECT Address, COUNT(*) AS NumberOfPatients
FROM Patient
GROUP BY Address
HAVING COUNT(*) > 3;
--16:EXISTS: Retrieve patients who have at least one prescription.
SELECT * FROM Patient P
WHERE EXISTS (
    SELECT 1 FROM Prescription PR
    WHERE PR.UR_Number = P.UR_Number
);
--17:UNION: Retrieve a combined list of doctors and patients.
SELECT Name FROM Doctor
UNION
SELECT Name FROM Patient;
--18:INSERT: Insert a new doctor into the Doctor table.
INSERT INTO Doctor
VALUES (111,'Dr.Hassan','hassan@mail.com','01234567890','Oncology',12,1);
--19:INSERT Multiple Rows: Insert multiple patients into the Patient table.
INSERT INTO Patient
VALUES
(11,'Karim Ali','Cairo',26,'karim@mail.com','01111111111','MC2001'),
(12,'Salma Ahmed','Giza',23,'salma@mail.com','01122222222','MC2002'),
(13,'Hany Tarek','Alex',31,'hany@mail.com','01133333333',NULL);
--20:UPDATE: Update the phone number of a doctor.
UPDATE Doctor
SET Phone = '01012345678'
WHERE DoctorID = 101;
--21:UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.
UPDATE P
SET Address = 'Cairo'
FROM Patient P
JOIN Prescription PR
ON P.UR_Number = PR.UR_Number
WHERE PR.DoctorID = 101;
--22:DELETE: Delete a patient from the Patient table.
DELETE FROM Patient
WHERE UR_Number = 11;
--23:Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.
BEGIN TRANSACTION;

INSERT INTO Doctor
VALUES (120,'Dr.Karim','karim@mail.com','01299999999','Neurology',10,2);

INSERT INTO Patient
VALUES (20,'Mahmoud Ali','Tanta',27,'mahmoud@mail.com','01155555555','MC3001');

COMMIT;
ROLLBACK;
create database Prescription;

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Email VARCHAR(20) UNIQUE,
    Phone VARCHAR(11),
    Specialty VARCHAR(50) NOT NULL,
    YearsOfExperience INT CHECK (YearsOfExperience >= 0),
	UR_Number INT NOT NULL,
	  CONSTRAINT FK_Patient_Doctor
    FOREIGN KEY (UR_Number)
    REFERENCES Patient(UR_Number)
);

CREATE TABLE Patient (
    UR_Number INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Age INT CHECK (Age > 0),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    MedicareCardNumber VARCHAR(30) NULL
);

CREATE TABLE PharmaceuticalCompany (
    CompanyName VARCHAR(150) PRIMARY KEY,
    Address VARCHAR(200),
    Phone VARCHAR(20)
);

CREATE TABLE Drug (
    DrugID INT PRIMARY KEY,
    TradeName VARCHAR(100) NOT NULL,
    Strength VARCHAR(50) NOT NULL,
    CompanyName VARCHAR(150) NOT NULL,

    CONSTRAINT FK_Drug_Company
    FOREIGN KEY (CompanyName)
    REFERENCES PharmaceuticalCompany(CompanyName)
    ON DELETE CASCADE
);
CREATE TABLE Prescription (
    PrescriptionDate DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),

    DoctorID INT NOT NULL,
    UR_Number INT NOT NULL,
    DrugID INT NOT NULL,

    CONSTRAINT PK_Prescription
    PRIMARY KEY (DoctorID, UR_Number, DrugID),

    CONSTRAINT FK_Prescription_Doctor
    FOREIGN KEY (DoctorID)
    REFERENCES Doctor(DoctorID),

    CONSTRAINT FK_Prescription_Patient
    FOREIGN KEY (UR_Number)
    REFERENCES Patient(UR_Number),

    CONSTRAINT FK_Prescription_Drug
    FOREIGN KEY (DrugID)
    REFERENCES Drug(DrugID)
);

INSERT INTO PharmaceuticalCompany VALUES
('Pfizer','USA','111111111'),
('Novartis','Switzerland','222222222'),
('Roche','Switzerland','333333333'),
('Merck','Germany','444444444'),
('Sanofi','France','555555555'),
('AstraZeneca','UK','666666666'),
('GSK','UK','777777777'),
('Bayer','Germany','888888888'),
('AbbVie','USA','999999999'),
('Takeda','Japan','101010101');

INSERT INTO Patient VALUES
(1,'Ahmed Ali','Cairo',25,'ahmed@gmail.com','01011111111','MC1001'),
(2,'Mohamed Samy','Giza',30,'mohamed@gmail.com','01022222222','MC1002'),
(3,'Sara Adel','Alex',22,'sara@gmail.com','01033333333',NULL),
(4,'Omar Khaled','Tanta',28,'omar@gmail.com','01044444444','MC1004'),
(5,'Mona Hassan','Mansoura',35,'mona@gmail.com','01055555555','MC1005'),
(6,'Ali Mahmoud','Zagazig',40,'ali@gmail.com','01066666666',NULL),
(7,'Heba Fathy','Cairo',27,'heba@gmail.com','01077777777','MC1007'),
(8,'Khaled Nabil','Giza',32,'khaled@gmail.com','01088888888','MC1008'),
(9,'Nour Ahmed','Alex',24,'nour@gmail.com','01099999999',NULL),
(10,'Youssef Tarek','Tanta',29,'youssef@gmail.com','01100000000','MC1010');

INSERT INTO Doctor VALUES
(101,'Dr.Ahmed','doc1@mail.com','01211111111','Cardiology',10,1),
(102,'Dr.Mohamed','doc2@mail.com','01222222222','Dermatology',8,2),
(103,'Dr.Sara','doc3@mail.com','01233333333','Neurology',12,3),
(104,'Dr.Omar','doc4@mail.com','01244444444','Orthopedic',15,4),
(105,'Dr.Mona','doc5@mail.com','01255555555','Pediatrics',7,5),
(106,'Dr.Ali','doc6@mail.com','01266666666','Dentistry',6,6),
(107,'Dr.Heba','doc7@mail.com','01277777777','Cardiology',9,7),
(108,'Dr.Khaled','doc8@mail.com','01288888888','ENT',11,8),
(109,'Dr.Nour','doc9@mail.com','01299999999','Urology',13,9),
(110,'Dr.Youssef','doc10@mail.com','01300000000','Surgery',14,10);

INSERT INTO Drug VALUES
(1,'Panadol','500mg','Pfizer'),
(2,'Brufen','400mg','Novartis'),
(3,'Aspirin','100mg','Bayer'),
(4,'Augmentin','625mg','GSK'),
(5,'Lipitor','20mg','Pfizer'),
(6,'Voltaren','50mg','Novartis'),
(7,'Zithromax','250mg','Pfizer'),
(8,'Crestor','10mg','Roche'),
(9,'Amoxil','500mg','Sanofi'),
(10,'Plavix','75mg','Bayer');

INSERT INTO Prescription VALUES
('2026-01-01',2,101,1,1),
('2026-01-02',1,102,2,2),
('2026-01-03',3,103,3,3),
('2026-01-04',2,104,4,4),
('2026-01-05',1,105,5,5),
('2026-01-06',2,106,6,6),
('2026-01-07',1,107,7,7),
('2026-01-08',4,108,8,8),
('2026-01-09',2,109,9,9),
('2026-01-10',1,110,10,10);
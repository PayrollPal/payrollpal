CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb`;

CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `EmpID` INT NOT NULL,
  `Name` VARCHAR(40) NOT NULL,
  `Address` VARCHAR(100) NOT NULL,
  `Contact_No` INT NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `NIC` VARCHAR(20) NOT NULL,
  `Department` VARCHAR(20) NOT NULL,
  `Position` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`EmpID`),
  UNIQUE INDEX `NIC` (`NIC` ASC) VISIBLE,
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Contact_No` (`Contact_No` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`salary` (
  `Sid` INT NOT NULL,
  `Name` VARCHAR(40) NOT NULL,
  `empID` INT NOT NULL,
  `Month` VARCHAR(20) NOT NULL,
  `wages` INT NOT NULL,
  `OT` INT NOT NULL,
  `allowance` INT NOT NULL,
  `arrival` INT NOT NULL,
  PRIMARY KEY (`Sid`),
  INDEX `empID` (`empID` ASC) VISIBLE,
  CONSTRAINT `salary_ibfk_1`
    FOREIGN KEY (`empID`)
    REFERENCES `mydb`.`employee` (`EmpID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`tax` (
  `Sid` INT NOT NULL,
  `epf` INT NOT NULL,
  `etf` INT NOT NULL,
  `net` INT NOT NULL,
  `tax` INT NOT NULL,
  `total` INT NOT NULL,
  INDEX `Sid` (`Sid` ASC) VISIBLE,
  CONSTRAINT `tax_ibfk_1`
    FOREIGN KEY (`Sid`)
    REFERENCES `mydb`.`salary` (`Sid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(30) NOT NULL,
  `Emp_id` INT NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `usertype` VARCHAR(20) NOT NULL,
  `question` VARCHAR(30) NOT NULL,
  `answer` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_ibfk_1` (`Emp_id` ASC) VISIBLE,
  CONSTRAINT `user_ibfk_1`
    FOREIGN KEY (`Emp_id`)
    REFERENCES `mydb`.`employee` (`EmpID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`wages` (
  `WID` INT NOT NULL,
  `Name` VARCHAR(40) NOT NULL,
  `EmpID` INT NOT NULL,
  `Month` VARCHAR(20) NOT NULL,
  `basicsalary` INT NOT NULL,
  `OT` INT NOT NULL,
  PRIMARY KEY (`WID`),
  INDEX `EmpID` (`EmpID` ASC) VISIBLE,
  CONSTRAINT `wages_ibfk_1`
    FOREIGN KEY (`EmpID`)
    REFERENCES `mydb`.`employee` (`EmpID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `employee` (`EmpID`, `Name`, `Address`, `Contact_No`, `Email`, `NIC`, `Department`, `Position`) VALUES
(16, 'Sajith', 'Shetty', 770237410, 'sajithd784@gmail.com', '962701040v', 'finance', 'manager'),
(17, 'Dillian', 'Sam', 760231569, 'sd@gmail.com', '3546774654v', 'HR', 'assisten'),
(18, 'Prachi', 'Parikh', 985477231, 'ab1@gmail.com', '123456787v', 'Tech', 'manager'),
(19, 'Seth', 'Jain', 320779701, 'jjp@gmail.com', '98754173b', 'Tech', 'developer'),
(20, 'Vishvesh', 'Choksi', 523176987, 'ab78@gmail.com', '555637147p', 'finance', 'Treasurer'),
(21, 'Tanvi', 'Shetty', 739857126, 'pqp5@gmail.com', '624579870m', 'HR', 'recruiter'),
(22, 'Parekh', 'Shah',96327741 , 'shah75@gmail.com', '968747135p', 'Legal Compliance', 'manager'),
(23, 'Ramesh', 'Shah', 135784907, 'bp17@gmail.com', '890713504b', 'Staff', 'manager'),
(24, 'Ram', 'Patel', 359027871, 'k920@gmail.com', '963758741a', 'Manufacturing', 'manager'),
(25, 'Prachi', 'Parker', 971704286, 'pjap@gmail.com', '900070214l', 'Tech', 'Coder'),
(26, 'Surbhi', 'Vanga', 237065784, 'sur8@gmail.com', '369857014w', 'Manufacturing', 'worker'),
(27, 'Sonali', 'Shetty', 976321547, 'kx45@gmail.com', '547390871x', 'HR', 'worker'),
(28, 'Priyal', 'Kamble', 476987203, 'pble87@gmail.com', '900708089p', 'finance', 'worker'),
(29, 'Prit', 'Malsaria', 975614723, 'prit199@gmail.com', '789754123c', 'Staff', 'worker'),
(30, 'Kiyan', 'Sharma', 367985217, 'shar909@gmail.com', '987635147s', 'Tech', 'analyst');

INSERT INTO `salary` (`Sid`, `Name`, `empID`, `Month`, `wages`, `OT`, `allowance`, `arrival`) VALUES
(16, 'Sajith', 16, 'August', 800, 1200, 200, 160),
(17, 'Dillian', 17, 'August', 700, 1100, 100, 150),
(18, 'Prachi', 18, 'August', 600, 1000, 200, 140),
(19, 'Jaini', 19, 'August', 900, 1300, 300, 160),
(20, 'Aditya', 20, 'August', 800, 1200, 100, 130),
(21, 'Aditya', 21, 'August', 900, 1100, 200, 120),
(22, 'Prachi', 22, 'August', 600, 1200, 400, 150),
(23, 'Ramesh', 23, 'August', 700, 1300, 100, 170),
(24, 'Ram', 24, 'August', 900, 1000, 200, 150),
(25, 'Prachi', 25, 'August', 800, 1100, 100, 140),
(26, 'Surbhi', 26, 'August', 800, 1000, 200, 160),
(27, 'Sonali', 27, 'August', 600, 1200, 300, 150),
(28, 'Priyal', 28, 'August', 700, 1100, 100, 170),
(29, 'Prit', 29, 'August', 900, 1200, 400, 140),
(30, 'Kiyan', 30, 'August', 800, 1000, 300, 150);

INSERT INTO `tax` (`Sid`,`epf`, `etf`, `net`, `tax`, `total`) VALUES
(16, 96, 64, 2200, 100, 2100),
(17, 96, 64, 2200, 100, 1900),
(18, 91, 66, 2220, 150, 2000),
(19, 96, 59, 2200, 100, 1600),
(20, 96, 69, 2200, 100, 2600),
(21, 94, 78, 2200, 100, 2700),
(22, 91, 56, 2200, 100, 2900),
(23, 93, 45, 2200, 100, 1500),
(24, 96, 46, 2200, 100, 2000),
(25, 96, 46, 2200, 100, 1750),
(26, 95, 59, 2200, 100, 1600),
(27, 84, 78, 2200, 100, 1800),
(28, 87, 84, 2200, 100, 1000),
(29, 65, 50, 2200, 100, 1200),
(30, 12, 60, 2200, 100, 1200);

INSERT INTO `user` (`user_id`, `user_name`, `Emp_id`,`password`, `usertype`, `question`, `answer`) VALUES
(16, 'admin2', 16,'12345678', 'admin', 'what is your city?', 'induruwa'),
(17, 'user16', 17,'87654321', 'user', 'what is your city', 'aluthgama'),
(18, 'user22', 18,'98563214', 'user', 'what is your birthplace', 'pune'),
(19, 'user30', 19,'12587469', 'user', 'what is your school name', 'best'),
(20, 'user41', 20,'69213478', 'user', 'what is your birthdate', '7'),
(21, 'user95', 21,'23196548', 'user', 'what is your lastname', 'vanga'),
(22, 'user82', 22,'98745621', 'user', 'what is your hobby', 'reading'),
(23, 'user72', 23,'91375624', 'user', 'what is your favorite color', 'pink'),
(24, 'user81', 24,'73985201', 'user', 'what is your favorite movie', 'RRR'),
(25, 'user99', 25,'36214598', 'user', 'what is your state', 'texas'),
(26, 'user110', 26,'20154789', 'user', 'what is your country', 'USA'),
(27, 'user101', 27,'98751029', 'user', 'what is your university place', 'dallas'),
(28, 'user120', 28,'65428971', 'user', 'what is your city', 'chandigarh'),
(29, 'user130', 29,'54213098', 'user', 'what is your state', 'maharashtra'),
(30, 'user115', 30,'56879102', 'user', 'what is your country', 'india');

INSERT INTO `wages` (`WID`, `Name`, `EmpID`, `Month`, `basicsalary`, `OT`) VALUES
(16, 'viraj', 16, '12331', 1000, 1200),
(17, 'dilshan', 17, '12331', 1500, 1400),
(18, 'prachi', 18, '12331', 1200, 1100),
(19, 'jaini', 19, '12331', 1300, 1200),
(20, 'aditya', 20, '12331', 1000, 900),
(21, 'aditya', 21, '12331', 1400, 1300),
(22, 'prachi', 22, '12331', 1600, 1200),
(23, 'ramesh', 23, '12331', 1400, 1200),
(24, 'ram', 24, '12331', 1000, 1000),
(25, 'prachi', 25, '12331', 1500, 1300),
(26, 'surbhi', 26, '12331', 1200, 1100),
(27, 'sonali', 27, '12331', 1200, 1000),
(28, 'priyal', 28, '12331', 1100, 1000),
(29, 'prit', 29, '12331', 1000, 900),
(30, 'kiyan', 30, '12331', 1300, 1000);


SELECT * FROM employee;

CREATE VIEW masterview AS
SELECT e.Name, e.Contact_No, e.NIC, e.Department, e.Position, w.basicsalary, s.wages, s.OT, s.allowance
FROM employee AS e
INNER JOIN salary AS s ON e.EmpID = s.empID
INNER JOIN wages AS w ON e.EmpID = w.EmpID;

SELECT * FROM masterview;

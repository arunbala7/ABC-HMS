CREATE SCHEMA abc_hospitals;
USE `abc_hospitals`;

-- ccreates user table 
CREATE TABLE userstore(
user_id INT AUTO_INCREMENT NOT NULL,
user_name VARCHAR(20) NOT NULL,
user_password VARCHAR(20) NOT NULL,
work_group VARCHAR(20) NOT NULL,
login_time DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(user_id)
);
-- add autoincrement value 
ALTER TABLE userstore AUTO_INCREMENT = 100;

-- add users 
INSERT INTO userstore(`user_name`, `user_password`, `work_group`) VALUES ('admindesk', 'admin@HMS1', 'adminDesk');
INSERT INTO userstore(`user_name`, `user_password`, `work_group`) VALUES ('pharmacist', 'pharm@HMS1', 'pharmacist');
INSERT INTO userstore(`user_name`, `user_password`, `work_group`) VALUES ('diagnostician', 'diag@HMS1', 'diagnostician');


CREATE TABLE patient(
patient_SSN BIGINT UNIQUE,
patient_id BIGINT AUTO_INCREMENT,
patient_name VARCHAR(30),
patient_age INT,
patient_date_of_admission DATETIME DEFAULT CURRENT_TIMESTAMP,
type_of_room VARCHAR(20),
address VARCHAR(100),
city VARCHAR(20),
state VARCHAR(20),
patient_status VARCHAR(20) DEFAULT 'ACTIVE',
PRIMARY KEY (patient_id)
);
ALTER TABLE patient AUTO_INCREMENT = 200000000;

CREATE TABLE medicine_master(
medicine_id INT PRIMARY KEY AUTO_INCREMENT,
medicine_name VARCHAR(30),
quantity_available INT,
price FLOAT
);
ALTER TABLE medicine_master AUTO_INCREMENT = 1000;
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Lisinopril',100,15.75);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Gabapentin',52,12.25);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Amlodipine',1000,14.75);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Acetaminophen',53,10.00);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Amoxicillin',20,9.50);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Omeprazole',57,15.50);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Metformin',21,5.25);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Losartan',75,5.00);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Adalimumab',20,13.50);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Apixaban',22,20.00);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Lenalidomide',35,3.50);
INSERT INTO medicine_master (medicine_name,quantity_available,price) VALUES('Nivolumab',11,5.50);

CREATE TABLE medicine_issued(
issue_id INT AUTO_INCREMENT,
medicine_id INT,
patient_id BIGINT,
quantity_issued INT,
PRIMARY KEY(issue_id),
FOREIGN KEY (medicine_id) REFERENCES medicine_master(medicine_id)
ON UPDATE CASCADE,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
ON DELETE CASCADE
);
ALTER TABLE medicine_issued AUTO_INCREMENT = 20000;























-- Procedure to check if user exists if yes return that record else return oops 
-- US001 
DELIMITER $$
CREATE PROCEDURE `is_user` (u_name VARCHAR(20), psw VARCHAR(20))
BEGIN
DECLARE COUNT INT;
DECLARE id INT;
DECLARE last_login_time DATETIME ;
SET COUNT = EXISTS (SELECT * From userstore Where user_name = u_name AND user_password = psw);
SET id = (SELECT user_id FROM userstore where user_name = u_name AND user_password = psw);
IF COUNT>0 THEN
	UPDATE userstore SET login_time = now() WHERE user_id = id;
    SELECT * From userstore Where user_name = u_name AND user_password = psw;
ELSE
	SELECT concat(0);
END IF;
END$$
DELIMITER ;



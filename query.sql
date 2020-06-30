-- US001: login
PS : call is_user(?, ?); -> user_name , user_password

-- US002 : create patient
PS : INSERT INTO patient(patient_SSN,patient_name, patient_age, type_of_room, address, city, state) 
VALUES (?, ?, ?, ?, ?, ?, ?); -> ssn,name,age,address,city,state,status

-- Us003 : Edit patient 
-- input : patient id
-- Show only : id, name, age, doj, address = address+city+state
PS : SELECT * FROM patient WHERE patient_id=?; -> patient id
PS : UPDATE patient SET patient_name = ?, patient_age=?, type_of_room=?,address =?, city=?, state=? WHERE patient_id = ?; -> new name,new age,new address, new city, new state, status, patient_id
 
-- US004 : delete patient
-- input : patient id
-- Show only : id, name, age, doj, address = address+city+state
PS : SELECT * FROM patient WHERE patient_id=?; -> patient id
PS : DELETE FROM patient WHERE (patient_id = ?); -> patient id

-- US005 : View all patients
-- input : patient id
-- Show only : id, name, age, doj, address = address+city+state
PS : SELECT * FROM patient WHERE patient_status='ACTIVE' LIMIT ?,?; -> start_value,end_value

-- US006 : Search patient
-- input : patient id
-- Show only : id, name, age, doj, address = address+city+state
PS : SELECT * FROM patient WHERE patient_id=?; -> patient id

getAllMedicinesIssued
SELECT medicine_issued.medicine_id, medicine_master.medicine_name,medicine_issued.quantity_issued,medicine_master.price
FROM medicine_master
INNER JOIN medicine_issued
ON medicine_master.medicine_id = medicine_issued.medicine_id WHERE patient_id=?; -> patient_id
------------------------------------------
getAllMedicines
SELECT medicine_id,medicine_name,price FROM medicine_master; 
------------------------------------------
checkAvailability
SELECT quantity_available FROM medicine_master WHERE medicine_id =?; -> medicine id
------------------------------------------
addMedicine
call add_medicine(?,?,?); -> patient id , medicine id, quantity to issue
------------------------------------------
getAllTests (patient_id)
SELECT * FROM diagnostics_conducted WHERE patient_id = ?; -> patient_id
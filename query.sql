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
PS : SELECT * FROM patient WHERE patient_status='Active' LIMIT ?,?; -> start_value,end_value

-- US006 : Search patient
-- input : patient id
-- Show only : id, name, age, doj, address = address+city+state
PS : SELECT * FROM patient WHERE patient_id=?; -> patient id
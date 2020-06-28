use `rank`;
-- This file contains all the queryis to perform specific use cases


-- US001 :  Loing with user_id and password if sucess return work group
		-- Input : user_id and password   
PS : SELECT work_group FROM users WHERE user_name = ? AND password = ? ; -> user_name , password
        
        
-- US002 : Create new customer
		-- Input : customer_ssn, customer_name, customer_address, customer_dob, customer_age customer_status, customer_messages and customer_create_datetime
PS: INSERT INTO customer (`customer_ssn`, `customer_name`, `customer_address`, `customer_dob`, `customer_age`,`customer_status`,`customer_messages`,`customer_create_datetime`,`customer_update_datetime`) 
VALUES (?,?,?,?,?,'ACTIVE','ID CREATION DONE',now(),now());
-> customer_ssn, customer_name, customer_address, customer_dob, calculated customer_age
	
-- US003 : Edit existing customer
		-- Input : customer_id
        -- 1. show the customer details before editing. details to show (customer_id,customer_ssn,customer_name,customer_address,customer_age)
PS : SELECT * FROM customer WHERE customer_id = ?;  -> customer_id
		-- 2. update the fields. Fields only to update are (customer_name, customer_address, customer_age)
PS : UPDATE customer SET customer_name = ?, customer_address= ?, customer_age = ? ,customer_messages = 'CUSTOMER DETAILS UPDATED' WHERE customer_id = ?;  -> updated_name , updated_address , calculated customer_age, customer_id


-- US004 : DELETE an existing customer
		-- Input : customer_id
        -- 1. Show details of the customers before delete, to show (customer_ssn, customer_id, customer_name, customer_age, customer_address)
PS : SELECT * FROM customer WHERE customer_id = ?; -> customer_id
		-- 2. if confirmed delete the customer
PS : DELETE FROM customer WHERE customer_id = ?; -> CUSTOMER_ID

-- US005 : View the status of all customers
		-- Input : none
        -- show only (customer_id, customer_ssn, customer_status, customer_message, customer_update_datetime) 
        -- Show only finite number of rows in page
PS : SELECT * FROM customer;      
        
-- US006 : Create new account for an existing customer_id
		-- Input : customer_id, account_type, deposit amount
PS : INSERT INTO account ( `customer_id`, `account_type`,`account_status`,`account_message`,`account_balance`,`account_create_datetime`,`account_update_datetime`) 
VALUES (?, ?,'ACTIVE','ACCOUNT CREATED SUCCESSFULLY',?,now(),now());  -> customer id, account type ('savings/current') , initial deposit ammount
		-- Make log for amount deposit in transaction table
PS : INSERT INTO transactions (`account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`) 
		VALUES (?,'DEPOSIT', now(),?); -> account number, deposit amount
                
-- US007 : Delete the account of existing customer        
		-- Input : account number
		-- 1. Show details of the customer's account before delete, to show (customer_name, coustomer_dob account_number, account_type, account_status, account_balance)
PS : SELECT account.*, customer_name , customer_dob FROM account JOIN customer USING(customer_id) WHERE account_number = ? ; - > account number
		-- 2. delete the account
PS : DELETE FROM account WHERE account_number = ?; -> account_number

-- US008 : view status of all customers
		-- Input : none 
        -- Show only (customer_id, account_number, account_type,account_status,account_message,account_update_datetime)
        -- Show only finite number of rows in a page
PS : SELECT * FROM account;        

-- US009 : Search customer : using customer_ssn or customer_id
		-- show (customer_id, customer_ssn, customer_name,customer_addres,customer_dob,customer_status)
        -- if Input : customer ssn
PS : SELECT * FROM customer WHERE customer_ssn=?; -> customer ssn
		-- if Input : customer id
PS : SELECT * FROM customer WHERE customer_id=?; -> customer id

------------------------------------------------------------------- CASHIER ------------------------------------------------------------------------        
        
-- US010 : search account :  using account_number or customer_id
		-- show finite rows per page , show  (account_number, coustomer_id, account_type, account_status, account_message, account_balance, account_create_datetime,account_update_datetime)
		-- if Input : account_number
SELECT * FROM account WHERE account_number= ? ; -> account_number
		-- if Input : customer_id : may return many rows
SELECT * FROM account WHERE customer_id = ? ;   -> customer_id


-- US011 : Deposit money
		-- Input : customer_id, account_number, deposit amount
        -- 1. show the details of the customer with that customer id and account number
PS : SELECT account_type, account_balance FROM account WHERE customer_id = ? AND account_number = ? ; -> customer id , account number
		-- 2. add amount to account balance
PS : UPDATE account SET account_balance = account_balance + ? , account_update_datetime = now() 
		WHERE customer_id = ? AND account_number = ? ; -> deposit amount, customer id, account id
		-- 3. update to transaction table
PS : INSERT INTO transactions ( `account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`) 
		VALUES (?,'CREDIT',now(),?); -> account number, deposit amount
        
-- US012 : Withdraw ammount
		-- Input : customer_id, account_number, deposit amount
        -- 1. show the details of the customer with that customer id and account number
PS : SELECT account_type, account_balance FROM account WHERE customer_id = ? AND account_number = ? ; -> customer id , account number
		-- 2. add amount to account balance
PS : UPDATE account SET account_balance = account_balance - ? , account_update_datetime = now() 
		WHERE customer_id = ? AND account_number = ? ; -> deposit amount, customer id, account id
		-- 3. update to transaction table
PS : INSERT INTO transactions ( `account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`) 
		VALUES (?,'DEBIT',now(),?); -> account number, deposit amount

-- US013 : Transfer money
		-- Input : sourse account number, destination account number, amount
        -- 0. get available balance
PS : SELECT account_balance FROM account WHERE account_number = ?; -> source account number    
		-- 1. deducce from sender        
PS : UPDATE account SET account_balance = account_balance - ? , account_update_datetime = now() 
		WHERE account_number = ? ;   -> amount to send , source account number
		-- 2. log sender's transaction
PS : INSERT INTO transactions ( `account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`) 
	VALUES (?,'DEBIT',now(),?); -> source account number, amount to send
		-- 3. add amount to receiver 
PS : UPDATE account SET account_balance = account_balance + ? , account_update_datetime = now() 
		WHERE account_number = ? ;  -> amount to send , destination account number
        -- 4. log receiver's transaction 
PS : INSERT INTO transactions ( `account_number`, `transactions_descripton`,`transactions_date_time`,`transactions_amount`) 
	VALUES (?,'CREDIT',now(),?); ->destination account number , amount to send  
        
-- US014 : Print account statement
		-- Input : account number , number of rows to display
PS : SELECT * FROM transactions WHERE account_number = ? ORDER BY `transactions_date_time` DESC LIMIT ? ; -> account number , number of rows to display
        -- Input : account number , start date , End date
PS : SELECT * FROM transactions 
WHERE account_number = ?  AND  transactions_date_time BETWEEN '? 00:00:00' AND '? 00:00:00';    -> account number,  start date, end date + 1       
        
        
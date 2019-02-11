/*  
	Rough Draft Version of the MISA Student Database
	Created by Colin McDonald, 2/8/2019, Version 1.0 
*/

CREATE TABLE member (
	member_id INT PRIMARY KEY,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	wwu_email VARCHAR(255) UNIQUE,
	w_number VARCHAR(255) UNIQUE
	);

/*
	-- This is the section for Meeting tables
	-- and for meeting attendance history

*/

CREATE TABLE attendance_history(
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	event_id INT FOREIGN KEY REFERENCES meeting_or_event(event_id)
	);

CREATE TABLE meeting_or_event (
	event_id INT PRIMARY KEY,
	event_name VARCHAR(250),
	event_date DATE,
	event_description TEXT
	);




CREATE TABLE member_class_history (
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	class_id INT FOREIGN KEY REFERENCES ecc_classes(class_id),
	term VARCHAR(15) PRIMARY KEY,
	school_year INT PRIMARY KEY
	);

CREATE TABLE ecc_classes (
	class_id INT PRIMARY KEY,
	class_code VARCHAR(250),
	class_name TEXT
	);

CREATE TABLE membership_history (
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	membership_start_date DATE PRIMARY KEY,
	membership_end_date DATE
	);

CREATE TABLE dues (
	dues_id INT PRIMARY KEY,
	dues_term VARCHAR(15),
	dues_amount DECIMAL(6,2)
	);

CREATE TABLE payment_history (
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	dues_id INT FOREIGN KEY REFERENCES dues(dues_id),
	payment_date DATE PRIMARY KEY,
	payment_year INT,
	is_Paid_Member TINYINT
	);

CREATE TABLE officer_position(
	position_id INT PRIMARY KEY,
	position_name VARCHAR(250),
	position_description TEXT
	);

CREATE TABLE officer_service_history(
	position_id INT FOREIGN KEY REFERENCES officer_position(position_id),
	member_id INT FOREIGN KEY REFERENCES member(member_id),
	appointment_start_date DATE PRIMARY KEY,
	appointment_end_date DATE
	);

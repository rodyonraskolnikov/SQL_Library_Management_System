DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
	(
		issued_id VARCHAR(10) PRIMARY KEY,
		issued_member_id VARCHAR(10), -- FK
		issued_book_name VARCHAR(75),
		issued_date DATE,
		issued_book_isbn VARCHAR(25), -- FK
		issued_emp_id VARCHAR(10) -- FK
	);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
	(
		emp_id VARCHAR(10) PRIMARY KEY,
		emp_name VARCHAR(25),
		position VARCHAR(15),
		salary INT,
		branch_id VARCHAR(25) -- FK
	);

	-- FOREIGN KEY
	ALTER TABLE issued_status
	ADD CONSTRAINT fk_members
	FOREIGN KEY (issued_member_id)
	REFERENCES members(member_id);


	ALTER TABLE issued_status
	ADD CONSTRAINT fk_books
	FOREIGN KEY (issued_book_isbn)
	REFERENCES books(isbn);

	ALTER TABLE issued_status
	ADD CONSTRAINT fk_employees
	FOREIGN KEY (issued_emp_id)
	REFERENCES employees(emp_id);


	ALTER TABLE employees
	ADD CONSTRAINT fk_branch
	FOREIGN KEY (branch_id)
	REFERENCES branch(branch_id);

	ALTER TABLE return_status
	ADD CONSTRAINT fk_issued_status
	FOREIGN KEY (issued_id)
	REFERENCES issued_status(issued_id);
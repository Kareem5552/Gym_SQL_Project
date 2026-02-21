USE gym_project;

DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS fitness_members;
DROP TABLE IF EXISTS fitness_classes;
DROP TABLE IF EXISTS locker;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS instructors;

CREATE TABLE memberships (
    membership_id INTEGER PRIMARY KEY,
    membership_type VARCHAR(20) NOT NULL,
    membership_price FLOAT NOT NULL CHECK (membership_price >= 0),
    membership_start TIMESTAMP NOT NULL,
    membership_expiry TIMESTAMP
);

CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    position VARCHAR(30) NOT NULL,
    base_salary FLOAT NOT NULL CHECK (base_salary >= 0)
);

CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY,
    machine_type TEXT NOT NULL,
    last_maintenance_date TIMESTAMP,
    status_text VARCHAR(20) NOT NULL
);

CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    membership_id INTEGER NOT NULL REFERENCES memberships(membership_id)
);

CREATE TABLE locker (
    locker_id INTEGER PRIMARY KEY,
    member_id INTEGER UNIQUE REFERENCES members(member_id), 
    male_section BOOLEAN NOT NULL,
    locker_section VARCHAR(2) NOT NULL
);

CREATE TABLE fitness_classes (
    class_id INTEGER PRIMARY KEY,
    class_name VARCHAR(30) NOT NULL,
    instructor_id INTEGER NOT NULL REFERENCES instructors(instructor_id),
    class_time TIMESTAMP NOT NULL,
    class_period_minutes INTEGER NOT NULL
);

CREATE TABLE fitness_members (
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    class_id INTEGER NOT NULL REFERENCES fitness_classes(class_id),
    PRIMARY KEY (member_id, class_id)
);

CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    attendance_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount_paid FLOAT NOT NULL CHECK (amount_paid >= 0)
);

CREATE TABLE salaries (
    salary_id INTEGER PRIMARY KEY,
    employee_id INTEGER NOT NULL REFERENCES employees(employee_id),
    amount_paid FLOAT NOT NULL CHECK (amount_paid >= 0),
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE expenses (
    expense_id INTEGER PRIMARY KEY,
    category VARCHAR(30) NOT NULL, 
    amount FLOAT NOT NULL CHECK (amount >= 0),
    expense_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
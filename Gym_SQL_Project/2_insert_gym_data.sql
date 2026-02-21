USE gym_project;

INSERT INTO memberships (membership_id, membership_type, membership_price, membership_start, membership_expiry)
VALUES 
    (1, 'Basic', 30.00, '2024-01-01', '2024-12-31'),
    (2, 'Premium', 50.00, '2024-01-01', '2024-12-31'),
    (3, 'VIP', 80.00, '2024-01-01', '2024-12-31');

INSERT INTO instructors (instructor_id, full_name, email, phone_number)
VALUES 
    (1, 'John Doe', 'john.d@gym.com', '555-0101'),
    (2, 'Jane Smith', 'jane.s@gym.com', '555-0102'),
    (3, 'Mike Tyson', 'mike.t@gym.com', '555-0103');

INSERT INTO employees (employee_id, full_name, email, phone_number, position, base_salary)
VALUES 
    (1, 'Alice Johnson', 'alice.j@gym.com', '555-1234', 'Manager', 5000.00),
    (2, 'Bob Smith', 'bob.s@gym.com', '555-5678', 'Front Desk', 3000.00);

INSERT INTO members (member_id, full_name, email, phone_number, membership_id)
VALUES 
    (1, 'Tom Hanks', 'tom.h@mail.com', '555-1111', 1),
    (2, 'Sara Connor', 'sara.c@mail.com', '555-2222', 2),
    (3, 'Bruce Wayne', 'bruce.w@mail.com', '555-3333', 3),
    (4, 'Clark Kent', 'clark.k@mail.com', '555-4444', 1),
    (5, 'Diana Prince', 'diana.p@mail.com', '555-5555', 2),
    (6, 'Barry Allen', 'barry.a@mail.com', '555-6666', 1),
    (7, 'Oliver Queen', 'oliver.q@mail.com', '555-7777', 2),
    (8, 'Ray Palmer', 'ray.p@mail.com', '555-8888', 1),
    (9, 'Kyle Rayner', 'kyle.r@mail.com', '555-9999', 2),
    (10, 'John Stewart', 'john.s@mail.com', '555-0000', 1);

INSERT INTO equipment (equipment_id, machine_type, last_maintenance_date, status_text)
VALUES 
    (1, 'Treadmill', '2024-01-15', 'Operational'),
    (2, 'Bench Press', '2024-02-10', 'Operational'),
    (3, 'Squat Rack', '2024-02-12', 'Repair Needed');

INSERT INTO fitness_classes (class_id, class_name, instructor_id, class_time, class_period_minutes)
VALUES 
    (1, 'Yoga', 1, '2024-03-01 08:00:00', 60),
    (2, 'Spinning', 2, '2024-03-01 09:00:00', 45),
    (3, 'Boxing', 3, '2024-03-01 17:00:00', 90);

INSERT INTO fitness_members (member_id, class_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 1), (5, 2);

INSERT INTO locker (locker_id, member_id, male_section, locker_section)
VALUES 
    (1, 1, TRUE, 'A1'), 
    (2, 2, FALSE, 'B1'), 
    (3, 3, TRUE, 'A2'), 
    (4, 4, TRUE, 'A3');

INSERT INTO attendance (attendance_id, member_id, attendance_date)
VALUES 
    (1, 1, '2024-03-01 08:05:00'), 
    (2, 2, '2024-03-01 09:10:00');

INSERT INTO payments (payment_id, member_id, amount_paid, payment_date)
VALUES 
    (1, 1, 30.00, '2024-03-01'), 
    (2, 2, 50.00, '2024-03-01'), 
    (3, 3, 80.00, '2024-03-01');

INSERT INTO salaries (salary_id, employee_id, amount_paid, payment_date)
VALUES 
    (1, 1, 5000.00, '2024-03-31'), 
    (2, 2, 3000.00, '2024-03-31');

INSERT INTO expenses (expense_id, category, amount, expense_date)
VALUES 
    (1, 'Rent', 2500.00, '2024-03-01'), 
    (2, 'Electricity', 450.00, '2024-03-15');
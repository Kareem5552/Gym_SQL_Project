-- File: 03_gym_queries.sql
-- Description: Business Intelligence and Operational Queries for Gym Management.

-- QUERY 1: Revenue vs. Expense Audit
-- Business Value: Shows total income from members compared to salary costs.
SELECT 
    (SELECT SUM(amount_paid) FROM payments) AS total_revenue,
    (SELECT SUM(amount_paid) FROM salaries) AS total_salaries_paid,
    (SELECT SUM(amount) FROM expenses) AS general_expenses;


-- QUERY 2: Instructor Workload Analysis
-- Business Value: Lists how many classes each instructor is teaching.
SELECT 
    i.full_name AS instructor_name,
    COUNT(fc.class_id) AS total_classes_taught
FROM instructors i
LEFT JOIN fitness_classes fc ON i.instructor_id = fc.instructor_id
GROUP BY i.full_name
ORDER BY total_classes_taught DESC;


-- QUERY 3: Member Check-in Frequency (Retention Tracking)
-- Business Value: Identifies the most active members for loyalty rewards.
SELECT 
    m.full_name,
    COUNT(a.attendance_id) AS total_visits
FROM members m
JOIN attendance a ON m.member_id = a.member_id
GROUP BY m.full_name
HAVING COUNT(a.attendance_id) > 5
ORDER BY total_visits DESC;
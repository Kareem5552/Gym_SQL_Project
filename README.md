# 🏋️ Relational Database Design w/ SQL: Gym Management System

A complete SQL project building a fully normalized relational database from scratch to manage a gym's daily operations. It demonstrates my ability to design complex database schemas, enforce data integrity, handle financial/operational data, and write business-intelligence queries.

> 💡 **Architectural Note:** Due to DuckDB's current limitations regarding cross-schema foreign key referencing, both financial and operational tables are housed within a single default schema in this project. In a production environment using PostgreSQL, these domains would be logically separated into distinct schemas (e.g., `operations.members` and `finance.payments`) to enhance security, access control, and organization.

## 🧾 Executive Summary (For Hiring Managers)

✅ **Project scope:** Designed and implemented a robust relational database tracking members, staff workloads, class schedules, and financials.
✅ **Data modeling:** Built a normalized schema (3NF) utilizing Primary Keys, Foreign Keys, and a bridge table to resolve many-to-many relationships.
✅ **Data Quality:** Applied strict constraints (`NOT NULL`, `UNIQUE`, `CHECK`) to ensure absolute data integrity for user information and financial transactions.
✅ **Analytics:** Wrote operational queries to audit revenue, calculate instructor workloads, and track member retention.

*If you only have a minute, click below to view the code:*
* 🏗️ **[01_create_gym_tables.sql](https://github.com/Kareem5552/Gym_SQL_Project/blob/master/Gym_SQL_Project/1_create_gym_tables.sql)** – DDL scripts showcasing schema design and constraint logic.
* 📥 **[02_insert_gym_data.sql](https://github.com/Kareem5552/Gym_SQL_Project/blob/master/Gym_SQL_Project/2_insert_gym_data.sql)** – Data ingestion and realistic sample records.
* 📊 **[03_Buisness_questions.sql](https://github.com/Kareem5552/Gym_SQL_Project/blob/master/Gym_SQL_Project/3_Buisness_questions.sql)** – Business intelligence queries and operational analytics.

---

## 🧩 Entity Relationship Diagram (ERD)
*The following diagram illustrates the relational structure of the database, including 1-to-1, 1-to-Many, and Many-to-Many relationships.*

```mermaid
erDiagram
    %% Core Relationships
    MEMBERSHIPS ||--o{ MEMBERS : "has"
    MEMBERS ||--o| LOCKER : "assigned to"
    MEMBERS ||--o{ PAYMENTS : "makes"
    MEMBERS ||--o{ ATTENDANCE : "logs"
    
    %% Class & Instructor Relationships
    INSTRUCTORS ||--o{ FITNESS_CLASSES : "teaches"
    MEMBERS ||--o{ FITNESS_MEMBERS : "registers for"
    FITNESS_CLASSES ||--o{ FITNESS_MEMBERS : "includes"
    
    %% Employee Relationships
    EMPLOYEES ||--o{ SALARIES : "paid via"

    %% Tables
    MEMBERSHIPS {
        int membership_id PK
        varchar membership_type
        float membership_price
    }
    MEMBERS {
        int member_id PK
        varchar full_name
        int membership_id FK
    }
    LOCKER {
        int locker_id PK
        int member_id FK
        boolean male_section
    }
    INSTRUCTORS {
        int instructor_id PK
        varchar full_name
    }
    FITNESS_CLASSES {
        int class_id PK
        varchar class_name
        int instructor_id FK
    }
    FITNESS_MEMBERS {
        int member_id PK, FK
        int class_id PK, FK
    }
    ATTENDANCE {
        int attendance_id PK
        int member_id FK
        timestamp attendance_date
    }
    PAYMENTS {
        int payment_id PK
        int member_id FK
        float amount_paid
    }
    EMPLOYEES {
        int employee_id PK
        varchar position
        float base_salary
    }
    SALARIES {
        int salary_id PK
        int employee_id FK
        float amount_paid
    }
    EQUIPMENT {
        int equipment_id PK
        text machine_type
        varchar status_text
    }
    EXPENSES {
        int expense_id PK
        varchar category
        float amount
    }

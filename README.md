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

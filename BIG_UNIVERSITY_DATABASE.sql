CREATE DATABASE BIG_UNIVERSITY_DB;
USE BIG_UNIVERSITY_DB;

-- =========================
-- UNIVERSITY
-- =========================
CREATE TABLE university (
    university_id INT AUTO_INCREMENT PRIMARY KEY,
    university_name VARCHAR(200) NOT NULL,
    city VARCHAR(100),
    type VARCHAR(50)
);

-- =========================
-- FACULTIES
-- =========================
CREATE TABLE faculties (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_name VARCHAR(200) NOT NULL,
    university_id INT,
    establishment_year INT,
    FOREIGN KEY (university_id) REFERENCES university(university_id)
);

-- =========================
-- DEPARTMENTS
-- =========================
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(200) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id)
);

-- =========================
-- DOCTORS (تفصيل ممل)
-- =========================
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(20),
    academic_title VARCHAR(100),
    specialization VARCHAR(200),
    years_of_experience INT,
    office_number VARCHAR(50),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id)
);

-- =========================
-- COURSES
-- =========================
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(200),
    credit_hours INT,
    semester VARCHAR(20),
    department_id INT,
    doctor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- =========================
-- INSERT UNIVERSITY
-- =========================
INSERT INTO university (university_name, city, type)
VALUES ('Beni Suef National University', 'Beni Suef', 'National');

-- =========================
-- INSERT FACULTIES (7)
-- =========================
INSERT INTO faculties (faculty_name, university_id, establishment_year) VALUES
('Faculty of Computers and Artificial Intelligence', 1, 2020),
('Faculty of Engineering', 1, 2020),
('Faculty of Medicine', 1, 2020),
('Faculty of Pharmacy', 1, 2020),
('Faculty of Nursing', 1, 2020),
('Faculty of Business Administration', 1, 2020),
('Faculty of Science', 1, 2020);

-- =========================
-- DEPARTMENTS لكل كلية
-- =========================

-- FCAI
INSERT INTO departments (department_name, faculty_id) VALUES
('Computer Science', 1),
('Artificial Intelligence', 1),
('Information Systems', 1),
('Software Engineering', 1);

-- Engineering
INSERT INTO departments VALUES
(NULL,'Electrical Engineering',2),
(NULL,'Mechanical Engineering',2),
(NULL,'Civil Engineering',2),
(NULL,'Architecture Engineering',2);

-- Medicine
INSERT INTO departments VALUES
(NULL,'Clinical Medicine',3),
(NULL,'Surgery',3),
(NULL,'Internal Medicine',3);

-- Pharmacy
INSERT INTO departments VALUES
(NULL,'Pharmaceutics',4),
(NULL,'Pharmacology',4),
(NULL,'Clinical Pharmacy',4);

-- Nursing
INSERT INTO departments VALUES
(NULL,'Medical Nursing',5),
(NULL,'Surgical Nursing',5);

-- Business
INSERT INTO departments VALUES
(NULL,'Accounting',6),
(NULL,'Management',6),
(NULL,'Economics',6);

-- Science
INSERT INTO departments VALUES
(NULL,'Physics',7),
(NULL,'Chemistry',7),
(NULL,'Mathematics',7);

-- =========================
-- DOCTORS (تفصيل تقيل)
-- =========================
INSERT INTO doctors 
(full_name,email,phone,academic_title,specialization,years_of_experience,office_number,faculty_id)
VALUES
('Dr. Ahmed Hassan','ahmed@bsnu.edu.eg','0100000001','Professor','Artificial Intelligence',18,'A-101',1),
('Dr. Mona Ali','mona@bsnu.edu.eg','0100000002','Associate Professor','Databases',12,'A-102',1),
('Dr. Youssef Kamal','youssef@bsnu.edu.eg','0100000003','Lecturer','Software Engineering',8,'A-103',1),

('Dr. Khaled Samir','khaled@bsnu.edu.eg','0100000004','Professor','Electrical Power',20,'E-201',2),
('Dr. Sara Adel','sara@bsnu.edu.eg','0100000005','Assistant Professor','Clinical Medicine',10,'M-301',3),
('Dr. Hany Mostafa','hany@bsnu.edu.eg','0100000006','Professor','Pharmacology',22,'P-401',4),

('Dr. Amira Nabil','amira@bsnu.edu.eg','0100000007','Lecturer','Nursing Science',7,'N-501',5),
('Dr. Tarek Fathy','tarek@bsnu.edu.eg','0100000008','Professor','Accounting',25,'B-601',6),
('Dr. Mohamed Adel','mohamed@bsnu.edu.eg','0100000009','Professor','Quantum Physics',19,'S-701',7);

-- =========================
-- COURSES (أمثلة تقيلة)
-- =========================
INSERT INTO courses VALUES
(NULL,'Programming 1',3,'Fall',1,1),
(NULL,'Data Structures',3,'Spring',1,2),
(NULL,'Machine Learning',3,'Fall',2,1),
(NULL,'Software Engineering',3,'Spring',4,3),
(NULL,'Digital Circuits',3,'Fall',5,4),
(NULL,'Human Anatomy',4,'Spring',9,5),
(NULL,'Pharmacology 1',4,'Fall',12,6),
(NULL,'Financial Accounting',3,'Spring',15,8),
(NULL,'Quantum Mechanics',3,'Fall',18,9);

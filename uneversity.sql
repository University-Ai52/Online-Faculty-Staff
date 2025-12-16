 -- ============================================
-- University Academic System Database
-- Faculties, Departments, Subjects, and Professors
-- Based on provided documents
-- ============================================

-- Create database
CREATE DATABASE IF NOT EXISTS University_Academic_System;
USE University_Academic_System;

-- ============================================
-- 1. Faculties Table
-- ============================================
CREATE TABLE faculties (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_code VARCHAR(10) UNIQUE NOT NULL,
    faculty_name VARCHAR(200) NOT NULL,
    total_departments INT DEFAULT 0
);

-- ============================================
-- 2. Departments Table
-- ============================================
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id INT NOT NULL,
    department_code VARCHAR(10) UNIQUE NOT NULL,
    department_name VARCHAR(200) NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id) ON DELETE CASCADE
);

-- ============================================
-- 3. Subjects Table (مواد الدراسة)
-- ============================================
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    subject_code VARCHAR(15) NOT NULL,
    subject_name VARCHAR(200) NOT NULL,
    credit_hours INT NOT NULL,
    academic_year INT NOT NULL, -- 1, 2, 3, 4
    semester INT NOT NULL, -- 1 or 2
    UNIQUE KEY unique_subject_code (department_id, subject_code),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

-- ============================================
-- 4. Professors Table (الدكاترة)
-- ============================================
CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    national_id VARCHAR(14) UNIQUE NOT NULL,
    professor_code VARCHAR(10) UNIQUE NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(15),
    academic_degree ENUM('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer') NOT NULL,
    specialization VARCHAR(200),
    office_number VARCHAR(20),
    hire_date DATE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

-- ============================================
-- 5. Professor_Subjects Table (الدكاترة والمواد)
-- ============================================
CREATE TABLE professor_subjects (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT NOT NULL,
    subject_id INT NOT NULL,
    academic_year YEAR,
    section VARCHAR(10),
    UNIQUE KEY unique_assignment (professor_id, subject_id, academic_year),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);

-- ============================================
-- Insert Faculties (من الملفات)
-- ============================================
INSERT INTO faculties (faculty_code, faculty_name, total_departments) VALUES
('CS-AI', 'Faculty of Computers and Artificial Intelligence', 3),
('ENG', 'Faculty of Engineering', 5),
('LAW', 'Faculty of Law', 4),
('ART', 'Faculty of Arts', 9),
('DENT', 'Faculty of Dentistry', 3),
('NURS', 'Faculty of Nursing', 3),
('MEDIA', 'Faculty of Mass Communication', 4);

-- ============================================
-- Insert Departments لكل كلية
-- ============================================

-- 1. كلية الحاسبات والذكاء الاصطناعي
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(1, 'AI-DS', 'Artificial Intelligence and Data Science'),
(1, 'CS-CYBER', 'Cyber Security'),
(1, 'MED-INFO', 'Medical Informatics');

-- 2. كلية الهندسة
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(2, 'CIVIL', 'Civil Engineering'),
(2, 'ARCH', 'Architectural Engineering'),
(2, 'ELEC-COM', 'Electrical Engineering (Communications & Computer)'),
(2, 'MECHAT', 'Mechatronics Engineering'),
(2, 'ELEC-REN', 'Electrical & Renewable Energy Engineering');

-- 3. كلية الحقوق
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(3, 'CIV-COM', 'Civil and Commercial Law'),
(3, 'CRIMINAL', 'Criminal Law and Penal Procedures'),
(3, 'CONST-ADM', 'Constitutional and Administrative Law'),
(3, 'INT-COMP', 'International and Comparative Law');

-- 4. كلية الآداب
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(4, 'ARABIC', 'Arabic Language and Literature'),
(4, 'ENGLISH', 'English Language and Literature'),
(4, 'HISTORY', 'History'),
(4, 'GEOGRAPHY', 'Geography'),
(4, 'PSYCH', 'Psychology'),
(4, 'SOCIOLOGY', 'Sociology'),
(4, 'PHILOSOPHY', 'Philosophy'),
(4, 'MEDIA-ST', 'Media Studies'),
(4, 'LIB-INFO', 'Library and Information Science');

-- 5. كلية طب الأسنان
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(5, 'DENT-BASIC', 'Basic Dental Sciences'),
(5, 'DENT-CLIN', 'Clinical Dental Sciences'),
(5, 'DENT-HOSP', 'Hospital Rotations');

-- 6. كلية التمريض
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(6, 'NURS-BASIC', 'Basic Nursing and Medical Sciences'),
(6, 'NURS-CLIN', 'Clinical Nursing Sciences'),
(6, 'NURS-PRAC', 'Practical Training in Hospitals');

-- 7. كلية الإعلام
INSERT INTO departments (faculty_id, department_code, department_name) VALUES
(7, 'PRESS', 'Press Department'),
(7, 'RADIO-TV', 'Radio and Television Department'),
(7, 'PR-AD', 'Public Relations and Advertising Department'),
(7, 'ELEC-MEDIA', 'Electronic Media Department');

-- ============================================
-- Insert Subjects (مواد كل قسم) - السنة الأولى كمثال
-- ============================================

-- مواد قسم الذكاء الاصطناعي وعلوم البيانات (AI-DS)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(1, 'AI101', 'Introduction to Artificial Intelligence', 3, 1, 1),
(1, 'MATH101', 'Calculus I', 3, 1, 1),
(1, 'CS101', 'Programming Fundamentals', 4, 1, 1),
(1, 'STAT101', 'Probability and Statistics', 3, 1, 2),
(1, 'AI102', 'Machine Learning Basics', 3, 1, 2),
(1, 'DS101', 'Data Structures', 4, 1, 2);

-- مواد قسم الأمن السيبراني (CS-CYBER)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(2, 'CS101', 'Programming Fundamentals', 4, 1, 1),
(1, 'MATH101', 'Calculus I', 3, 1, 1),
(2, 'NET101', 'Computer Networks Fundamentals', 3, 1, 1),
(2, 'SEC101', 'Introduction to Cyber Security', 3, 1, 2),
(2, 'CRYPTO101', 'Cryptography Basics', 3, 1, 2),
(2, 'OS101', 'Operating Systems', 4, 1, 2);

-- مواد قسم الهندسة المدنية (CIVIL)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(4, 'MATH101', 'Engineering Mathematics I', 3, 1, 1),
(4, 'PHYS101', 'Physics for Engineers', 3, 1, 1),
(4, 'CIV101', 'Introduction to Civil Engineering', 2, 1, 1),
(4, 'DRAW101', 'Engineering Drawing', 3, 1, 2),
(4, 'MECH101', 'Mechanics of Materials', 3, 1, 2),
(4, 'SURV101', 'Surveying', 3, 1, 2);

-- مواد قسم القانون المدني والتجاري (CIV-COM)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(8, 'LAW101', 'Introduction to Law', 3, 1, 1),
(8, 'CIV101', 'Civil Law Principles', 3, 1, 1),
(8, 'CONST101', 'Constitutional Law', 3, 1, 1),
(8, 'COM101', 'Commercial Law Basics', 3, 1, 2),
(8, 'CONTRACT101', 'Contract Law', 3, 1, 2),
(8, 'ARABIC-LAW', 'Legal Arabic', 2, 1, 2);

-- مواد قسم اللغة العربية (ARABIC)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(9, 'ARAB101', 'Arabic Grammar I', 3, 1, 1),
(9, 'LIT101', 'Arabic Literature History', 3, 1, 1),
(9, 'PHON101', 'Arabic Phonetics', 2, 1, 1),
(9, 'ARAB102', 'Arabic Grammar II', 3, 1, 2),
(9, 'POETRY101', 'Classical Poetry', 3, 1, 2),
(9, 'WRITING101', 'Academic Writing in Arabic', 2, 1, 2);

-- مواد طب الأسنان الأساسية (DENT-BASIC)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(21, 'ANAT101', 'Human Anatomy', 4, 1, 1),
(21, 'BIO101', 'General Biology', 3, 1, 1),
(21, 'CHEM101', 'General Chemistry', 3, 1, 1),
(21, 'DENT-ANAT', 'Dental Anatomy', 3, 1, 2),
(21, 'PHYS101', 'Physics for Dentistry', 2, 1, 2),
(21, 'BIOCHEM101', 'Biochemistry', 3, 1, 2);

-- مواد التمريض الأساسي (NURS-BASIC)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(24, 'NURS101', 'Fundamentals of Nursing', 4, 1, 1),
(24, 'ANAT101', 'Human Anatomy', 3, 1, 1),
(24, 'PHYSIO101', 'Human Physiology', 3, 1, 1),
(24, 'NURS102', 'Nursing Ethics', 2, 1, 2),
(24, 'MICRO101', 'Microbiology', 3, 1, 2),
(24, 'PHARM101', 'Pharmacology Basics', 3, 1, 2);

-- مواد قسم الصحافة (PRESS)
INSERT INTO subjects (department_id, subject_code, subject_name, credit_hours, academic_year, semester) VALUES
(28, 'JOUR101', 'Journalism Principles', 3, 1, 1),
(28, 'WRITING101', 'News Writing', 3, 1, 1),
(28, 'MEDIA-HIS', 'Media History', 2, 1, 1),
(28, 'REPORT101', 'Reporting Techniques', 3, 1, 2),
(28, 'ETHICS101', 'Media Ethics', 2, 1, 2),
(28, 'EDITING101', 'Editing and Proofreading', 3, 1, 2);

-- ============================================
-- Insert Professors (الدكاترة) - بيانات افتراضية
-- ============================================

-- دكاترة قسم الذكاء الاصطناعي
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234567', 'PROF001', 'Dr. Ahmed Mohamed Ali', 'ahmed.ali@university.edu', 'Professor', 'Machine Learning & AI', 1),
('29001011234568', 'PROF002', 'Dr. Sara Hassan Mahmoud', 'sara.mahmoud@university.edu', 'Associate Professor', 'Data Science', 1),
('29001011234569', 'PROF003', 'Dr. Omar Khalid Salem', 'omar.salem@university.edu', 'Assistant Professor', 'Deep Learning', 1);

-- دكاترة قسم الأمن السيبراني
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234570', 'PROF004', 'Dr. Mohamed Samy Ibrahim', 'mohamed.ibrahim@university.edu', 'Professor', 'Network Security', 2),
('29001011234571', 'PROF005', 'Dr. Fatima Nour El-Din', 'fatima.nour@university.edu', 'Associate Professor', 'Cryptography', 2);

-- دكاترة قسم الهندسة المدنية
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234572', 'PROF006', 'Dr. Khaled Mostafa Ahmed', 'khaled.ahmed@university.edu', 'Professor', 'Structural Engineering', 4),
('29001011234573', 'PROF007', 'Dr. Nourhan Samir Mohamed', 'nourhan.mohamed@university.edu', 'Associate Professor', 'Construction Management', 4);

-- دكاترة قسم القانون
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234574', 'PROF008', 'Dr. Mahmoud Adel Hassan', 'mahmoud.hassan@university.edu', 'Professor', 'Civil Law', 8),
('29001011234575', 'PROF009', 'Dr. Hala Ibrahim Samy', 'hala.samy@university.edu', 'Associate Professor', 'Commercial Law', 8);

-- دكاترة قسم اللغة العربية
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234576', 'PROF010', 'Dr. Ali Mohamed Farag', 'ali.farag@university.edu', 'Professor', 'Arabic Literature', 9),
('29001011234577', 'PROF011', 'Dr. Mona Samir Khalil', 'mona.khalil@university.edu', 'Associate Professor', 'Arabic Linguistics', 9);

-- دكاترة طب الأسنان
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234578', 'PROF012', 'Dr. Amir Tarek Mohamed', 'amir.mohamed@university.edu', 'Professor', 'Oral Surgery', 21),
('29001011234579', 'PROF013', 'Dr. Reem Adel Hassan', 'reem.hassan@university.edu', 'Associate Professor', 'Orthodontics', 21);

-- دكاترة التمريض
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234580', 'PROF014', 'Dr. Samia Mohamed Ali', 'samia.ali@university.edu', 'Professor', 'Medical-Surgical Nursing', 24),
('29001011234581', 'PROF015', 'Dr. Tamer Nabil Ibrahim', 'tamer.ibrahim@university.edu', 'Associate Professor', 'Pediatric Nursing', 24);

-- دكاترة الإعلام
INSERT INTO professors (national_id, professor_code, full_name, email, academic_degree, specialization, department_id) VALUES
('29001011234582', 'PROF016', 'Dr. Rania Hisham Mohamed', 'rania.mohamed@university.edu', 'Professor', 'Journalism', 28),
('29001011234583', 'PROF017', 'Dr. Karim Adel Samir', 'karim.samir@university.edu', 'Associate Professor', 'Digital Media', 28);

-- ============================================
-- Assign Subjects to Professors
-- ============================================
INSERT INTO professor_subjects (professor_id, subject_id, academic_year, section) VALUES
-- د. أحمد يدرس مواد الذكاء الاصطناعي
(1, 1, 2024, 'A'),  -- AI101
(1, 5, 2024, 'A'),  -- AI102
-- د. سارة تدرس مواد علوم البيانات
(2, 6, 2024, 'B'),  -- DS101
(2, 4, 2024, 'A'),  -- STAT101
-- د. محمد يدرس الأمن السيبراني
(4, 8, 2024, 'A'),  -- SEC101
(4, 9, 2024, 'B'),  -- CRYPTO101
-- د. خالد يدرس الهندسة المدنية
(6, 10, 2024, 'A'), -- CIV101
(6, 13, 2024, 'A'), -- MECH101
-- د. محمود يدرس القانون
(8, 14, 2024, 'A'), -- LAW101
(8, 15, 2024, 'A'), -- CIV101
-- د. علي يدرس اللغة العربية
(10, 20, 2024, 'A'), -- ARAB101
(10, 23, 2024, 'A'), -- ARAB102
-- د. أمير يدرس طب الأسنان
(12, 24, 2024, 'A'), -- ANAT101
(12, 27, 2024, 'A'), -- DENT-ANAT
-- د. سامية تدرس التمريض
(14, 30, 2024, 'A'), -- NURS101
(14, 33, 2024, 'A'), -- NURS102
-- د. رانيا تدرس الإعلام
(16, 36, 2024, 'A'), -- JOUR101
(16, 39, 2024, 'A'); -- REPORT101

-- ============================================
-- Update department counts in faculties
-- ============================================
UPDATE faculties f
SET total_departments = (
    SELECT COUNT(*) 
    FROM departments d 
    WHERE d.faculty_id = f.faculty_id
);

-- ============================================
-- Create Indexes for Performance
-- ============================================
CREATE INDEX idx_department_faculty ON departments(faculty_id);
CREATE INDEX idx_subject_department ON subjects(department_id);
CREATE INDEX idx_professor_department ON professors(department_id);
CREATE INDEX idx_professor_email ON professors(email);
CREATE INDEX idx_subject_code ON subjects(subject_code);

-- ============================================
-- Useful Views
-- ============================================

-- View: كل المواد في كل قسم
CREATE VIEW department_subjects AS
SELECT 
    d.department_code,
    d.department_name,
    s.subject_code,
    s.subject_name,
    s.credit_hours,
    s.academic_year,
    s.semester
FROM departments d
JOIN subjects s ON d.department_id = s.department_id
ORDER BY d.department_code, s.academic_year, s.semester;

-- View: الدكاترة مع أقسامهم وموادهم
CREATE VIEW professor_details AS
SELECT 
    p.professor_code,
    p.full_name,
    p.academic_degree,
    p.specialization,
    d.department_name,
    f.faculty_name,
    COUNT(ps.subject_id) as subjects_count
FROM professors p
JOIN departments d ON p.department_id = d.department_id
JOIN faculties f ON d.faculty_id = f.faculty_id
LEFT JOIN professor_subjects ps ON p.professor_id = ps.professor_id
GROUP BY p.professor_id
ORDER BY f.faculty_name, d.department_name;

-- View: المواد مع الدكاترة المسؤولين عنها
CREATE VIEW subject_professors AS
SELECT 
    s.subject_code,
    s.subject_name,
    s.academic_year,
    p.full_name as professor_name,
    p.academic_degree,
    d.department_name
FROM subjects s
JOIN professor_subjects ps ON s.subject_id = ps.subject_id
JOIN professors p ON ps.professor_id = p.professor_id
JOIN departments d ON s.department_id = d.department_id
ORDER BY s.subject_code;

-- ============================================
-- Sample Queries
-- ============================================

-- 1. عرض جميع الكليات وأقسامها
SELECT 
    f.faculty_code,
    f.faculty_name,
    f.total_departments,
    d.department_code,
    d.department_name
FROM faculties f
JOIN departments d ON f.faculty_id = d.faculty_id
ORDER BY f.faculty_code, d.department_code;

-- 2. عرض جميع المواد في قسم معين (مثال: الذكاء الاصطناعي)
SELECT 
    subject_code,
    subject_name,
    credit_hours,
    academic_year,
    semester
FROM subjects
WHERE department_id = 1
ORDER BY academic_year, semester;

-- 3. عرض جميع الدكاترة في كلية معينة (مثال: الحاسبات)
SELECT 
    p.professor_code,
    p.full_name,
    p.academic_degree,
    p.specialization,
    d.department_name
FROM professors p
JOIN departments d ON p.department_id = d.department_id
JOIN faculties f ON d.faculty_id = f.faculty_id
WHERE f.faculty_code = 'CS-AI'
ORDER BY p.academic_degree, p.full_name;

-- 4. عدد المواد لكل قسم
SELECT 
    d.department_name,
    COUNT(s.subject_id) as total_subjects
FROM departments d
LEFT JOIN subjects s ON d.department_id = s.department_id
GROUP BY d.department_id
ORDER BY total_subjects DESC;

-- 5. المواد التي يدرسها دكتور معين
SELECT 
    p.full_name,
    s.subject_code,
    s.subject_name,
    s.credit_hours
FROM professors p
JOIN professor_subjects ps ON p.professor_id = ps.professor_id
JOIN subjects s ON ps.subject_id = s.subject_id
WHERE p.professor_code = 'PROF001';

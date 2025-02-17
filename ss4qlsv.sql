-- Tạo cơ sở dữ liệu
CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

-- Tạo bảng Lớp
CREATE TABLE Class (
    ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATE NOT NULL,
    Status TINYINT(1) DEFAULT 1
);

-- Tạo bảng Sinh viên
CREATE TABLE Student (
    StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status TINYINT(1) DEFAULT 1,
    ClassId INT NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class(ClassID) ON DELETE CASCADE
);

-- Tạo bảng Môn học
CREATE TABLE Subject (
    SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status TINYINT(1) DEFAULT 1
);

-- Tạo bảng Điểm
CREATE TABLE Mark (
    MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId INT NOT NULL,
    StudentId INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 10),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject(SubId) ON DELETE CASCADE,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) ON DELETE CASCADE
);

-- Chèn dữ liệu vào bảng Lớp
INSERT INTO Class (ClassName, StartDate, Status) VALUES
('A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', CURRENT_DATE, 0);

-- Chèn dữ liệu vào bảng Sinh viên
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId) VALUES
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai Phong', NULL, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

-- Chèn dữ liệu vào bảng Môn học
INSERT INTO Subject (SubName, Credit, Status) VALUES
('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
('RDBMS', 10, 1);

-- Chèn dữ liệu vào bảng Điểm
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes) VALUES
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 9, 1);

-- Lấy tất cả thông tin sinh viên
SELECT * FROM Student;

-- Câu hỏi 1: Lấy sinh viên có tên bắt đầu bằng 'h'
SELECT * FROM Student WHERE LOWER(StudentName) LIKE 'h%';

-- Câu hỏi 2: Lấy lớp học bắt đầu vào tháng 12
SELECT * FROM Class WHERE MONTH(StartDate) = 12;

-- Câu hỏi 3: Lấy môn học có số tín chỉ từ 3 đến 5
SELECT * FROM Subject WHERE Credit BETWEEN 3 AND 5;

-- Câu hỏi 4: Cập nhật lớp cho sinh viên tên 'Hung'
SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';
SET SQL_SAFE_UPDATES = 1;

-- Câu hỏi 5: Lấy tên sinh viên, tên môn học và điểm của họ
SELECT 
    s.StudentName, sub.SubName, m.Mark
FROM Mark m
JOIN Student s ON m.StudentId = s.StudentId
JOIN Subject sub ON m.SubId = sub.SubId
ORDER BY m.Mark DESC, s.StudentName ASC;
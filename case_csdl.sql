CREATE DATABASE IF NOT EXISTS case_study_database;
USE case_study_database;

-- Tạo bảng
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(50) NOT NULL
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(50) NOT NULL
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(50) NOT NULL
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(20) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(50) NOT NULL
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh VARCHAR(10) NOT NULL,
    so_cmnd VARCHAR(20) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(50) NOT NULL
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(50) NOT NULL
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(100) NOT NULL,
    dien_tich INT,
    chi_phi_thue DECIMAL(10, 2) NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(50),
    mo_ta_tien_nghi_khac TEXT,
    dien_tich_ho_boi DECIMAL(10, 2),
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(100) NOT NULL,
    don_vi VARCHAR(50),
    gia_tien DECIMAL(10, 2) NOT NULL
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_bat_dau DATE NOT NULL,
    ngay_ket_thuc DATE NOT NULL,
    tien_dat_coc DECIMAL(10, 2) NOT NULL,
    tong_tien DECIMAL(10, 2) NOT NULL,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    so_luong INT NOT NULL,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- Thêm dữ liệu
INSERT INTO vi_tri (ten_vi_tri) VALUES ('Quản Lý'), ('Nhân Viên');
INSERT INTO trinh_do (ten_trinh_do) VALUES ('Trung Cấp'), ('Cao Đẳng'), ('Đại Học'), ('Sau Đại Học');
INSERT INTO bo_phan (ten_bo_phan) VALUES ('Sale-Marketing'), ('Hành chính'), ('Phục vụ'), ('Quản lý');
INSERT INTO loai_khach (ten_loai_khach) VALUES ('Diamond'), ('Platinum'), ('Gold'), ('Silver'), ('Member');
INSERT INTO kieu_thue (ten_kieu_thue) VALUES ('year'), ('month'), ('day'), ('hour');
INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES ('Villa'), ('House'), ('Room');

INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) VALUES
('Nguyễn Văn An', '1970-11-07', '456231786', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
('Lê Văn Bình', '1997-04-09', '654231234', '0943213214', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
('Hồ Thị Yến', '1995-12-12', '99231733', '0932345678', 'thiyen@gmail.com', 'K234/11 Hải Phòng, Gia Lai', 2, 4, 3),
('Võ Công Toàn', '1980-04-04', '123432123', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 3, 1),
('Nguyễn Bính Phát', '1999-12-09', '120321321', '0932143121', 'phatphat@gmail.com', '294 Bạch Đằng, Đà Nẵng', 2, 1, 4);

INSERT INTO khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) VALUES
('Nguyễn Thị Hào', '1970-11-07', 'Nữ', '643431213', '0945243362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 'Nam', '865342132', '0954323333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3);

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, don_vi, gia_tien) VALUES
('Karaoke', 'giờ', 10000),
('Thuê xe máy', 'chiếc', 10000);

INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu) VALUES
('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', NULL, 3, 2, 2);

INSERT INTO hop_dong (ngay_bat_dau, ngay_ket_thuc, tien_dat_coc, tong_tien, ma_nhan_vien, ma_khach_hang, ma_dich_vu) VALUES
('2020-12-08', '2020-12-08', 0, 1000000, 1, 1, 3),
('2020-07-14', '2020-07-21', 20000, 5000000, 3, 2, 1);

INSERT INTO hop_dong_chi_tiet (so_luong, ma_hop_dong, ma_dich_vu_di_kem) VALUES
(5, 2, 4),
(8, 2, 5);

-- Truy vấn
SELECT * FROM nhan_vien WHERE ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%' AND CHAR_LENGTH(ho_ten) <= 15;

SELECT ma_khach_hang, ho_ten, ngay_sinh, TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) AS tuoi, dia_chi
FROM khach_hang
WHERE TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) BETWEEN 18 AND 50
AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten
ORDER BY so_lan_dat_phong ASC;
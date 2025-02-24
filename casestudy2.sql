CREATE DATABASE IF NOT exists case_study_database;
USE case_study_database;

-- Bảng vi_tri
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(50) NOT NULL
);

-- Bảng trinh_do
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(50) NOT NULL
);

-- Bảng bo_phan
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(50) NOT NULL
);

-- Bảng nhan_vien
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

-- Bảng loai_khach
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(50) NOT NULL
);

-- Bảng khach_hang
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

-- Bảng kieu_thue
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(50) NOT NULL
);

-- Bảng loai_dich_vu
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(50) NOT NULL
);

-- Bảng dich_vu
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

-- Bảng dich_vu_di_kem
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(100) NOT NULL,
    don_vi VARCHAR(50),
    gia_tien DECIMAL(10, 2) NOT NULL
);

-- Bảng hop_dong
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

-- Bảng hop_dong_chi_tiet
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    so_luong INT NOT NULL,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- câu1 Thêm dữ liệu

-- Bảng vi_tri
INSERT INTO vi_tri (ten_vi_tri) VALUES 
('Quản Lý'),
('Nhân Viên');

-- Bảng trinh_do
INSERT INTO trinh_do (ten_trinh_do) VALUES
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

-- Bảng bo_phan
INSERT INTO bo_phan (ten_bo_phan) VALUES
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

-- Bảng loai_khach
INSERT INTO loai_khach (ten_loai_khach) VALUES
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

-- Bảng kieu_thue
INSERT INTO kieu_thue (ten_kieu_thue) VALUES
('year'),
('month'),
('day'),
('hour');

-- Bảng loai_dich_vu
INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES
('Villa'),
('House'),
('Room');

-- Bảng nhan_vien
INSERT INTO nhan_vien (
    ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi,
    ma_vi_tri, ma_trinh_do, ma_bo_phan
) VALUES
('Nguyễn Văn An', '1970-11-07', '456231786', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
('Lê Văn Bình', '1997-04-09', '654231234', '0943213214', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
('Hồ Thị Yến', '1995-12-12', '99231733', '0932345678', 'thiyen@gmail.com', 'K234/11 Hải Phòng, Gia Lai', 2, 4, 3),
('Võ Công Toàn', '1980-04-04', '123432123', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 3, 1),
('Nguyễn Bính Phát', '1999-12-09', '120321321', '0932143121', 'phatphat@gmail.com', '294 Bạch Đằng, Đà Nẵng', 2, 1, 4),
('Khúc Nguyễn An Nghi', '2000-07-07', '098765432', '0978653231', 'annghi120@gmail.com', '49 Nguyễn Kiều, Đà Nẵng', 2, 2, 2),
('Nguyễn Hữu Hà', '1993-01-03', '053412334', '0941234121', 'nhh0101@gmail.com', '111 Hùng Vương, Hà Nội', 2, 3, 3),
('Nguyễn Hà Đồng', '1989-05-08', '098765323', '0932123444', 'donghanguyen@gmail.com', '21 Trần Phú, Huế', 2, 4, 4),
('Tống Hoàng', '1982-09-03', '256781231', '0254144441', 'hoangtong@gmail.com', '213 Hải Ninh, Nghệ An', 2, 3, 2),
('Nguyễn Công Đạo', '1994-01-08', '755434343', '0987867411', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đà Nẵng', 2, 3, 2);

-- Bảng khach_hang
INSERT INTO khach_hang (
    ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach
) VALUES
('Nguyễn Thị Hào', '1970-11-07', 'Nữ', '643431213', '0945243362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 'Nam', '865342132', '0954323333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghệ', '1990-02-10', 'Nam', '984312343', '0912345678', 'phenghan2702@gmail.com', '199 Hùng Ích Khiêm, Vinh', 1),
('Dương Văn Quan', '1981-07-08', 'Nam', '543243111', '0954533111', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhị Nhi', '1995-12-09', 'Nữ', '295654432', '031245678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
('Tôn Nữ Mộc Châu', '1987-06-08', 'Nữ', '564321321', '0976543333', 'tonnuchau@gmail.com', 'K234/11 Hải Phòng, Đà Nẵng', 5),
('Nguyễn Mỹ Kim', '1994-01-07', 'Nữ', '965654321', '0943123456', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
('Nguyễn Thị Hào', '1990-07-01', 'Nữ', '865342133', '0965433222', 'haohaog9@gmail.com', '198 Văn Linh, Kon Tum', 3),
('Trần Đại Danh', '1994-07-01', 'Nam', '334432132', '0953124444', 'danhhai99@gmail.com', '29 Lý Thường Kiệt, Quảng Ngãi', 1),
('Nguyễn Tâm Đắc', '1997-01-01', 'Nam', '343312432', '0987654321', 'dactam@gmail.com', '6 Hoà Khánh, Đà Nẵng', 2);

-- Bảng dich_vu_di_kem
INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, don_vi, gia_tien) VALUES
('Karaoke', 'giờ', 10000),
('Thuê xe máy', 'chiếc', 10000),
('Thuê xe đạp', 'chiếc', 20000),
('Buffet buổi sáng', 'suất', 15000),
('Buffet buổi trưa', 'suất', 90000),
('Buffet buổi tối', 'suất', 16000);

-- Bảng dich_vu
INSERT INTO dich_vu (
    ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, 
    tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, 
    ma_kieu_thue, ma_loai_dich_vu
) VALUES
('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', NULL, 3, 2, 2),
('Room Twin 01', 5000, 1000000, 8, 'normal', 'Có tivi', NULL, NULL, 4, 3),
('Villa No Beach Front', 22000, 9000000, 9, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', NULL, 2, 3, 2),
('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', NULL, NULL, 4, 3);

-- Bảng hop_dong
INSERT INTO hop_dong (
    ngay_bat_dau, ngay_ket_thuc, tien_dat_coc, tong_tien, 
    ma_nhan_vien, ma_khach_hang, ma_dich_vu
) VALUES
('2020-12-08', '2020-12-08', 0, 1000000, 1, 1, 3),
('2020-07-14', '2020-07-21', 20000, 5000000, 3, 2, 1),
('2021-03-15', '2021-03-17', 50000, 9000000, 7, 3, 4),
('2021-01-15', '2021-01-18', 100000, 4000000, 2, 5, 2),
('2021-07-03', '2021-07-15', 0, 1000000, 3, 1, 3),
('2021-06-01', '2021-06-03', 0, 5000000, 7, 3, 2),
('2021-03-10', '2021-03-12', 0, 4000000, 5, 4, 5),
('2021-04-12', '2021-04-14', 150000, 900000, 2, 6, 6),
('2021-04-12', '2021-04-14', 0, 4000000, 3, 2, 5),
('2021-05-10', '2021-05-12', 0, 10000000, 5, 7, 1),
('2021-04-21', '2021-04-26', 0, 5000000, 2, 3, 2),
('2021-05-25', '2021-05-27', 0, 1000000, 7, 2, 3);

-- Bảng hop_dong_chi_tiet
INSERT INTO hop_dong_chi_tiet (
    so_luong, ma_hop_dong, ma_dich_vu_di_kem
) VALUES
(5, 2, 4),
(8, 2, 5),
(15, 3, 6),
(1, 3, 1),
(3, 1, 3),
(11, 3, 2),
(1, 1, 1),
(1, 1, 2),
(2, 12, 2);


-- câu 2 
-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT *
FROM nhan_vien
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%')
  AND CHAR_LENGTH(ho_ten) <= 15;

-- câu 3
SELECT 
    ma_khach_hang,
    ho_ten,
    ngay_sinh,
    TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) AS tuoi,
    dia_chi
FROM khach_hang
WHERE TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) BETWEEN 18 AND 50
  AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

-- câu 4
SELECT kh.ma_khach_hang,
       kh.ho_ten,
       COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten
ORDER BY so_lan_dat_phong ASC;

-- câu 5
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (dv.chi_phi_thue + ifnull(hdct.so_luong * dvdk.gia, 0)) as tong_tien
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
order by kh.ma_khach_hang;

-- câu 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (
    select distinct hd.ma_dich_vu
    from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2021
    and month(hd.ngay_lam_hop_dong) in (1, 2, 3)
);

-- câu 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu in (
    select distinct hd.ma_dich_vu
    from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2020
)
and dv.ma_dich_vu not in (
    select distinct hd.ma_dich_vu
    from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2021
);

-- câu 8
select distinct ho_ten 
from khach_hang;

-- 2 group by
select ho_ten 
from khach_hang 
group by ho_ten;

--  3 exists
select ho_ten 
from khach_hang kh1 
where not exists (
    select 1 from khach_hang kh2 
    where kh1.ho_ten = kh2.ho_ten 
    and kh1.ma_khach_hang > kh2.ma_khach_hang
);

-- câu 9
select month(hd.ngay_lam_hop_dong) as thang, 
       count(distinct hd.ma_khach_hang) as so_luong_khach_hang
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong)
order by thang;

-- câu 10
select hd.ma_hop_dong, 
       hd.ngay_lam_hop_dong, 
       hd.ngay_ket_thuc, 
       hd.tien_dat_coc, 
       coalesce(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc
order by hd.ma_hop_dong;
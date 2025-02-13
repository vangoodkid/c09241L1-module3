CREATE DATABASE ss2_bai1;
USE ss2_bai1;

CREATE TABLE phieuxuat (
    soPx INT PRIMARY KEY AUTO_INCREMENT,
    ngayxuat DATETIME
);

CREATE TABLE vattu (
    mavtu INT PRIMARY KEY AUTO_INCREMENT,
    tenvt VARCHAR(100)
);

CREATE TABLE phieunhap (
    soPN INT PRIMARY KEY AUTO_INCREMENT,
    ngaynhap DATETIME
);

CREATE TABLE dondh (
    sodh INT PRIMARY KEY AUTO_INCREMENT,
    ngayDH DATETIME
);

CREATE TABLE nhacc (
    mancc INT PRIMARY KEY AUTO_INCREMENT,
    tenncc NVARCHAR(100),
    diachi NVARCHAR(100)
);

CREATE TABLE sdt (
    number VARCHAR(15),
    id INT PRIMARY KEY AUTO_INCREMENT,
    nhacc_id INT,
    FOREIGN KEY (nhacc_id) REFERENCES nhacc (mancc)
);

CREATE TABLE chitietphieuxuat (
    phieuxuat_id INT,
    vattu_id INT,
    DGxuat INT,
    SLxuat INT,
    PRIMARY KEY (phieuxuat_id, vattu_id),
    FOREIGN KEY (phieuxuat_id) REFERENCES phieuxuat (soPx),
    FOREIGN KEY (vattu_id) REFERENCES vattu (mavtu)
);

CREATE TABLE chitietphieunhap (
    soPN INT,
    mavtu INT,
    DGnhap INT,
    SLnhap INT,
    PRIMARY KEY (soPN, mavtu),
    FOREIGN KEY (soPN) REFERENCES phieunhap (soPN),
    FOREIGN KEY (mavtu) REFERENCES vattu (mavtu)
);

CREATE TABLE chitietdonhang (
    mavtu INT,
    sodh INT,
    PRIMARY KEY (mavtu, sodh),
    FOREIGN KEY (mavtu) REFERENCES vattu (mavtu),
    FOREIGN KEY (sodh) REFERENCES dondh (sodh)
);
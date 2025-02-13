create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table Customer(
	cID int auto_increment primary key,
    cName varchar(50) not null default ("abc"),
    cAge int(3)
);
create table `Order`(
	oID int auto_increment primary key,
    cID int,
    oDate date,
    oTotalPrice int,
    foreign key (cID) references Customer(cID)
);
create table Product(
	pID int auto_increment primary key,
    pName varchar(50),
    pPrice int
);
create table OrderDetail(
	oID int,
    pID int,
    primary key(oID, pID),
    foreign key(oID) references `Order`(oID),
    foreign key(pID) references Product(pID)
);
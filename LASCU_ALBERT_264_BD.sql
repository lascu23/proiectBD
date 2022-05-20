DROP TABLE DETAILS_ORDER;
DROP TABLE ORDERS;
DROP TABLE CLIENTS;
DROP TABLE EMPLOYEES;
DROP TABLE DEPARTMENTS;
DROP TABLE PRODUCT_SHEET;
DROP TABLE PRODUCTS;
DROP TABLE TRANSPORT;
DROP TABLE RAW_MATERIALS;
DROP TABLE PROVIDER;

create table `DEPARTMENTS`(
`DEPARTMENT_ID` INT primary key auto_increment,
`DEP_NAME` VARCHAR(25) NOT NULL
);

CREATE TABLE `employees`(
	`EMPLOYEE_ID` INT primary key auto_increment,
    `LAST_NAME` VARCHAR(45) NOT NULL,
    `FIRST_NAME` VARCHAR(45) NOT NULL,
    `BIRTH_DATE` DATE NOT NULL,
    `HIRE_DATE` DATE NOT NULL,
    `DEPARTMENT_ID` INT NOT NULL,
	FOREIGN KEY(`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`) ON DELETE CASCADE
);

create table `CLIENTS`(
	`CLIENT_ID` INT primary key auto_increment,
    `CLIENT_NAME` VARCHAR(25),
    `PHONE` INT UNIQUE
);

create table `ORDERS`(
	`ID_ORDER` INT PRIMARY KEY AUTO_INCREMENT,
    `EMPLOYEE_ID` INT NOT NULL,
    `CLIENT_ID` INT NOT NULL,
    `ORDER_DATE` DATE NOT NULL,
    FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEES` (`EMPLOYEE_ID`),
    FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENTS` (`CLIENT_ID`)
);

CREATE TABLE PRODUCTS(
	PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(25) NOT NULL,
    AMOUNT_RECEIVED INT NOT NULL,
	AMOUNT_GIVEN INT NOT NULL
);

alter table products
add constraint check(amount_given<=amount_received);


create table `details_order`(
	`ID_ORDER` INT NOT NULL,
    `PRODUCT_ID` INT NOT NULL,
    `PRODUCT_AMOUNT` INT NOT NULL,
    PRIMARY KEY(ID_ORDER,PRODUCT_ID),
    FOREIGN KEY(`ID_ORDER`) REFERENCES ORDERS(ID_ORDER),
	FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

create table `PROVIDER`(
	`PROVIDER_ID` INT PRIMARY KEY AUTO_INCREMENT,
    `PROVIDER_NAME` VARCHAR(25) NOT NULL,
    `PHONE` INT NOT NULL,
    `CITY` VARCHAR(20) NOT NULL
);

CREATE TABLE `RAW_MATERIALS`(
	`ID_RM` INT PRIMARY KEY AUTO_INCREMENT,
    `RM_NAME` VARCHAR(15) NOT NULL,
    `PRICE` INT NOT NULL,
    `IN_AMOUNT` INT NOT NULL,
    `OUT_AMOUNT` INT NOT NULL,
    `PROVIDER_ID` INT,
    FOREIGN KEY(PROVIDER_ID) REFERENCES PROVIDER(PROVIDER_ID) ON DELETE SET NULL
);

alter table raw_materials
add constraint check(price>0);

alter table raw_materials
add constraint check(in_amount >= out_amount);

CREATE TABLE PRODUCT_SHEET(
	 ID_RM INT NOT NULL,
     PRODUCT_ID INT NOT NULL,
     AMOUNT_RM INT NOT NULL,
     PRIMARY KEY(ID_RM,PRODUCT_ID),
     FOREIGN KEY(ID_RM) REFERENCES RAW_MATERIALS(ID_RM),
     FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

CREATE TABLE `TRANSPORT`(
	`ID_RM` INT NOT NULL,
    `PROVIDER_ID` INT NOT NULL,
    `AMOUNT_RM` INT NOT NULL,
    PRIMARY KEY(ID_RM,PROVIDER_ID),
    FOREIGN KEY(ID_RM) REFERENCES raw_materials(ID_RM),
    FOREIGN KEY (PROVIDER_ID) REFERENCES PROVIDER(PROVIDER_ID)
);

insert into departments
values(NULL,'CONTABILITATE');

insert into departments
values(NULL,'VANZARI');

insert into departments
values(NULL,'BUCATARIE');

insert into departments
values(NULL,'ADMINISTRATIV');

insert into departments
values(NULL,'MARKETING');

insert into EMPLOYEES
values(NULL,'Popescu','Alex','97-3-23','20-5-3',1);

insert into EMPLOYEES
values(NULL,'Ilie','Dan','95-6-11','21-12-5',2);

insert into EMPLOYEES
values(NULL,'Dinca','Ionut','95-7-12','21-11-6',2);

insert into EMPLOYEES
values(NULL,'Georgescu','Maria','93-11-3','08-12-5',3);

insert into EMPLOYEES
values(NULL,'Marica','Stefan','98-4-13','10-4-11',3);

insert into EMPLOYEES
values(NULL,'Ratoi','Radu','98-7-23','11-7-31',4);

insert into EMPLOYEES
values(NULL,'Magheru','Cosmin','00-11-15','15-9-1',5);

insert into EMPLOYEES
values(NULL,'Marcel','Petrica','97-6-1','20-6-1',2);

insert into clients
values(null,'Patrascu',0759274590);

insert into clients
values(null,'Gabi',null);

insert into clients
values(null,null,0792614820);

insert into clients
values(null,null,null);

insert into clients
values(null,null,null);

insert into orders
values(null,7,5,'21-6-21');

insert into orders
values(null,8,1,'22-1-7');

insert into orders
values(null,2,3,'21-12-24');

insert into products
values(null,'PIZZA',23,15);

insert into products
values(null,'BURGERS',30,25);

insert into products
values(null,'CAKE',15,7);

insert into products
values(null,'PASTA',50,49);

insert into products
values(null,'LEMONADE',45,40);

INSERT INTO details_order
VALUES(3,5,3);

INSERT INTO details_order
VALUES(1,4,15);

INSERT INTO PROVIDER
VALUES(null,'RITA',0726491045,'BUCURESTI');

INSERT INTO PROVIDER
VALUES(null,'ALPHA',0726445678,'CONSTANTA');

INSERT INTO PROVIDER
VALUES(null,'CARTO',0798765678,'BUZAU');

INSERT INTO raw_materials
VALUES(null,'FAINA',12,50,47,1);

INSERT INTO raw_materials
VALUES(null,'oua',2,120,110,2);

INSERT INTO raw_materials
VALUES(null,'lapte',7,20,20,3);

INSERT INTO product_sheet
VALUES(1,3,20);

INSERT INTO product_sheet
VALUES(2,1,50);

INSERT INTO product_sheet
VALUES(2,4,35);

INSERT INTO TRANSPORT
VALUES(1,1,40);

INSERT INTO TRANSPORT
VALUES(2,2,120);

select * from departments;
select * from employees;
select * from clients;
select * from orders;
select * from details_order;
select * from products;
select * from product_sheet;
select * from raw_materials;
select * from provider;
select * from transport;























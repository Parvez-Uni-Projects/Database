
CREATE TABLE CUST_ORDER(
    ORDER_NBR           int           NOT NULL,
    CUST_NBR            int           NOT NULL,
    SALES_EMP_ID        int           NOT NULL,
    SALE_PRICE          int,
    ORDER_DT            DATE                NOT NULL,
    EXPECTED_SHIP_DT    DATE                NOT NULL,
    CANCELLED_DT        DATE,
    SHIP_DT             DATE,
    STATUS              VARCHAR(20),
    CONSTRAINT cust_order_pk PRIMARY KEY (ORDER_NBR)
   );

CREATE TABLE CUSTOMER(
    CUST_NBR    int       NOT NULL,
    NAME        VARCHAR(30)    NOT NULL,
    REGION_ID   int,
    INACTIVE_DT DATE,
    INACTIVE_IND CHAR(1),
    TOT_ORDERS  int,
    LAST_ORDER_DT DATE,
    CONSTRAINT customer_pk PRIMARY KEY (CUST_NBR)
    );

CREATE TABLE DEPARTMENT(
    DEPT_ID    int       NOT NULL,
    NAME       VARCHAR(20),
    LOCATION_ID int,
    CONSTRAINT department_pk PRIMARY KEY (DEPT_ID)
    );

CREATE TABLE EMPLOYEE(
    EMP_ID            int    NOT NULL,
    FNAME             VARCHAR(20),
    LNAME             VARCHAR(20),
    DEPT_ID           int    NOT NULL,
    MANAGER_EMP_ID    int,
    SALARY            int,
    HIRE_DATE         DATE,
    JOB_ID            int,
    CONSTRAINT employee_pk PRIMARY KEY (EMP_ID)
    );

CREATE TABLE INVENTORY_CLASS(
    INV_CLASS    VARCHAR(3) NOT NULL,
    LOW_COST     int,
    HIGH_COST    int,
    CONSTRAINT inv_class_pk PRIMARY KEY (INV_CLASS)
    );

CREATE TABLE JOB(
    JOB_ID    int NOT NULL,
    FUNCTION_TO_DO  VARCHAR(30),
    CONSTRAINT job_pk PRIMARY KEY (JOB_ID)
    );
    
CREATE TABLE LINE_ITEM(
    ORDER_NBR     int      NOT NULL,
    PART_NBR      VARCHAR  NOT NULL,
    QTY           int      NOT NULL,
    FILLED_QTY    int,
    CONSTRAINT line_item_pk PRIMARY KEY (ORDER_NBR,PART_NBR)
    );

CREATE TABLE LOCATION(
    LOCATION_ID    int NOT NULL,
    REGIONAL_GROUP VARCHAR(20),
    CONSTRAINT location_pk PRIMARY KEY (LOCATION_ID)
   );

CREATE TABLE MONTHS(
    YEAR       int NOT NULL,
    MONTH      int NOT NULL,
    CONSTRAINT months_pk PRIMARY KEY (YEAR, MONTH)
    );

CREATE TABLE MTD_ORDERS(
    TOT_ORDERS                  int NOT NULL,
    TOT_SALE_PRICE              int NOT NULL,
    MAX_SALE_PRICE              int NOT NULL,
    EUROPE_TOT_ORDERS           int NOT NULL,
    EUROPE_TOT_SALE_PRICE       int NOT NULL,
    EUROPE_MAX_SALE_PRICE       int NOT NULL,
    NORTHAMERICA_TOT_ORDERS     int NOT NULL,
    NORTHAMERICA_TOT_SALE_PRICE int NOT NULL,
    NORTHAMERICA_MAX_SALE_PRICE int NOT NULL
);

CREATE TABLE ORDERS(
    CUST_NBR       int NOT NULL,
    REGION_ID      int NOT NULL,
    SALESPERSON_ID int NOT NULL,
    YEAR           int NOT NULL,
    MONTH          int NOT NULL,
    TOT_ORDERS     int NOT NULL,
    TOT_SALEs      int NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY (YEAR, MONTH, CUST_NBR, REGION_ID,
      SALESPERSON_ID)
    );
    
CREATE TABLE PART(
    PART_NBR         VARCHAR(20)        NOT NULL,
    NAME             VARCHAR(30)        NOT NULL,
    SUPPLIER_ID      int           NOT NULL,
    STATUS           VARCHAR(20)        NOT NULL,
    INVENTORY_QTY    int,
    UNIT_COST        int,
    RESUPPLY_DATE    DATE,
    CONSTRAINT part_pk PRIMARY KEY (PART_NBR)
   );

CREATE TABLE SALESPERSON(
    SALESPERSON_ID   int NOT NULL,
    NAME              VARCHAR(50) NOT NULL,
    PRIMARY_REGION_ID int NOT NULL,
    CONSTRAINT salesperson_pk PRIMARY KEY (SALESPERSON_ID)
    );

CREATE TABLE SUPPLIER(
    SUPPLIER_ID    int     NOT NULL,
    NAME           VARCHAR(30)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (SUPPLIER_ID)
   );

CREATE TABLE REGION(
    REGION_ID    int       NOT NULL,
    NAME       VARCHAR(20),
    SUPER_REGION_ID int,
    CONSTRAINT region_pk PRIMARY KEY (REGION_ID)
   );
        
        
CREATE TABLE ASSEMBLY (
 ASSEMBLY_TYPE              VARCHAR(4) 	NOT NULL,
 ASSEMBLY_ID                int 		NOT NULL,
 DESCRIPTION                VARCHAR(20) 	NOT NULL,
 PARENT_ASSEMBLY_TYPE       VARCHAR(4),
 PARENT_ASSEMBLY_ID         int,
     CONSTRAINT assembly_pk PRIMARY KEY (ASSEMBLY_TYPE, ASSEMBLY_ID)
     );


-- Create table retailer

CREATE TABLE RETAILER(
 RTLR_NBR            int    NOT NULL ,
 NAME                 VARCHAR(45),                    
 ADDRESS              VARCHAR(40),
 CITY                 VARCHAR(30),
 STATE                VARCHAR(2),
 ZIP_CODE             VARCHAR(9),
 AREA_CODE            int,
 PHONE_NUMBER         int,
 SALESPERSON_ID       int,
 CREDIT_LIMIT         int,
 COMMENTS             int,
    CONSTRAINT RETAILER_PK PRIMARY KEY (RTLR_NBR)
    );

-- Create view DEPT


        
        
     --Setup the needed default date format, and language, for the session.
--PROMPT Changing date language to 'AMERICAN', and
--PROMPT the date format to 'DD-MON-RR'.
--ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';
--ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR';
--PROMPT
--PROMPT You may wish to reconnect after this script
--PROMPT completes, as reconnecting will restore your
--PROMPT date language and date format settings to
--PROMPT their defaults.
--PROMPT
--PAUSE Press ENTER to continue...

-- Delete existing data from tables used in chapter 3.


delete from employee;
delete from location;
delete from department;
delete from job;
delete from supplier;
delete from part;
delete from retailer;
delete from inventory_class;


-- Insert new data relevant to chapter 3.


-- Insert data into employee

insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7369,'JOHN','SMITH',20,7902,800,'17-DEC-80',667);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7499,'KEVIN','ALLEN',30,7698,1600,'20-FEB-81',670);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7521,'CYNTHIA','WARD',30,7698,1250,'22-FEB-81',670);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7566,'TERRY','JONES',20,7839,2000,'02-APR-81',671);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7654,'KENNETH','MARTIN',30,7698,1250,'28-SEP-81',670);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7698,'MARION','BLAKE',30,7839,2850,'01-MAY-80',671);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7782,'CAROL','CLARK',10,7839,2450,'09-JUN-81',671);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7788,'DONALD','SCOTT',20,7566,3000,'19-APR-87',669);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7839,'FRANCIS','KING',10, null,5000,'17-NOV-81',672);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7844,'MARY','TURNER',30,7698,1500,'08-SEP-81',670);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7876,'DIANE','ADAMS',20,7788,1100,'23-MAY-87',667);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7900,'FRED','JAMES',30,7698,950,'03-DEC-81',667);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7902,'JENNIFER','FORD',20,7566,3000,'03-DEC-81',669);
insert into employee 
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
values
(7934,'BARBARA','MILLER',10,7782,1300,'23-JAN-82',667);




-- Insert data into location

insert into location 
(LOCATION_ID,REGIONAL_GROUP)
values
(122,'NEW YORK');
insert into location 
(LOCATION_ID,REGIONAL_GROUP)
values
(124,'DALLAS');
insert into location 
(LOCATION_ID,REGIONAL_GROUP)
values
(123,'CHICAGO');
insert into location 
(LOCATION_ID,REGIONAL_GROUP)
values
(167,'BOSTON');
insert into location 
(LOCATION_ID,REGIONAL_GROUP)
values
(144,'SAN FRANCISCO');




-- Insert data into department

insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(10,'ACCOUNTING',122);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(20,'RESEARCH',124);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(30,'SALES',123);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(40,'OPERATIONS',167);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(12,'RESEARCH',122);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(13,'SALES',122);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(14,'OPERATIONS',122);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(23,'SALES',124);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(24,'OPERATIONS',124);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(34,'OPERATIONS',123);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(43,'SALES',167);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(50,'MARKETING',null);
insert into department 
(DEPT_ID,NAME,LOCATION_ID)
values
(60,'CONSULTING',null);




-- Insert data into Job

insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(667,'CLERK');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(668,'STAFF');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(669,'ANALYST');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(670,'SALESPERSON');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(671,'MANAGER');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(672,'PRESIDENT');
insert into Job 
(JOB_ID,FUNCTION_TO_DO)
values
(665,'SECRETARY');





-- Insert data into Supplier

insert into Supplier
(SUPPLIER_ID, NAME)
values
(101, 'Pacific Disks, Inc.');


insert into Supplier
(SUPPLIER_ID, NAME)
values
(102, 'Silicon Valley MicroChips');

insert into Supplier
(SUPPLIER_ID, NAME)
values
(103, 'Blue River Electronics');




-- Insert data into Part

insert into Part
(PART_NBR, NAME, SUPPLIER_ID, STATUS, INVENTORY_QTY, UNIT_COST, RESUPPLY_DATE)
values
('HD211', '20 GB Hard Disk', 101, 'ACTIVE', 5, 2000, '12-DEC-00');

insert into Part
(PART_NBR, NAME, SUPPLIER_ID, STATUS, INVENTORY_QTY, UNIT_COST, RESUPPLY_DATE)
values
('P3000', '3000 MHz Processor', 102, 'ACTIVE', 12, 600, '03-NOV-00');

commit;


-- Insert data into Inventory_class

insert into Inventory_class
(INV_CLASS, LOW_COST, HIGH_COST)
values
('C',0,99);

insert into Inventory_class
(INV_CLASS, LOW_COST, HIGH_COST)
values
('B',100,999);

insert into Inventory_class
(INV_CLASS, LOW_COST, HIGH_COST)
values
('A',1000,9999);



-- Inserting data into retailer


insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(100,'JOCKSPORTS','345 VIEWRIDGE','BELMONT','CA','96711',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(101,'TKB SPORT SHOP','490 BOLI RD.','REDWOOD CITY','CA','94061',7521);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(102,'VOLLYRITE','9722 HAMILTON','BURLINGAME','CA','95133',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(103,'JUST TENNIS','HILLVIEW MALL','BURLINGAME','CA','97544',7521);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(104,'EVERY MOUNTAIN','574 SURRY RD.','CUPERTINO','CA','93301',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(105,'K + T SPORTS','3476 EL PASEO','SANTA CLARA','CA','91003',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(106,'SHAPE UP','908 SEQUOIA','PALO ALTO','CA','94301',7521);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(107,'WOMENS SPORTS','VALCO VILLAGE','SUNNYVALE','CA','93301',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(201,'STADIUM SPORTS','47 IRVING PL.','NEW YORK','NY','10003',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(202,'HOOPS','2345 ADAMS AVE.','LEICESTER','MA','01524',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(203,'REBOUND SPORTS','2 E. 14TH ST.','NEW YORK','NY','10009',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(204,'THE POWER FORWARD','1 KNOTS LANDING','DALLAS','TX','75248',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(205,'POINT GUARD','20 THURSTON ST.','YONKERS','NY','10956',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(206,'THE COLISEUM','5678 WILBUR PL.','SCARSDALE','NY','10583',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(207,'FAST BREAK','1000 HERBERT LN.','CONCORD','MA','01742',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(208,'AL AND BOB''S SPORTS','260 YORKTOWN CT.','AUSTIN','TX','78731',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(211,'AT BAT','234 BEACHEM ST.','BROOKLINE','MA','02146',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(212,'ALL SPORT','1000 38TH ST.','BROOKLYN','NY','11210',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(213,'GOOD SPORT','400 46TH ST.','SUNNYSIDE','NY','11104',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(214,'AL''S PRO SHOP','45 SPRUCE ST.','SPRING','TX','77388',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(215,'BOB''S FAMILY SPORTS','400 E. 23RD','HOUSTON','TX','77026',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(216,'THE ALL AMERICAN','547 PRENTICE RD.','CHELSEA','MA','02150',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(217,'HIT, THROW, AND RUN','333 WOOD COURT','GRAPEVINE','TX','76051',7654);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(218,'THE OUTFIELD','346 GARDEN BLVD.','FLUSHING','NY','11355',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(221,'WHEELS AND DEALS','2 MEMORIAL DRIVE','HOUSTON','TX','77007',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(222,'JUST BIKES','4000 PARKRIDGE BLVD.','DALLAS','TX','75205',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(223,'VELO SPORTS','23 WHITE ST.','MALDEN','MA','02148',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(224,'JOE''S BIKE SHOP','4500 FOX COURT','GRAND PRARIE','TX','75051',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(225,'BOB''S SWIM, CYCLE, AND RUN','300 HORSECREEK CIRCLE','IRVING','TX','75039',7844);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(226,'CENTURY SHOP','8 DAGMAR DR.','HUNTINGTON','NY','11743',7521);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(227,'THE TOUR','2500 GARDNER RD.','SOMERVILLE','MA','02144',7499);
insert into retailer
(RTLR_NBR,NAME,ADDRESS,CITY,STATE,ZIP_CODE,SALESPERSON_ID)
values
(228,'FITNESS FIRST','5000 85TH ST.','JACKSON HEIGHTS','NY','11372',7521);








   
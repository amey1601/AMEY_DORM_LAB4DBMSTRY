CREATE TABLE supplier(
    SUPP_ID int PRIMARY KEY,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
);

CREATE TABLE customer(
    CUS_ID int PRIMARY KEY,
    CUS_NAME varchar(20) NOT NULL,
    
    CUS_PHONE varchar(10) NOT NULL,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER char 
);


CREATE TABLE category(
CAT_ID int PRIMARY KEY,
    CAT_NAME varchar(50) NOT NULL);
    
  
CREATE TABLE product(
PRO_ID int PRIMARY KEY ,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
PRO_DESC VARCHAR(60) ,
CAT_ID INT ,
foreign key(CAT_ID) references category(CAT_ID)
);


CREATE TABLE supplier_pricing(
PRICING_ID INT PRIMARY KEY ,
PRO_ID INT,
foreign key(PRO_ID)  references product(PRO_ID),
SUPP_ID INT,
foreign key(SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE INT default 0
);
CREATE TABLE orderr(
    ORD_ID int PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    
    ORD_DATE DATE  NOT NULL,
    CUS_ID INT,
    foreign key(CUS_ID) references customer(CUS_ID) ,
    PRICING_ID INT,
    
   foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

CREATE TABLE rating(
    RAT_ID int PRIMARY KEY,
    ORD_ID INT,
    
    foreign key(ORD_ID) references ORDERR(ORD_ID) ,
   RAT_RATSTARS INT NOT NULL
);






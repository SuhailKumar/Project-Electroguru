DROP DATABASE `electronic_repair`;
CREATE DATABASE `electronic_repair`;

USE `electronic_repair`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(100) PRIMARY KEY,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('Admin','Admin@123');
SELECT * FROM `admin`;


/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `username` varchar(100) PRIMARY KEY,
  `password` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

select * from customer;



/*Table structure for table `tech` */

DROP TABLE IF EXISTS `technician`;

CREATE TABLE `technician` (
  `username` varchar(100) PRIMARY KEY,
  `password` varchar(100) DEFAULT NULL,
  `ttype` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `technicianstatus` varchar(15) default 'Not Approved',
`latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table technician add technicianstatus varchar (20) default 'Not Approved';

/*Data for the table `tech` */

insert  into `technician`(`username`,`password`,`ttype`,`email`,`gender`,`dob`,`address`,`mobile`) values ('Ajay','Ajay@123','Laptop','ajay@gmail.com','Male','2019-12-05','pune','7704367291');
SELECT t.username,t.ttype,t.gender,t.address,t.email,t.mobile,t.status,t.rating FROM tech t JOIN service s WHERE t.address = s.address AND t.ttype = s.appliance;
select * from technician;
update technician set technicianstatus='Approved' where  username='Leo';


/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `username` varchar(100) ,
  `` varbinary(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `bookingid` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `status` varbinary(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bill` */

insert  into `bill`(`tusername`,`tlocation`,`email`,`mobile`,`bookingid`,`amount`,`device`,`status`) values ('moulali','Begumpet','chotu.1000projects@gmail.com','7702177291','5021','1000','Laptop','paid');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
`bookingid` int Primary key auto_increment,
  `device` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` varchar(15) default 'Not Assign' ,
  `amount` int default null,
  `username` varchar(100), foreign key(username) references customer(username),
  `technicianname` varchar(100), foreign key(technicianname) references technician(username)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

insert  into `booking` values ('Laptop','suhail@gmail.com','mumbai','5645879065','17.65674569749', '18.7657645674','12567');
select * from booking;
update `booking` set status = 'Assigned' where technicianname ='Leo' and bookingid=1;
update `booking` set status = 'Not Assign' where bookingid>0;


insert  into `customer`(`username`,`password`,`gender`,`email`,`address`,`mobile`,`latitude`,`longitude`) values ('chotu','123','Male','chotu.1000projects@gmail.com','Begumpet','7702177291','17.45939047315574','78.46655243234636');
 
 
/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
   `tusername` varchar(100) PRIMARY KEY,
   `tlocation` varchar(100) DEFAULT NULL,
   `device` varchar(100) DEFAULT NULL,
   `email` varchar(100) DEFAULT NULL,
   `address` varchar(100) DEFAULT NULL,
   `mobile` varchar(100) DEFAULT NULL,
   `bookingid` varchar(100) DEFAULT NULL,
   `rating` varchar(100) DEFAULT 'pending'
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- /*Data for the table `response` */

   insert  into `feedback`(`tusername`,`tlocation`,`device`,`email`,`address`,`mobile`,`bookingid`,`rating`) values ('moulali','Begumpet','Laptop','chotu.1000projects@gmail.com','Begumpet','7702177291','5021','pending'),('moulali','Begumpet','Laptop','moulali@1000projectsgmail.com','Begumpet','7702177291','6736','5'),('qwe','Begumpet','Laptop','chotu.1000projects@gmail.com','Begumpet','0987456123','5044','pending');


DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
   `appliance` varchar(100) PRIMARY KEY,
   `brand` varchar(100) DEFAULT NULL,
   `problem` varchar(100) DEFAULT NULL,
   `address` varchar(100) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- /*Data for the table `response` */

insert  into `service`(`appliance`,`brand`,`problem`,`address`) values ('Laptop','acer','Windows corruption not working','Bangalore'),('Tv','samsung','Picture problem','Tamilnadu'),('camera','canon','lens problem','pune');
SELECT * FROM service;


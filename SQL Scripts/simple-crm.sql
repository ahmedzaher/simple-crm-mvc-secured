
CREATE DATABASE IF NOT EXISTS simple_crm;

USE  simple_crm; 

CREATE TABLE IF NOT EXISTS customer(
	 id INT AUTO_INCREMENT,
	 first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(32) NOT NULL,
     email VARCHAR(32) NOT NULL, 
     
     PRIMARY KEY(id)
)ENGINE=innoDB DEFAULT CHARSET=latin1;
 
 
# Security
CREATE TABLE IF NOT EXISTS `users`(
	`username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(68) NOT NULL,
    `enabled` TINYINT(1) NOT NULL,
    
    PRIMARY KEY(`username`)
)ENGINE=innoDB	DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `authorities`(
	`username` VARCHAR(50) NOT NULL,
    `authority` VARCHAR(50) NOT NULL,
    
    UNIQUE KEY (`username`, `authority`),
    FOREIGN KEY (`username`) REFERENCES `users`(`username`)
)ENGINE=innoDB	DEFAULT CHARSET=latin1;


INSERT INTO `users` VALUES('admin','{bcrypt}$2a$04$GyIOxOQPHowAQyQAToJhNeVpTwwNHGhRsF5RbfeprU3H8VvqrIRCq' , 1 );  		# password is admin
INSERT INTO `users` VALUES('manager1','{bcrypt}$2a$04$WlhyIUQV1MbxvJ5p429OEe6LxVy7BqFFi3tf9IZauDj7NT6il680C' , 1 );		# password is manager1
INSERT INTO `users` VALUES('employee1','{bcrypt}$2a$04$6el3Wj/9zLF2apYtk/ox1uTMd/NGj5AZZm2IJWLGOGz.PTLTqEzLq' , 1 );	# password is employee1

INSERT INTO `authorities` VALUES('employee1','ROLE_EMPLOYEE');
INSERT INTO `authorities` VALUES('manager1','ROLE_EMPLOYEE');
INSERT INTO `authorities` VALUES('manager1','ROLE_MANAGER');
INSERT INTO `authorities` VALUES('admin','ROLE_EMPLOYEE');
INSERT INTO `authorities` VALUES('admin','ROLE_ADMIN');
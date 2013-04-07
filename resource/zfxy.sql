create database zfxy ;
use zfxy ;
CREATE TABLE userinfo (
  id bigint(20) NOT NULL auto_increment,
  name varchar(32) NOT NULL,
  sex varchar(10) default NULL,
  password varchar(32) default NULL,
  category varchar(100) NOT NULL,
  position varchar(100)  default NULL,
  detail text,
  email varchar(32) default NULL,
  tel varchar(32) default NULL,
  head varchar(255) default NULL,
  PRIMARY KEY  (id)
) ;
INSERT INTO userinfo(name,sex,password,category,position,detail,email,tel,head)
 VALUES ('windy','man','windy','ajfojasodfjaosdjfo',NULL,'hahahah',NULL,NULL,NULL);
INSERT INTO userinfo(name,sex,password,category,position,detail,email,tel,head)
 VALUES ('admin',NULL,'admin','student',NULL,'student',NULL,NULL,NULL);
CREATE TABLE eduinfo( 
   id BIGINT NOT NULL AUTO_INCREMENT , 
   title VARCHAR(200) NOT NULL , 
   content LONGTEXT NOT NULL , 
   addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL , 
   auther VARCHAR(32) DEFAULT 'Anonymity  '  null , 
   category VARCHAR(200) NOT NULL , 
   photopath VARCHAR(255) , 
   audited VARCHAR(10)  , 
   newsResource  VARCHAR(100) , 
   isphoto VARCHAR(10) , 
   PRIMARY KEY (id)
 );
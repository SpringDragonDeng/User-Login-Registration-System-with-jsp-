DROP TABLE person ;

CREATE TABLE person 
(
	id varchar(20) not null primary key ,
	name varchar(20) not null ,
	password varchar(20) 
) ;

INSERT INTO person (id,name,password) VALUES ('lxh','LiXingHua','ffffff') ;
INSERT INTO person (id,name,password) VALUES ('mldn','mole','mldn') ;

-- 提交事务
commit ;
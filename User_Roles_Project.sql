User_Roles
====================s
delete from role where

create table user_has_role(
id int not null,
role_start_time time,
role_end_time time,
user_account_id int,
role_id int,

PRIMARY KEY (id),
FOREIGN KEY (user_account_id) references user_account(id),
FOREIGN KEY (role_id) references role(id)
);

insert into user_has_role values(2, '09:00', '05:00', 67890, 22);
insert into user_has_role values(1, '09:00', '05:00', 12345, 11);

truncate table user_has_role

select * from user_has_role
drop table user_has_role


=============================================================================================

create table role(
id int not null,
role_name varchar(100),

PRIMARY KEY (id),
);

insert into role values(11, 'software devlopment');
insert into role values(22, 'web devlopment');

truncate table role

delete from role where id in (11,22)


select * from role

===========================================================================================

create table user_account(
id int not null,
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50),
password_hash_algorithm varchar(50),

PRIMARY KEY (id),
);

insert into user_account values(12345, 'mukul', 'mukul@gmail.com', 1234567890, 11111, 22222);
insert into user_account values(67890, 'mukesh', 'mukesh@gmail.com', 1234567890, 11111, 22222);

truncate table user_account

delete from user_account where id in (12345,67890)


select * from user_account

================================================================================================

create table user_has_status(
id int not null,
status_start_time time,
status_end_time time,
user_account_id int,
status_id int,

PRIMARY KEY (id),
FOREIGN KEY (user_account_id) references user_account(id),
FOREIGN KEY (status_id) references status(id)
);

insert into user_has_status values(1, '09:00', '05:00', 12345, 33);
insert into user_has_status values(2, '09:00', '05:00', 67890, 44);

truncate table user_has_status

select * from user_has_status 
drop table user_has_status 

=======================================================================================

create table status(
id int not null,
status_name varchar(100),
is_user_working varchar(50),

PRIMARY KEY (id),
);


insert into status values(33,'working', 'true');
insert into status values(44,'not working', 'false');

truncate table status

delete from status where id in (33,44)

ALTER TABLE user_has_status DROP COLUMN FOREIGN KEY (status_id);

select * from status  

=============================================================================================
























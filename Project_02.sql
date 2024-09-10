create table location(
location_id int not null,
city varchar(20),

primary key (location_id)
)
select * from location
insert into location values(122, 'New York');
insert into location values(123, 'Dallas');
insert into location values(124, 'Chicago');
insert into location values(167, 'Boston');
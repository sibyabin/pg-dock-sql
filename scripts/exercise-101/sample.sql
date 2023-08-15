set search_path to test;
show search_path;
create table if not exists employee_example (id int, name varchar(30), salary int);
truncate table employee_example;
insert into employee_example (id, name, salary) values ('1','Employee 1', '1000');
insert into employee_example (id, name, salary) values ('2','Employee 2', '500');
insert into employee_example (id, name, salary) values ('3','Employee 3', '700');
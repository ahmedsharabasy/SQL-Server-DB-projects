use medical_lab;


create table branch ( 
code int primary key ,
street varchar (30) ,
city varchar (10) ,
building_num varchar (10) ,
flooor int ,
area varchar (30) , 
b_name int)


create table llocation (
code int ,
llocation varchar (30),
primary key(code ,llocation ),
foreign key (code) references branch(code) 
)


create table patient_branch(
code int ,
p_id int,
primary key(code,p_id)
)


create table patient(
p_id int primary key,
gender  varchar(40),
brith_date date,
cronic_disease varchar(40),
f_name varchar(40),
l_name varchar(40),
)


create table p_phone(p_id int,
phone varchar(40)
)


create table test(
code int primary key,
f_name varchar(40),
l_name varchar(40),
cost varchar(40)
)


create table patient_test(
p_id int,
code int ,
duration varchar(40),
primary key(p_id, code, duration),
foreign key (code) references test(code) 
)


create table employee(
emp_id int primary key,
f_name varchar(40),
l_name varchar(40),
salary int,
team varchar(40),
supervised_id int,
s_time varchar(40),
E_time varchar(40),
code int,
foreign key (supervised_id) references employee(emp_id) ,
foreign key (code) references branch(code)
)



alter table patient_test
add constraint patient_test1
foreign key(p_id)
references patient(p_id);


alter table patient_branch
add constraint patient_branch11
foreign key(p_id)
references patient(p_id);


alter table patient_branch
add constraint patient_branch12
foreign key(code)
references branch(code);


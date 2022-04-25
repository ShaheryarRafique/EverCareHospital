create database EverCareHospital;
use EverCareHospital;

create table Patient(
patient_id int AUTO_INCREMENT primary key,
name char(50) not null,
email varchar(50) not null,
password varchar(50) not null,
sickness varchar(50) not null,
gender enum('Male', 'Female', 'Other') not null,
DOB date,
phone varchar(25) not null,
address varchar(100) null,
registrationDate datetime
);

ALTER TABLE Patient    
MODIFY registrationDate Date; 

create table Department(
Dept_id int AUTO_INCREMENT primary key,
name char(50) not null,
address varchar(100) not null,
HOD char(50) null,
totalRooms int not null
);

create table Doctor(
doctor_id int AUTO_INCREMENT primary key,
name char(50) not null,
email varchar(50) not null,
password varchar(50) not null,
speciality varchar(50) not null,
gender enum('Male', 'Female', 'Other') not null,
DOB date,
salary decimal(15,2) not null,
address varchar(100) null,
patientExamined int,
Dept_id int,
foreign key (Dept_id) references Department(Dept_id) 
);

create table Appointment(
Appointment_id int AUTO_INCREMENT primary key,
appointmentDate dateTime not null,
fee decimal(15,2) not null,
patient_id int,
doctor_id int,
foreign key (patient_id) references Patient(patient_id),
foreign key (doctor_id) references Doctor(doctor_id)  
);

create Table Prescription(
presc_id int auto_increment primary key,
prescriptionDate dateTime not null,
description varchar(250) not null,
patient_id int,
doctor_id int,
Appointment_id int,
foreign key (patient_id) references Patient(patient_id),
foreign key (doctor_id) references Doctor(doctor_id),
foreign key (Appointment_id) references Appointment(Appointment_id)  
); 

create table Room(
room_id int AUTO_INCREMENT primary key,
name char(50),
roomType char(20),
avaliabilityStatus char(50),
doctor_id int,
Dept_id int,
foreign key (Dept_id) references Department(Dept_id), 
foreign key (doctor_id) references Doctor(doctor_id)
);

create table admin(
admin_id int AUTO_INCREMENT primary key,
name char(50),
email varchar(50),
password varchar(50)
);

insert into Doctor values
(0,'Umer Khan', 'umer@gmail.com', 'umer12345', 'Child-Specialist', 'Male', '1996-02-27', 60000, 'Juilee Town Lahore', 50, 7003),
(0,'Shaheryar Rafique', 'shaheryar.rock@gmail.com', 'sherry12345', 'Heart-Specialist', 'Male', '1985-08-30', 10000, 'Valancia Town Lahore', 200, 7000);

insert into Department values (0,'Obstetrics', 'East South Football Stadium back Street 500', 'Hiba Maheen', 50);

insert into admin values (0, 'Shaheryar Rafique', 'sherry@admin.com', 'admin123');

delete from Patient where patient_id = 32;

select Doctor.name , Department.name as 'Department'
from Doctor, Department 
where Doctor.dept_id = Department.dept_id;

alter table doctor drop column picture;

update Doctor set picture = (load_file('C:/Users/Shaheryar Rafique/Desktop/DB_Assignment/backend/public/assets/img/doctors/doctor_2.jpg')) where doctor_id = 3004;

insert into Appointment values
(0, '2021-12-05', 1000, 1, 3004),
(0, '2020-11-03', 200, 4,  3004),
(0, '2021-10-04', 500, 11, 3005),
(0, '2021-01-29', 800, 1, 3006),
(0, '2020-02-13', 600, 11, 3008),
(0, '2019-08-30', 1200, 4, 3010)
;

alter table Appointment modify appointmentDate Date;
delete from doctor where doctor_id = '3004';
call deletePatient(33);
select * from Appointment;
update Doctor set dept_id = 7005 where doctor_id = 3010;
call deleteDoctor(3004);
call SearchDepartment('Outpatient');
call updateDepartment('Obstetrics', 'East South Football Stadium back Street 500', 'Hiba Maheen', 50, 7019);
call deleteDepartment(7003);
call doctors();
select * from admin;
call GetAllPatient();
call GetAllDoctor();
call GETALLAppointment();
call GetAllDepartment();
call GetAllPrescription();
call deleteAppointment(1001);
call getRoom();

insert into Room values
(0, 'Iqbal', 'ICU', 'yes', 3005, 7001),
(0, 'Akram', 'CCU', 'yes', 3006, 7002),
(0, 'Khan', 'Ward', 'yes', 3010, 7005);
--major_code varchar (10) fa we need to change that
--faculty_code varchar (10)
--defense_date is type datetime 
--bachelor_project.code varchar(10)
--pdf_doc f thesis varchar(1000)

create view ProjectDetailsAcademic 
as
select distinct bp.*, a.EE_id,a.lecturer_id,a.TA_id from Bachelor_Project bp inner join Academic a
on bp.code = a.code

go;


create view ProjectDetailsIndustrial 
as
select bp.*, i.Company_id, i.Employee_id, i.CreatorCompany, i.lecturer_id from Bachelor_Project bp inner join Industrial i
on bp.code = i.code 

go

--ay 7aga mktooba calculated(7agat keda) mdeya error for some reason
DROP TABLE CompanyRep_Grades_PR
DROP TABLE Lecturer_Grades_PR
DROP TABLE Progress_report
DROP TABLE BachelorSubmittedMaterials
DROP TABLE CompanyRep_Grades_Defense
DROP TABLE Employee_Grades_Defense
DROP TABLE External_Examiner_Grades_Thesis
DROP TABLE Makes_preference 
DROP TABLE MeetingToDoList 
DROP TABLE Meeting_Attendance
DROP TABLE Meeting 
DROP TABLE External_supervisor 
DROP TABLE CompanyRep_Grades_Thesis
DROP TABLE Employee_Grades_Thesis
DROP TABLE Lecturer_Grades_Thesis
DROP TABLE Thesis
DROP TABLE Recommends
DROP TABLE Hardware
DROP TABLE Industrial
DROP TABLE Academic
DROP TABLE StudentPhone
DROP TABLE External_Examiner_Grades_Defense
DROP TABLE External_Examiner
DROP TABLE Lecturer_Grades_Defense
DROP TABLE Lecturer_Fields
DRop TABLE Defense
DROP TABLE Student
DROP Table Teaching_Assistant
DROP TABLE Coordinator
DROP TABLE Employee
DROP TABLE Company
DROP TABLE UserEmail
DROP TABLE UserPhone
DROP TABLE Bachelor_Project
DROP TABLE Major
DROP TABLE Faculty
DROP TABLE Lecturer
DROP TABLE UserInfo






DROP PROC UserRegister
DROP PROC UserLogin
DROP PROC ViewProfile
DROP PROC ViewBachelorProjects
DROP PROC MakePreferencesLocalProject
DROP PROC ViewMyThesis
DROP PROC SubmitMyThesis
DROP PROC ViewMyProgressReports
DROP PROC ViewMyDefense
DROP PROC UpdateMyDefense
DROP PROC ViewMyBachelorProjectGrade
DROP PROC ViewNotBookedMeetings
DROP PROC BookMeeting
DROP PROC ViewMeeting
DROP PROC StudentAddToDo
DROP PROC AddEmployee
DROP PROC CompanyCreateLocalProject
DROP PROC AssignEmployee
DROP PROC CompanyGradeThesis
DROP PROC CompanyGradedefense
DROP PROC CompanyGradePR
DROP PROC LecturerCreateLocalProject
DROP PROC SpecifyThesisDeadline
DROP PROC CreateMeeting
DROP PROC LecturerAddToDo
DROP PROC ViewMeetingLecturer
DROP PROC ViewEE
DROP PROC RecommendEE
DROP PROC SuperviseIndustrial
DROP PROC LecGradeThesis
DROP PROC LecGradedefense
DROP PROC LecCreatePR
DROP PROc LecGradePR
DROP PROC TACreatePR
DROP PROC TAAddToDo
DROP PROC EEGradeThesis
DROP PROC EEGradedefense
DROP PROC ViewUsers
DROP PROC AssignAllStudentsToLocalProject
DROP PROC AssignTAs
DROP PROC ViewRecommendation
DROP PROC AssignEE
DROP PROC ScheduleDefense
DROP PROC EmployeeGradeThesis
DROP PROC EmployeeGradedefense
DROP PROC EmployeeCreatePR


create table UserInfo(
id int primary key identity,
username varchar(20) unique,
userpassword varchar (10),
userrole varchar (20)
);
 
create table UserPhone
(
userid int references UserInfo on delete cascade on update cascade,
phone_number varchar (20),
primary key (userid, phone_number)
);

create table UserEmail
(
userid int references UserInfo on delete cascade on update cascade,
email varchar (50),
primary key (userid, email)
);

CREATE TABLE Company(
c_name VARCHAR(20),
rep_email VARCHAR(50),
c_location VARCHAR(100), 
rep_name VARCHAR(20),
id INT 
PRIMARY KEY(id),
FOREIGN KEY (id) REFERENCES UserInfo on delete cascade on update cascade
);

create table Employee
(
staff_id int, 
company_id int references Company on delete cascade,  
field_of_work varchar (25),
FOREIGN KEY (staff_id) REFERENCES UserInfo on delete no action on update cascade,
primary key (staff_id, company_id)
);

create table Coordinator
(
id int primary key references UserInfo on delete cascade on update cascade
);

CREATE TABLE Lecturer(
	staff_id INT PRIMARY KEY,
	schedule VARCHAR(100),
	FOREIGN KEY(staff_id) REFERENCES UserInfo on delete cascade on update cascade
);


create table Faculty
(
fac_code varchar(10) primary key,
fac_name varchar (20),
dean int references Lecturer on delete cascade on update cascade
);

create table Student (
S_ID int,
first_name varchar(20),
last_name varchar(20),
birth_date datetime,
TA_assigned int, 
semester int,
student_address varchar(100),
GPA decimal (3,2),
major_code varchar(10),
submitted bit, 
supervising_doc int,
Project_ID varchar(10), 
age as Cast(datediff(DD,birth_date,GETDATE())/365.25 AS INT),
total_bachelor_grade decimal (4,2), -- as calculated(0.3*Thesis.total_grade+0.3*Defense.total_grade+0.4*Progress_Report.cumulative_progress_grade),
PRIMARY KEY(S_ID),

FOREIGN KEY(S_ID) REFERENCES UserInfo
);

create table Defense(
content varchar(1000), 
defense_location varchar(5),
def_time time,
def_date datetime, 
S_ID int,
PRIMARY KEY(S_ID,defense_location),
FOREIGN KEY(S_ID) REFERENCES Student on delete cascade on update cascade,
total_grade decimal(4,2) --as Calculated((External_Examiner_Grades_Defense.defense_grade + 
--Lecturer_Grades_Defense.defense_grade)/2 or
--(CompanyRep_Grades_Defense.defense_grade + Employee_Grades_Defense.defense_grade)/2)
);


create table Lecturer_Fields
(
lec_id int references Lecturer on delete cascade on update cascade,
field_of_interest varchar(100)
primary key(lec_id, field_of_interest)
);

create table Lecturer_Grades_Defense 
(
doc_id int,
defense_grade decimal (4,2),
d_location varchar(5),
s_id int,
primary key (s_id, d_location),
foreign key (doc_id) references Lecturer on delete no action on update no action,
foreign key (s_id, d_location) references Defense on delete no action on update no action
);


CREATE TABLE External_Examiner(
	id INT,
	schedule VARCHAR(100),
	coordinator_id INT, 
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES UserInfo on delete cascade on update cascade,
	FOREIGN KEY(coordinator_id) REFERENCES Coordinator on delete no action on update no action
);


create table External_Examiner_Grades_Defense 
(
EE_id int references External_Examiner on delete cascade on update no action, 
defense_location varchar(5),
s_id int,
defense_grade decimal (4,2),
primary key(s_id, defense_location),
foreign key(s_id, defense_location) references Defense on delete no action on update no action
);

CREATE TABLE Major (
    Major_Code varchar(10), 
    Major_Name VARCHAR(30),
    Faculty_Code varchar(10) references Faculty on delete cascade on update cascade, --changed this
    PRIMARY KEY(Major_Code), 
);

CREATE TABLE Bachelor_Project(
	code varchar(10), 
	project_name VARCHAR(50),
	project_description VARCHAR(50),
	resources VARCHAR(50), 
	major_code varchar (10), 
	PRIMARY KEY(code),
	FOREIGN KEY(major_code) REFERENCES Major on delete cascade on update cascade,
	

);

create table StudentPhone
(
s_id int references Student on delete cascade on update cascade,
phone varchar (20),
primary key (s_id, phone)
);

CREATE TABLE Teaching_Assistant(
	id INT,
	schedule VARCHAR(100),
	coordinator_id INT, 
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES UserInfo on delete cascade on update cascade,
	FOREIGN KEY(coordinator_id) references Coordinator on delete no action on update no action
);

create table Academic(
	code varchar(10) references Bachelor_Project on delete cascade on update cascade, --added this reference
	lecturer_id int,
	EE_id int,
	TA_id int,
	primary key(code),
	foreign key(lecturer_id) references Lecturer on delete no action on update no action,
	foreign key(EE_id) references External_Examiner on delete no action on update no action,
	foreign key(TA_id) references Teaching_Assistant on delete no action on update no action
);

create table Industrial(
	code varchar(10) references Bachelor_Project, 
	lecturer_id int,
	Employee_id int,
	Company_id int,
	CreatorCompany int references Company on delete set null, 
	primary key(code),
	foreign key(lecturer_id) references Lecturer on update no action,
	foreign key(Employee_id, Company_id) references Employee on update cascade
);

	 
create table Hardware(
code int,
hardware_name varchar(50),
hardware_type varchar(50),
available int,
needed varchar(50),
used varchar(50),
PRIMARY KEY(code),
);

create table Recommends( 
doc_id int,
AProject_id varchar(10) REFERENCES Academic on delete cascade on update no action, 
examiner_id int REFERENCES External_Examiner on delete no action on update no action, 
PRIMARY KEY(AProject_id, examiner_id), 
FOREIGN KEY(doc_id) REFERENCES Lecturer on delete no action on update no action
);

CREATE TABLE Thesis(
title VARCHAR(50) default 'Thesis Title',
s_id INT,
deadline DATETIME,
pdf_doc VARCHAR(1000),
total_grade decimal (4,2),--AS (External_Examiner_Grades_Thesis.thesis_grade + Lecturer_Grades_Thesis.thesis_grade + CompanyRep_Grades_Thesis.thesis_grade + Employee_Grades_Thesis.thesis_grade),
PRIMARY KEY(title, s_id),
FOREIGN KEY(s_id) REFERENCES Student on delete cascade on update cascade
);

create table Lecturer_Grades_Thesis
(
doc_id int references Lecturer on delete no action on update no action,
thesis_grade decimal (4,2),
title varchar(50),
s_id int,
primary key (s_id,title),
foreign key (title, s_id) references Thesis on delete cascade on update no action
);

create table Employee_Grades_Thesis( --changed name
emp_id int, 
company_id int,
S_ID int,
title varchar(50),
thesis_grade decimal (4,2), --changed name and datatype
PRIMARY KEY(S_ID, title),
FOREIGN KEY(emp_id, company_id) REFERENCES  Employee on delete no action on update no action,
FOREIGN KEY(title, S_ID) REFERENCES Thesis on delete cascade on update no action
);

create table CompanyRep_Grades_Thesis( --changed name
C_ID INT, --removed employee id
S_ID INT,
title varchar(50),
thesis_grade decimal(4,2), --changed datatype
PRIMARY KEY(S_ID, title),
FOREIGN KEY(C_ID) REFERENCES  Company on delete no action on update no action,
FOREIGN KEY(title, S_ID) REFERENCES Thesis on delete no action on update no action,
);

CREATE TABLE External_supervisor (
    ID INT references UserInfo on delete cascade on update cascade,
    Field_of_Interest VARCHAR(20),
    country_of_Residence VARCHAR(20),
    Primary KEY(ID),
);



CREATE TABLE Meeting (
    Meeting_ID INT IDENTITY,
    Meeting_Point VARCHAR(30),
    Meeting_date DATE,
    Start_Time TIME,
    End_Time TIME,
    --shelna student id attribute
	duration as datediff(minute, Start_Time, End_Time),
    Lecturer_ID INT references Lecturer on delete cascade on update cascade,
    PRIMARY KEY(Meeting_ID)
);

create table Meeting_Attendance(
	meeting_id int,
	attendant_id int,
	primary key (meeting_id, attendant_id),
	foreign key (meeting_id) references Meeting on delete no action on update no action,
	foreign key (attendant_id) references UserInfo on delete cascade on update no action

);

create table MeetingToDoList 
(
meeting_id int references Meeting on delete cascade on update cascade,
todolist varchar(200), --I changed this to 200
primary key (meeting_id, todolist)
);



CREATE TABLE Makes_preference (
    Preference_num INT,
    Bachelor_id varchar(10) references Bachelor_Project on delete no action on update no action,
    Student_ID int references Student on delete cascade on update no action,
	assigned int default 0,
    PRIMARY KEY(Bachelor_id,Student_ID)
);

/*
--not needed 
CREATE TABLE Extenal_Supervisor_Grades (
    Student_ID INT references Student,
    ES_Grade INT,--IDK eltype
    PRIMARY KEY(Student_ID),
);
*/

CREATE TABLE External_Examiner_Grades_Thesis (
    ee_id int references External_Examiner on delete no action on update no action,
    title VARCHAR(50),
    Student_ID int,
    thesis_grade decimal (4,2),--changed datatype
    PRIMARY KEY(title,Student_ID),
	foreign key (title, Student_ID) references Thesis on delete no action on update cascade
);

CREATE TABLE Employee_Grades_Defense(
    staff_id INT,
    cid INT,
    Student_ID INT,
    D_location varchar(5), --changed this
    defense_grade decimal (4,2), --changed datatype
    PRIMARY KEY(Student_ID,D_location),
    FOREIGN KEY(staff_id,cid) REFERENCES Employee on delete cascade on update no action,
    FOREIGN KEY(Student_ID,D_location) REFERENCES Defense on delete no action on update no action
);

CREATE TABLE CompanyRep_Grades_Defense(
    cid INT references Company,
    Student_ID INT,
    D_location varchar(5),
    defense_grade decimal(4,2), --changed datatype
    PRIMARY KEY(Student_ID,D_location),
    FOREIGN KEY(Student_ID,D_location) REFERENCES Defense on delete cascade on update cascade
);

create table BachelorSubmittedMaterials
(
project_code varchar(10) references Bachelor_Project on delete cascade on update cascade, --changed datatype
submitted_material VARCHAR(50),
primary key(project_code, submitted_material)
);


CREATE TABLE Progress_report( --changed stuff
	s_id INT,
	content VARCHAR(1000), --changed this
	report_date DATETIME, --changed to datetime
	pr_grade decimal(4,2), --as calculated(Lecturer_Grades_PR.pr_grade or CompanyRep_Grades_PR.pr_grade), 
	--cumulative_progress_report_grade as calculated(Average (pr_grade)),
	TA_ID INT,
	Updating_UserId int references UserInfo on delete cascade on update no action, --dee zawednaha
	PRIMARY KEY(s_id, report_date),
	FOREIGN KEY(s_id) REFERENCES Student on delete no action on update no action,
	FOREIGN KEY(TA_ID) REFERENCES Teaching_Assistant on delete no action on update no action
	
);

CREATE TABLE Lecturer_Grades_PR(
	pr_grade decimal(4,2), --changed datatype
	s_id INT,
	pr_date datetime,
	doc_id int references Lecturer on delete no action on update no action,
	PRIMARY KEY(s_id, pr_date),
	FOREIGN KEY(s_id, pr_date) REFERENCES Progress_Report on delete cascade on update cascade,
);

CREATE TABLE CompanyRep_Grades_PR(
	cid INT,
	pr_date datetime,
	s_id INT,
	pr_grade decimal(4,2), --change
	FOREIGN KEY(cid) REFERENCES Company on delete no action on update no action,
	FOREIGN KEY(s_id, pr_date) REFERENCES Progress_Report on delete cascade on update cascade,
	PRIMARY KEY(s_id, pr_date)
);

ALTER Table Student Add 
FOREIGN KEY(Project_ID) REFERENCES Bachelor_Project on delete no action,
FOREIGN KEY(TA_assigned) REFERENCES Teaching_assistant on delete no action on update cascade,
--FOREIGN KEY(thesis_grade) REFERENCES Thesis,
--FOREIGN KEY(defence_grade) REFERENCES Defence,
FOREIGN KEY(major_code) REFERENCES Major on delete no action on update no action,
--FOREIGN KEY(grade) REFERENCES Progress_report,
FOREIGN KEY(supervising_doc) REFERENCES Lecturer on delete no action on update no action



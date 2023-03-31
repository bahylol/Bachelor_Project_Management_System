
CREATE PROCEDURE TAAddToDo @meeting_id int, @to_do_list varchar(200)
AS
INSERT INTO MeetingToDoList
VALUES (@meeting_id, @to_do_list)
GO

CREATE PROCEDURE ViewUsers @User_type varchar(20), @User_id int --update it fl doc
AS
if(@User_id is null)
begin
select  i.*, p.phone_number, e.email from UserInfo i inner join UserPhone p on i.id = p.userid inner join UserEmail e on i.id = e.userid where userrole = @User_type
end

else
begin

if(exists(select id, userrole from UserInfo where id = @User_id and userrole = @User_type) )
begin
SELECT i.*, p.phone_number, e.email FROM UserInfo i inner join UserPhone p on i.id = p.userid inner join UserEmail e on i.id = e.userid 
WHERE userrole = @User_type AND id = @User_id

end
else
print 'Invalid User ID'

end
GO



CREATE PROC AssignTAs @coordinator_id int, @TA_id int, @proj_code varchar(10) 
AS
update Academic
set TA_id = @TA_id
where code = @proj_code
update Teaching_Assistant
set coordinator_id = @coordinator_id
where id = @TA_id
update Student
set Student.TA_assigned=@TA_id
WHERE Student.Project_ID= @proj_code

GO
CREATE PROCEDURE ViewRecommendation @lecture_id int
AS
if(@lecture_id is null)
begin
SELECT * FROM Recommends 
end
else
begin
SELECT * FROM Recommends where doc_id = @lecture_id
end
GO


CREATE PROCEDURE AssignEE @coordinator_id int, @EE_id int, @proj_code varchar(10)
AS
update Academic
set EE_id = @EE_id
where code = @proj_code

update External_Examiner
set coordinator_id = @coordinator_id
where id = @EE_id
GO


CREATE PROCEDURE  ScheduleDefense @sid int, @date datetime, @time time, @location varchar(5)
AS
INSERT INTO Defense (S_ID, def_date, def_time, defense_location)
VALUES (@sid, @date, @time, @location)
GO


create proc UserRegister 
@user_id int output, @password varchar(10) output,
@usertype varchar(20), @userName varchar(20), @email varchar(50), 
@first_name varchar(20), @last_name varchar(20), @birth_date datetime, 
@GPA decimal(3,2), @semester int, @address varchar(100), 
@faculty_code varchar(10), @major_code varchar(10), @company_name varchar(20),
@representative_name varchar(20), @representative_email varchar(50), @phone_number varchar(20),
@country_of_residence varchar(20)


as
if exists(Select UserInfo.username
From UserInfo
WHERE  UserInfo.username=@userName)
PRINT 'Username already exists'
else if exists(Select*
From UserInfo INNER JOIN UserEmail ON  UserInfo.id=UserEmail.userid
WHERE  UserEmail.email=@email)
PRINT 'email already exists'
else
BEGIN

set @password = concat(left(@userName, 1),right(@userName, 1),'123123')

insert into UserInfo (username, userpassword, userrole) values (@username,@password,@usertype)

select @user_id = u.id from UserInfo u
where u.username = @username

insert into UserPhone values (@user_id, @phone_number)
insert into UserEmail values (@user_id, @email)


if(@usertype like 'Student')
begin
if(not exists(select fac_code from Faculty where fac_code = @faculty_code))
begin
insert into Faculty (fac_code) values (@faculty_code)
end
if(not exists(select Major_Code from Major where Major_Code = @major_code))
begin
insert into Major (Major_Code, Faculty_Code) values (@major_code, @faculty_code)
end

insert into Student (S_ID, first_name, last_name, birth_date, semester, student_address,
GPA, major_code) 
values (@user_id, @first_name, @last_name, @birth_date, @semester, @address,
@GPA, @major_code)
end

else if (@usertype like 'Company')
begin
insert into Company values (@company_name, @representative_email, @address, 
@representative_name, @user_id)
end

else if (@usertype like 'Lecturer')
begin

if(@faculty_code is not null)
begin
if(exists(select fac_code from Faculty where fac_code = @faculty_code))
begin
insert into Lecturer (staff_id) values (@user_id)
insert into Lecturer_Fields(lec_id) values (@user_id)
update Faculty
set dean = @user_id
where fac_code = @faculty_code
end

else
begin 
insert into Lecturer (staff_id) values (@user_id)
insert into Lecturer_Fields(lec_id) values (@user_id)
insert into Faculty(fac_code, dean) values (@faculty_code, @user_id)
end
end

else
begin
insert into Lecturer (staff_id) values (@user_id)
insert into Lecturer_Fields(lec_id) values (@user_id)
end
end

else if(@usertype like 'Coordinator')
begin
insert into Coordinator values (@user_id)
end

else if (@usertype like 'Teaching_Assistant')
begin
insert into Teaching_Assistant (id) values (@user_id)
end

else if (@usertype like 'External_Examiner')
begin
insert into External_Examiner (id) values (@user_id)
end

else if(@usertype like 'External_Supervisor')
begin
insert into External_supervisor (ID, country_of_Residence) 
values (@user_id, @country_of_residence)
end

END


go

create proc  MakePreferencesLocalProject
@sid int, @bachelor_code varchar(10), @preference_number int

as
insert into Makes_preference (Preference_num, Bachelor_id, Student_id) 
values (@preference_number, @bachelor_code, @sid)

go

create proc  SubmitMyThesis
@sid int, @title varchar(50), @PDF_Document varchar(1000)
as
update Thesis
set pdf_doc = @PDF_Document
where title = @title and s_id = @sid
go

create proc UpdateMyDefense  --I'm guessing en it already exists?
@sid int, @defense_content varchar(1000)
as
update Defense
set content = @defense_content
where S_ID = @sid

go

create proc BookMeeting
@sid int, @meeting_id int
as
/*
if a meeting of that meeting id was created and the lecturer who set that meeting is the same as the supervising doctor of that student
procede
else
return error message
*/
if(exists(select M.Meeting_ID, M.Lecturer_ID, S.S_ID from Meeting M, Student S
where @meeting_id = M.Meeting_ID and (M.Lecturer_ID = S.supervising_doc and S.S_ID = @sid))) 
BEGIN
insert into Meeting_Attendance values (@meeting_id, @sid)
insert into Meeting_Attendance values (@meeting_id, (select Student.TA_assigned
FROM Student
where Student.S_ID=@sid))
END
else
print 'This Meeting was not created by your supervising doctor.'

go

create proc StudentAddToDo
@meeting_id int, @to_do_list varchar(200)
as
insert into MeetingToDoList values (@meeting_id, @to_do_list)

go


create procedure ViewMyThesis
@sid int, @title varchar(50)
as
if exists(Select *
from Student INNER JOIN Academic ON Student.Project_ID=Academic.code
where Student.S_ID=@sid)
BEGIN

if (exists(select *
FROM External_Examiner_Grades_Thesis
where External_Examiner_Grades_Thesis.Student_ID=@sid AND External_Examiner_Grades_Thesis.title=@title) AND 
exists (select *
FROM Lecturer_Grades_Thesis
where Lecturer_Grades_Thesis.s_id=@sid AND Lecturer_Grades_Thesis.title=@title))
BEGIN

Update Thesis
SET Thesis.total_grade=((select External_Examiner_Grades_Thesis.thesis_grade
FROM External_Examiner_Grades_Thesis
where External_Examiner_Grades_Thesis.Student_ID=@sid AND External_Examiner_Grades_Thesis.title=@title)+(select Lecturer_Grades_Thesis.thesis_grade
FROM Lecturer_Grades_Thesis
where Lecturer_Grades_Thesis.s_id=@sid AND Lecturer_Grades_Thesis.title=@title))/2
Where Thesis.s_id=@sid AND Thesis.title=@title

END
END
else if exists(Select *
from Student INNER JOIN Industrial ON Student.Project_ID=Industrial.code
where Student.S_ID=@sid)
BEGIN

if (exists(select *
FROM CompanyRep_Grades_Thesis
where CompanyRep_Grades_Thesis.S_ID=@sid AND CompanyRep_Grades_Thesis.title=@title) AND 
exists (select *
FROM Employee_Grades_Thesis
where Employee_Grades_Thesis.S_ID=@sid AND Employee_Grades_Thesis.title=@title))
BEGIN

Update Thesis
SET Thesis.total_grade=((select CompanyRep_Grades_Thesis.thesis_grade
FROM CompanyRep_Grades_Thesis
where  CompanyRep_Grades_Thesis.S_ID=@sid AND CompanyRep_Grades_Thesis.title=@title)+(select Employee_Grades_Thesis.thesis_grade
FROM Employee_Grades_Thesis
where Employee_Grades_Thesis.S_ID=@sid AND Employee_Grades_Thesis.title=@title))/2
Where Thesis.s_id=@sid AND Thesis.title=@title

END
END

SELECT *
From Thesis
Where Thesis.s_id=@sid AND Thesis.title=@title

go

create procedure ViewNotBookedMeetings
@sid int
as
declare @lec_id int
select @lec_id = Student.supervising_doc from Student where @sid = Student.S_ID

select * from Meeting where Lecturer_ID = @lec_id
except 
select M.* from Meeting_Attendance A right outer join Meeting M on A.meeting_id = M.Meeting_ID where A.attendant_id = @sid 
order by Meeting_date

--select * from Meeting_Attendance A right outer join Meeting M on A.meeting_id = M.Meeting_ID where  A.attendant_id = @sid
--order by M.Meeting_date --need to test this line 3shan not sure it will yield the results we want

go


create proc ViewMeeting
@meeting_id int, @sid int
as
if (@meeting_id is not null)
select M.*, MA.attendant_id from Meeting M inner join Meeting_Attendance MA on M.Meeting_ID = MA.meeting_id
where MA.attendant_id = @sid and M.Meeting_ID = @meeting_id

else
select M.*, MA.attendant_id from Meeting M inner join Meeting_Attendance MA on M.Meeting_ID = MA.meeting_id
where MA.attendant_id = @sid

go


create proc ViewMyProgressReports
@sid int, @date datetime
as
if(@date is not null)
begin
select * from Progress_report  PR 
where PR.s_id = @sid and PR.report_date = @date 
end

else
begin 
select * from Progress_report  PR 
where PR.s_id = @sid
order by PR.report_date desc
end
GO
--dee el ana 3yzaha
create procedure ViewMyDefense
@sid int

as
if exists(Select *
from Student INNER JOIN Academic ON Student.Project_ID=Academic.code
where Student.S_ID=@sid)
BEGIN

if (exists(select *
FROM External_Examiner_Grades_Defense
where External_Examiner_Grades_Defense.s_id=@sid) AND 
exists (select *
FROM Lecturer_Grades_Defense
where Lecturer_Grades_Defense.s_id=@sid))
BEGIN

Update Defense
SET Defense.total_grade=((select External_Examiner_Grades_Defense.defense_grade
FROM External_Examiner_Grades_Defense
where External_Examiner_Grades_Defense.s_id=@sid )+(select Lecturer_Grades_Defense.defense_grade
FROM Lecturer_Grades_Defense
where Lecturer_Grades_Defense.s_id=@sid))/2
Where Defense.s_id=@sid 

END
END
else if exists(Select *
from Student INNER JOIN Industrial ON Student.Project_ID=Industrial.code
where Student.S_ID=@sid)
BEGIN

if (exists(select *
FROM CompanyRep_Grades_Defense
where CompanyRep_Grades_Defense.Student_ID=@sid ) AND 
exists (select *
FROM Employee_Grades_Defense
where Employee_Grades_Defense.Student_ID=@sid))
BEGIN

Update Defense
SET Defense.total_grade=((select CompanyRep_Grades_Defense.defense_grade
FROM CompanyRep_Grades_Defense
where  CompanyRep_Grades_Defense.Student_ID=@sid)+(select Employee_Grades_Defense.defense_grade
FROM Employee_Grades_Defense
where Employee_Grades_Defense.Student_ID=@sid))/2
Where Defense.s_id=@sid 

END
END

SELECT *
From Defense
Where Defense.s_id=@sid 

go

create proc ViewMyBachelorProjectGrade
@sid int,@BachelorGrade decimal(4,2) output
as
if exists(Select *
FROM Thesis INNER JOIN Defense on Thesis.s_id=Defense.S_ID INNER JOIN Progress_report ON Thesis.s_id=Progress_report.s_id
WHERE Thesis.s_id=@sid AND Defense.S_ID=@sid AND Progress_report.s_id=@sid)
BEGIN
UPDATE Student
SET total_bachelor_grade=
0.3*(Select Thesis.total_grade
FROM Thesis INNER JOIN Defense on Thesis.s_id=Defense.S_ID INNER JOIN Progress_report ON Thesis.s_id=Progress_report.s_id
WHERE Thesis.s_id=@sid AND Defense.S_ID=@sid AND Progress_report.s_id=@sid)
+0.3*(Select Defense.total_grade
FROM Thesis INNER JOIN Defense on Thesis.s_id=Defense.S_ID INNER JOIN Progress_report ON Thesis.s_id=Progress_report.s_id
WHERE Thesis.s_id=@sid AND Defense.S_ID=@sid AND Progress_report.s_id=@sid)
+0.4*(Select avg(Progress_Report.pr_grade)
FROM Thesis INNER JOIN Defense on Thesis.s_id=Defense.S_ID INNER JOIN Progress_report ON Thesis.s_id=Progress_report.s_id
WHERE Thesis.s_id=@sid AND Defense.S_ID=@sid AND Progress_report.s_id=@sid)
WHERE S_ID=@sid

set @BachelorGrade=(SELECT Student.total_bachelor_grade
FROM Student
WHERE S_ID=@sid)

SELECT Student.total_bachelor_grade
FROM Student
WHERE S_ID=@sid
END


go

create proc LecGradePR
@Lecturer_id int, @sid int, @date datetime, @lecturer_grade decimal(4,2)
as

declare @proj_code varchar(10)
select @proj_code = Project_id from Student where S_ID = @sid
if(exists(select code from Academic where code = @proj_code))
begin
insert into Lecturer_Grades_PR values (@lecturer_grade, @sid, @date, @Lecturer_id)
end

else
begin
print 'Cannot grade this student'
end

go

create proc LecCreatePR
@Lecturer_id int, @sid int, @date datetime, @content varchar(1000)
as
if exists(select *
from Student INNER JOIN Bachelor_Project ON Student.Project_ID=Bachelor_Project.code INNER JOIN
Academic ON Bachelor_Project.code=Academic.code INNER JOIN Lecturer ON Academic.lecturer_id=Lecturer.staff_id
WHERE Lecturer.staff_id=@Lecturer_id AND Student.S_ID=@sid)
BEGIN
insert into Progress_report(s_id, content, report_date, Updating_UserId)
values (@sid, @content, @date, @Lecturer_id)
END
else
begin
print 'Invalid Student id'
end

go
create proc LecGradedefense
@Lecturer_id int, @sid int, @defense_location varchar(5), @Lecturer_grade Decimal(4,2)
as
if exists(SELECT *
FROM Academic INNER JOIN Student ON Academic.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Academic.lecturer_id=@Lecturer_id)
BEGIN
insert into Lecturer_Grades_Defense values 
(@Lecturer_id, @Lecturer_grade, @defense_location, @sid)
END

go

create proc LecGradeThesis
@Lecturer_id int, @sid int, @thesis_title varchar(50), @Lecturer_grade Decimal(4,2)
As

if exists(SELECT *
FROM Academic INNER JOIN Student ON Academic.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Academic.lecturer_id=@Lecturer_id)
BEGIN
insert into Lecturer_Grades_Thesis values
(@Lecturer_id, @Lecturer_grade, @thesis_title, @sid)
update Thesis
set title = @thesis_title
where s_id = @sid
end



go

create proc SuperviseIndustrial
@Lecturer_id int, @proj_code varchar(10)
as

update Industrial
set lecturer_id = @Lecturer_id
where code = @proj_code

go


create proc RecommendEE
@Lecturer_id int, @proj_code varchar(10), @EE_id int
as

insert into Recommends values (@Lecturer_id, @proj_code, @EE_id)

go


CREATE PROCEDURE AddEmployee 
@CompanyID int, @email varchar(50),
@name varchar(20), @phone_number varchar(20),@field varchar(25),
@staff_id int output,@employee_pass varchar(10) output, @cid int output
AS  
set  @cid = @CompanyID
if exists(Select UserInfo.username
From UserInfo
WHERE  UserInfo.username=@name)
PRINT 'Username already exists'
else if exists(Select*
From UserInfo INNER JOIN UserEmail ON  UserInfo.id=UserEmail.userid
WHERE  UserEmail.email=@email)
PRINT 'email already exists'
else
BEGIN
set @employee_pass = concat(left(@name, 1),'123123')
INSERT INTO UserInfo
VALUES(@name,@employee_pass,'Employee')
INSERT INTO UserPhone
VALUES((SELECT UserInfo.id from UserInfo where username = @name),@phone_number)
INSERT INTO UserEmail
VALUES((SELECT UserInfo.id from UserInfo where username = @name),@email)
insert into Employee(staff_id,company_id,field_of_work)
values ((SELECT UserInfo.id from UserInfo where username = @name),@CompanyID,@field)
end
Go


create procedure CompanyCreateLocalProject @company_id int, @proj_code varchar(10),
@title varchar(50),@description varchar(200),@major_code varchar(10)
AS
insert into Bachelor_Project
values(@proj_code,@title,@description,null,@major_code)
insert into industrial(code,CreatorCompany)
values(@proj_code,@company_id)
GO

create procedure AssignEmployee @bachelor_code varchar(10),
@Company_id int,@staff_id int
AS 
update Industrial 
set Employee_id = @staff_id,Company_id = @Company_id
where code = @bachelor_code
print @staff_id
select *
from ProjectDetailsIndustrial p
where p.Employee_id = @staff_id and p.Company_id=@Company_id

GO


create procedure CompanyGradeThesis @Company_id int, @sid int,
@thesis_title varchar(50), @Company_grade Decimal(4,2)
AS

if exists(SELECT *
FROM Industrial INNER JOIN Student ON Industrial.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Industrial.Company_id=@Company_id)
BEGIN
insert into CompanyRep_Grades_Thesis
values(@company_id,@sid,@thesis_title,@company_grade)
End
update Thesis
set title = @thesis_title
where s_id = @sid
GO

create procedure CompanyGradedefense 
@Company_id int, @sid int,
@defense_location varchar(5), @Company_grade Decimal(4,2)
AS 
if exists(SELECT *
FROM Industrial INNER JOIN Student ON Industrial.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Industrial.Company_id=@Company_id)
BEGIN
insert into CompanyRep_Grades_Defense
values(@company_id,@sid,@defense_location,@company_grade)
end

GO


create procedure CompanyGradePR
@Company_id int, @sid int,
@date datetime, @Company_grade decimal(4,2)
AS 
if exists(SELECT *
FROM Industrial INNER JOIN Student ON Industrial.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Industrial.Company_id=@Company_id)
BEGIN
insert into CompanyRep_Grades_PR
values(@company_id,@date,@sid,@Company_grade)
END



Go

create procedure LecturerCreateLocalProject @Lecturer_id int, @proj_code varchar(10),
@title varchar(50), @description varchar(200),@major_code varchar(10)
AS 
insert into Bachelor_Project (code, project_name, project_description, major_code) 
values(@proj_code, @title, @description, @major_code)
insert into Academic(code, lecturer_id)
values(@proj_code,@Lecturer_id)
Go

Create procedure SpecifyThesisDeadline
@deadline datetime 
AS

DECLARE @ROW INT = 0;
declare @size int

select @size = count(*) from UserInfo

WHILE @ROW < @size
begin

if exists (SELECT *
FROM Student
WHERE Student.S_ID = @ROW AND Student.Project_ID IS NOT NULL)
BEGIN
insert into Thesis (s_id, deadline) values ((select S_ID from Student WHERE Student.S_ID = @ROW), @deadline)
END
SET @ROW = @ROW +1
END
GO


create procedure CreateMeeting @Lecturer_id int, @start_time time, @end_time time,
@date datetime, @meeting_point varchar(5)
AS 
insert into Meeting(Meeting_Point, Meeting_date,Start_Time,End_Time,Lecturer_ID)
values(@meeting_point, @date, @start_time, @end_time,@Lecturer_id)
GO

create procedure LecturerAddToDo @meeting_id int, @to_do_list varchar(200)
AS
insert into MeetingToDoList
values(@meeting_id,@to_do_list)
GO

create procedure ViewMeetingLecturer @Lecturer_id int, @meeting_id int
AS
IF @Lecturer_id is NOT null AND @meeting_id is not null
Begin
select *
from Meeting 
where Meeting_ID = @meeting_id and Lecturer_ID = @Lecturer_id
end
IF @meeting_id is null
Begin
select *
from Meeting 
where Lecturer_ID = @Lecturer_id
ORDER BY Meeting_date
end
GO


CREATE procedure ViewEE
AS
select UserInfo.username,External_Examiner.id,External_Examiner.schedule,External_Examiner.coordinator_id
from External_Examiner INNER JOIN UserInfo ON External_Examiner.id=UserInfo.id
except
select UserInfo.username,External_Examiner.id,External_Examiner.schedule,External_Examiner.coordinator_id
from Recommends INNER JOIN External_Examiner ON Recommends.examiner_id = External_Examiner.id
INNER JOIN UserInfo ON External_Examiner.id=UserInfo.id
Go


CREATE PROC UserLogin
@email varchar(50),
@password varchar(10),
@success bit OUTPUT,
@user_id int OUTPUT
AS
IF EXISTS
(	
    SELECT UserInfo.id
    FROM UserInfo INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
    WHERE UserInfo.userpassword=@password AND UserEmail.email=@email
)
BEGIN
	SET @success=1
	SET @user_id=(SELECT UserInfo.id
    FROM UserInfo INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
    WHERE UserInfo.userpassword=@password AND UserEmail.email=@email)
END;
ELSE
BEGIN
	SET @success=0
	SET @user_id=-1
END;


GO


CREATE PROC ViewProfile
@user_id int
AS
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id) LIKE'Student'
BEGIN
SELECT *
FROM UserInfo INNER JOIN Student ON UserInfo.id=Student.S_ID INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id) LIKE'Company'
BEGIN
SELECT *
FROM UserInfo INNER JOIN Company ON UserInfo.id=Company.id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'Lecturer'
BEGIN
SELECT *
FROM UserInfo INNER JOIN Lecturer ON UserInfo.id=Lecturer.staff_id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'External_Examiner'
BEGIN
SELECT *
FROM UserInfo INNER JOIN External_Examiner ON UserInfo.id=External_Examiner.id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'Coordinator'
BEGIN
SELECT *
FROM UserInfo INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'External_Supervisor'
BEGIN
SELECT *
FROM UserInfo INNER JOIN External_Examiner ON UserInfo.id=External_Examiner.id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END;
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'Teaching_Assistant'
BEGIN
SELECT *
FROM UserInfo INNER JOIN Teaching_Assistant ON UserInfo.id=Teaching_Assistant.id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid
WHERE UserInfo.id=@user_id
END
IF (
SELECT UserInfo.userrole
FROM UserInfo
WHERE UserInfo.id=@user_id)LIKE'Employee'
BEGIN
SELECT *
FROM UserInfo INNER JOIN Employee ON UserInfo.id=Employee.staff_id INNER JOIN UserPhone ON UserInfo.id=UserPhone.userid
INNER JOIN UserEmail ON UserInfo.id=UserEmail.userid INNER JOIN Company
ON Company.id=Employee.company_id
WHERE UserInfo.id=@user_id
END



GO
CREATE PROC ViewBachelorProjects 
@ProjectType varchar(20), 
@User_id int
AS
IF @ProjectType IS NULL AND @User_id IS NULL
BEGIN
SELECT DISTINCT *
FROM Bachelor_Project INNER JOIN Academic ON  Bachelor_Project.code=Academic.code
SELECT DISTINCT * FROM  Bachelor_Project INNER JOIN Industrial ON Bachelor_Project.code=Industrial.code
END;
ELSE IF @ProjectType IS NULL
BEGIN
SELECT DISTINCT * 
FROM Bachelor_Project INNER JOIN Academic ON  Bachelor_Project.code=Academic.code
WHERE Academic.lecturer_id=@User_id OR Academic.EE_id=@User_id OR Academic.TA_id=@User_id
SELECT DISTINCT * FROM Bachelor_Project INNER JOIN Industrial ON Bachelor_Project.code=Industrial.code
WHERE Industrial.lecturer_id=@User_id OR Industrial.Employee_id=@User_id 
OR Industrial.Company_id=@User_id OR Industrial.CreatorCompany=@User_id
END;
ELSE IF @ProjectType like'Academic'
BEGIN
SELECT DISTINCT * 
FROM Bachelor_Project INNER JOIN Academic ON  Bachelor_Project.code=Academic.code
WHERE Academic.lecturer_id=@User_id OR Academic.EE_id=@User_id OR Academic.TA_id=@User_id
END;
ELSE IF @ProjectType like'Industrial'
BEGIN
SELECT DISTINCT *
FROM Bachelor_Project INNER JOIN Industrial ON Bachelor_Project.code=Industrial.code
WHERE Industrial.lecturer_id=@User_id OR Industrial.Employee_id=@User_id 
OR Industrial.Company_id=@User_id OR Industrial.CreatorCompany=@User_id
END;

GO


CREATE PROC EEGradeThesis 
@EE_id int,
@sid int,
@thesis_title varchar(50),
@EE_grade Decimal(4,2)
AS
insert into External_Examiner_Grades_Thesis values (@ee_id, @thesis_title, @sid, @EE_grade)
update Thesis 
set title = @thesis_title
where s_id = @sid
GO

CREATE PROC EEGradedefense
@EE_id int,
@sid int,
@defense_location varchar(5),
@EE_grade Decimal(4,2)
AS
insert into External_Examiner_Grades_Defense values (@EE_id, @defense_location, @sid, @EE_grade)

GO

CREATE PROC EmployeeGradeThesis
@Employee_id int,
@sid int,
@thesis_title varchar(50),
@Employee_grade Decimal(4,2)
AS
if exists(SELECT *
FROM Industrial INNER JOIN Student ON Industrial.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Industrial.Employee_id=@Employee_id)
BEGIN
insert into Employee_Grades_Thesis
values(@Employee_id,(SELECT Employee.company_id
FROM Employee
WHERE Employee.staff_id=@Employee_id ),@sid,@thesis_title,@Employee_grade)
update Thesis
set title = @thesis_title
where s_id = @sid
end

GO

CREATE PROC EmployeeGradedefense
@Employee_id int,
@sid int,
@defense_location varchar(5),
@Employee_grade Decimal(4,2)
AS
if exists(SELECT *
FROM Industrial INNER JOIN Student ON Industrial.code=Student.Project_ID 
WHERE Student.S_ID=@sid AND Industrial.Employee_id=@Employee_id)
BEGIN
insert into Employee_Grades_Defense
values(@Employee_id,(SELECT Employee.company_id
FROM Employee
WHERE Employee.staff_id=@Employee_id ),@sid,@defense_location,@Employee_grade)
end



GO

CREATE PROC EmployeeCreatePR
@Employee_id int,
@sid int,
@date datetime,
@content varchar(1000)
AS
if exists(select *
from Student INNER JOIN Bachelor_Project ON Student.Project_ID=Bachelor_Project.code INNER JOIN
Industrial ON Bachelor_Project.code=Industrial.code INNER JOIN Employee ON Industrial.Employee_id=Employee.staff_id
WHERE Employee.staff_id=@Employee_id AND Student.S_ID=@sid)
BEGIN
INSERT INTO Progress_report(s_id,content,report_date,Updating_UserId)
VALUES(@sid,@content,@date,@Employee_id)
END
else
begin
print 'Invalid Student id'
end

GO

CREATE PROCEDURE TACreatePR 
@TA_id int,
@s_id int,
@date datetime,
@content varchar(1000)
AS
if exists(Select *
from Student
Where Student.S_ID=@s_id AND Student.TA_assigned=@TA_id)
BEGIN
INSERT INTO Progress_report(s_id,content,report_date,Updating_UserId)
VALUES(@s_id,@content,@date,@TA_id)
END


GO


CREATE PROC AssignAllStudentsToLocalProject
as
DECLARE @counter INT = 1
DECLARE @RowCnt INT
declare @tmpid int
declare @tmpcode varchar(10)

SELECT mp.Student_ID ,mp.Preference_num ,mp.Bachelor_id
INTO tmp
FROM Makes_preference mp inner join Student s
on mp.Student_ID = s.S_ID
order by mp.Preference_num DESC  , s.GPA ASC  


SELECT @RowCnt = COUNT(Student_ID) FROM tmp

WHILE (@counter <= @RowCnt)
BEGIN

    set @tmpid = (SELECT Student_ID 
FROM (
    SELECT Student_ID, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
    FROM tmp
) AS tmptable
WHERE tmptable.RowNum = 1)

set @tmpcode = (
    SELECT Bachelor_id 
FROM (
    SELECT Bachelor_id, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
    FROM tmp
) AS tmptable2
WHERE tmptable2.RowNum = 1)

        update Student
        set Project_ID =  @tmpcode WHERE S_ID = @tmpid

  DELETE FROM tmp WHERE Student_ID = @tmpid 
    DELETE FROM tmp WHERE Bachelor_id = @tmpcode 
   SET @counter = @counter + 1 
END
select s.S_ID, b.* from Student s inner join Bachelor_Project b on s.Project_ID = b.code
drop table tmp
go

CREATE PROC GetType
@userID int,
@type VARCHAR(50) OUTPUT
As
IF exists(SELECT * From Student Where Student.S_ID=@userID)
BEGIN
SET @type='Student'
END
IF exists(SELECT * From Lecturer Where Lecturer.staff_id=@userID)
BEGIN
SET @type='Lecturer'
END
IF exists(SELECT * From External_Examiner Where External_Examiner.id=@userID)
BEGIN
SET @type='External Examiner'
END
IF exists(SELECT * From Company Where Company.id=@userID)
BEGIN
SET @type='Company'
END
IF exists(SELECT * From Coordinator Where Coordinator.id=@userID)
BEGIN
SET @type='Coordinator'
END
IF exists(SELECT * From External_Supervisor Where External_Supervisor.ID=@userID)
BEGIN
SET @type='External Supervisor'
END
IF exists(SELECT * From Teaching_Assistant Where Teaching_Assistant.id=@userID)
BEGIN
SET @type='Teaching Assistant'
END
IF exists(SELECT * From Employee Where Employee.staff_id=@userID)
BEGIN
SET @type='Employee'
END
go

















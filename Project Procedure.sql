use Online_ES

-- select from any table
create proc getAllData @col varchar(20), @tab varchar(20)
with encryption
as 
	execute ('Select '+@col+' from '+ @tab)


sp_helptext 'getAllData'

getAllData '*','Department'
--------------------------------------- instructor procedure ------------------------------------------------
--get specific column
create proc getInsData @colName varchar(20)
as
execute ('Select '+@colName+' from '+ 'instructor')

getInsData Ins_name
---------------------------------------------------------------------------------------------
--get all 
create proc getAllIns 
as
select * from instructor

getAllIns
---------------------------------------------------------------------------------------------
--insert 
create proc addInstructor @id int, @nam varchar(20), @sal int, @dept int
as
    begin try
		insert into instructor
		values(@id,@nam,@sal,@dept)
	end try

	begin catch
		select 'Error'
	end catch

addInstructor 9, yasmeen, 7000,2
---------------------------------------------------------------------------------------------
--upate 
 create proc updateInstructor @colName varchar(20), @colVal varchar(20), @id int
as
execute('update instructor set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where Ins_Id = '+ @id)

updateInstructor 'Ins_Name','dodo',12
updateInstructor 'Ins_salary',9000,12
---------------------------------------------------------------------------------------------
--delete 
create proc delInstructor @colName varchar(20), @colVal varchar(20)
as
execute('delete from instructor where ' + @colName + ' = ' + '''' + @colVal + '''')

delInstructor 'Ins_id' , 11
delInstructor 'Ins_Salary', 7000
delInstructor 'Ins_Name', 'yasmeen'

getAllIns
------------------------------------------ course procedure ------------------------------------------------
 -- get all
 create proc getAllcrs
 as
 select * from Course

 getAllcrs
---------------------------------------------------------------------------------------------
-- select column
 create proc getCourseData @colName varchar(20)
as
execute ('Select '+@colName+' from '+ 'course')

getCourseData crs_name
---------------------------------------------------------------------------------------------
--insert
create proc addCrs @id int, @nam varchar(20), @duration int, @insId int ,@eval varchar(20)
as
    begin try
		insert into course
		values(@id,@nam,@duration,@insId,@eval)
	end try
	begin catch
		select 'Error'
	end catch
addCrs 19, 'js', 7,1,'very good'
getallcrs

---------------------------------------------------------------------------------------------
--upate 
 create proc updateCrs @colName varchar(20), @colVal varchar(20), @id int
as
execute('update course set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where Crs_Id = '+ @id)

updateCrs 'crs_name','java script',10
updateCrs 'Ins_id',2,10

getAllcrs
---------------------------------------------------------------------------------------------
--delete 
create proc delCrs @colName varchar(20), @colVal varchar(20)
as
execute('delete from course where ' + @colName + ' = ' + '''' + @colVal + '''')

delCrs 'crs_id' , 10
delCrs 'Crs_Name', 'json'

----------------------------------------------Exam --------------------------------------------------
--  get all data
create proc getAllExams
as
select * from exam

getAllExams

---------------------------------------------------------------------------------------------
-- get ne column
create proc getExamData @colName varchar(20)
as
execute ('select ' + @colName + ' from exam')

getExamData Ex_Name
---------------------------------------------------------------------------------------------
--insert
create proc addExam @name varchar(20), @crsId int
as
begin try
insert into exam values(@name,@crsId)
end try 
begin catch
select 'error'
end catch

addExam 'json', 2
getAllExams
---------------------------------------------------------------------------------------------
--upate 
 create proc updateExam @colName varchar(20), @colVal varchar(20), @id int
as
execute('update exam set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where Ex_Id = '+ @id)

updateExam 'ex_name','ssss',2
updateExam 'crs_id',1,2

getAllExams
---------------------------------------------------------------------------------------------
--delete 
create proc delExam @colName varchar(20), @colVal varchar(20)
as
execute('delete from exam where ' + @colName + ' = ' + '''' + @colVal + '''')

delExam 'ex_id' , 14
delExam 'Ex_Name', 'ssss'

getAllExams
----------------------------------------------Study in -------------------------------------------
-- get all data
create proc getAllstudyIn
as
select * from Study_In

getAllstudyIn
---------------------------------------------------------------------------------------------
-- get ne column
create proc getStdInData @colName varchar(20)
as
execute ('select ' + @colName + ' from study_in')

getStdInData Crs_id
getAllstudyIn
---------------------------------------------------------------------------------------------
create proc addstudyIn @stId int , @crsId int, @crs_grade int
as
begin try
insert into study_in values(@stId,@crsId,@crs_grade)
end try 
begin catch
select 'error'
end catch

addstudyIn 1,1,50
getAllstudyIn
---------------------------------------------------------------------------------------------
--upate 
 create proc updateStudyIn @colName varchar(20), @colVal varchar(20), @id int
as
execute('update study_in set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where St_id = '+ @id)

updateStudyIn 'Crs_id', 1,2
---------------------------------------------------------------------------------------------
--delete 
create proc delStudyIn @colName varchar(20), @colVal varchar(20)
as
execute('delete from study_in where ' + @colName + ' = ' + '''' + @colVal + '''')

delStudyIn 'Crs_id' , 1
-------------------------------------------------------- Question --------------------------------------
-- get all data
create proc getAllQuestions
as
select * from Question

getAllQuestions
---------------------------------------------------------------------------------------------
-- get one column
create proc getQuestData @colName varchar(20)
as
execute ('select ' + @colName + ' from Question')

getQuestData Qu_Title
---------------------------------------------------------------------------------------------
-- insert 
create proc addQuestion @Qid int , @Qtitle varchar(50), @Qmark int, @ans varchar(50),@type varchar(10) , @examId int , @crsId int
as
begin try
insert into Question values(@Qid,@Qtitle,@Qmark,@ans,@type,@examId,@crsId)
end try 
begin catch
select 'error'
end catch

addQuestion 50,'what is html stand for' , 4,'hyper text markup language','mcq',1,2

getAllQuestions
---------------------------------------------------------------------------------------------
--upate questions
 create proc updatequestion @colName varchar(20), @colVal varchar(50), @id int
as
execute('update question set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where Qu_id = '+ @id)

updatequestion 'Qu_title', 'what is html stand for ?',2
---------------------------------------------------------------------------------------------
--delete 
create proc delStudyIn @colName varchar(20), @colVal varchar(20)
as
execute('delete from study_in where ' + @colName + ' = ' + '''' + @colVal + '''')

delStudyIn 'Crs_id' , 1

--------------------------------------- Question options --------------------------------------------
-- get all data
create proc getAlloptions
as
select * from Quest_Options

getAlloptions
---------------------------------------------------------------------------------------------
-- get one column
create proc getoptionData @colName varchar(20)
as
execute ('select ' + @colName + ' from Quest_OPtions')

getoptionData a
---------------------------------------------------------------------------------------------
-- insert 
create proc addoptions @Qid int , @A varchar(50),@B varchar(50),@C varchar(50),@D varchar(50)
as
begin try
insert into Quest_OPtions values(@Qid,@A,@B,@C,@D)
end try 
begin catch
select 'error'
end catch

addoptions 2,'hyper title mark language','hyper text make language' ,'hyper texts make languages','hyper text markup language'
addoptions 4,'t' ,'f','',''

getAlloptions
---------------------------------------------------------------------------------------------
--upate 
 create proc updateoption @colName varchar(20), @colVal varchar(50), @option varchar(50)
as
execute('update Quest_OPtions set '+ @colName + ' = ' + @colVal +' where a = '+ @option)

updateoption 'a', 'Hyper title mark language', 'hyper title mark language'

---------------------------------------------------------------------------------------------
--delete 
create proc delOption @colName varchar(20), @colVal varchar(50)
as
execute('delete from Quest_OPtions where ' + @colName + ' = ' + '''' + @colVal + '''')

delOption 'a' , 'Hyper title mark language'
getAlloptions
------------------------------------------------- Topic ---------------------------------------------------
-- alldata
create proc getAllTopics
as
select * from Topic

getAllTopics

---------------------------------------------------------------------------------------------
-- get one column
create proc getTopicData @colName varchar(20)
as
execute ('select ' + @colName + ' from Topic')

getTopicData Top_Name
---------------------------------------------------------------------------------------------
-- insert 
create proc addTopic @Tid int , @tName varchar(50), @crsId int
as
begin try
insert into topic values(@Tid,@tName,@crsId)
end try 
begin catch
select 'error'
end catch

addTopic 3,'tags' , 2

getAllTopics
---------------------------------------------------------------------------------------------
--upate 
 create proc updateTopic @colName varchar(20), @colVal varchar(50), @id int
as
execute('update topic set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where Top_id = '+ @id)

updateTopic 'Top_Name', 'Dom',3
---------------------------------------------------------------------------------------------
--delete 
create proc delTopic @colName varchar(20), @colVal varchar(20)
as
execute('delete from topic where ' + @colName + ' = ' + '''' + @colVal + '''')

delTopic 'Top_Name' , 'dom'
----------------------------------------------------------- Takes -------------------------------------------
-- alldata
create proc getAllTakes
as
select * from Takes

getAllTakes

-----------------------------------------------------------
-- get one column
create proc getTakesData @colName varchar(20)
as
execute ('select ' + @colName + ' from takes')

getTakesData Ex_Id
-----------------------------------------------------------
-- insert into
create proc addTake @Sid int , @ex_id int, @QId int, @St_grade int, @st_answer varchar(100)
as
begin try
insert into Takes values(@Sid,@ex_id,@QId,@St_grade,@st_answer)
end try 
begin catch
select 'error'
end catch

addTake 1,1,1,20,'a'

getAlltakes
---------------------------------------------------------------------------------------------
--upate questions 
 create proc updateTakes @colName varchar(20), @colVal varchar(50), @id int
as
execute('update takes set '+ @colName + ' = ' + '''' + @colVal+ ''''  +'where st_id = '+ @id)

updateTakes 'St_Grads',30,2
updateTakes 'St_Ans','m',2
-----------------------------------------------------------
--delete 
create proc delTake @colName varchar(20), @colVal varchar(20)
as
execute('delete from takes where ' + @colName + ' = ' + '''' + @colVal + '''')

delTake 'st_ans' , 'm'
---------------------------------------------------- Student Table ---------------------------------------------
--insert 
create proc AddStud @id int, @fname varchar(20), @lname varchar(20), 
@address varchar(20), @birthDate date, @deptId int
as 
	begin try
		insert into Student
		values (@id, @fname, @lname, @address, @birthDate, @deptId)
	end try
	begin catch
		select 'Error'
	end catch

Addstud 5, 'Hellana', 'Asaad', 'portsaid', '11-9-2000', 1
--------------------------------------------------------------------------------------------------------------
-- Update 
create proc updateStudent  @col varchar(20) , @col_val varchar(20) , @std_id int 
as 
	execute ('update Student set ' + @col + ' = ' + '''' + @col_val + '''' +'where st_id = ' + @std_id )

updateStudent 'Dept_Id' , 1 ,5
updateStudent 'St_Address' ,'cairo'  ,5
--------------------------------------------------------------------------------------------------------------
-- Delete student
create proc deleteStudent  @std_id int 
as 
	delete from Student where st_id = @std_id 
			
deleteStudent 5
----------------------------------------------------- Department Table --------------------------------------------
--insert 
create proc AddDepartment @id int, @name varchar(20), @desc varchar(100)
as 
	begin try
		insert into Department
		values (@id, @name, @desc)
	end try
	begin catch
		select 'Error'
	end catch

AddDepartment 3, 'UI', 'track ui'
--------------------------------------------------------------------------------------------------------
-- Update 
create proc updateDepartment  @col varchar(20) , @col_val varchar(20) , @dept_id int 
as 
	execute ('update Department set ' + @col + ' = ' + '''' + @col_val + '''' +'where Dept_Id = ' + @dept_id )

updateDepartment 'Dept_Name' , 'sd' ,3
updateDepartment 'Dept_Desc' , 'sd track' ,3
--------------------------------------------------------------------------------------------------------
-- Delete student
create proc deleteDepartment  @dept_id int 
as 
	delete from Department where Dept_Id = @dept_id 

deleteDepartment 3
----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------ExamGeneration-----------------------------------------
----------------------------------------------------------------------------------------------------------------
create proc ExamGeneration @crs_id int, @exam_name varchar(50), @mcq int , @TF int
as
	declare @examID int
	declare @questions Table(qst_id int)

	--created new exam with course id and course name
	insert into Exam (Crs_Id,Ex_Name) values (@crs_id,@exam_name)

	--insert into table @questions the generated mcq
	insert into @questions 
	select Top(@mcq) Qu_Id
	from Question
	where type = 'mcq' and  crs_id = 1
	order by NEWID()

	--insert into table @questions the generated true/false questions
	insert into @questions 
	select Top(@TF) Qu_Id
	from Question
	where type = 't/f' and crs_id = 1
	order by NEWID()

	--Get the id of the newly created exams
	select top(1) @examID = Ex_Id from Exam
	order by Ex_Id desc

	--create new cursor to loop on the @questions table 
	--and insert the questions into Exam_Questions (@examID, qst_id)
	declare c1 cursor
	for 
	select qst_id from @questions

	declare @id int
	open c1
	fetch c1 into @id
	while @@FETCH_STATUS=0
		begin
		insert into ExamGenerated 
		values(@examID,@id)
		fetch c1 into @id
		end
	close c1 
	deallocate c1

ExamGeneration 2, 'OS', 1 ,1
----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Exam Answers--------------------------------------------
----------------------------------------------------------------------------------------------------------------
create proc ExamAnswers @examID int ,  @stID int , @stA1 varchar(200),@stA2 varchar(200)
--,
--@stA3 varchar(200),@stA4 varchar(200),@stA5 varchar(200),@stA6 varchar(200),@stA7 varchar(200),
--@stA8 varchar(200),@stA9 varchar(200),@stA10 varchar(200)
as 
	declare @stAnsTable Table(ans varchar(200))
	insert into @stAnsTable values(@stA1),(@stA2)
	--(@stA3),(@stA4),(@stA5),(@stA6)
	--,(@stA7),(@stA8),(@stA9),(@stA10)


	declare c1 cursor
	for 
	select Ques_Id from ExamGenerated
	where Ex_Id = @examID
	declare @q_id int
	open c1
	fetch c1 into @q_id
	
	declare c2 cursor
	for 
	select * from @stAnsTable
	declare @ans varchar(200)
	open c2
	fetch c2 into @ans
		
	while @@FETCH_STATUS=0
		begin
		insert into Takes (Ex_Id,St_Id,Qu_Id,St_Ans) values(@examID,@stID,@q_id,@ans)
		fetch c1 into @q_id
		fetch c2 into @ans
		end
	close c1 
	deallocate c1
	close c2 
	deallocate c2

ExamGeneration 2 , 'C++ one' , 1 , 1
ExamAnswers 30 , 1 , 's','t'
----------------------------------------------------------------------------------------------------------------
-------------------------------------------------------- Exam correction ---------------------------------------
----------------------------------------------------------------------------------------------------------------
create proc ExamCorrection @examID int , @stID int
as
	--begin try
	declare @grade varchar(50)
	declare @crsID int = (select Crs_Id from Exam where Ex_Id = @examID)

Update Takes
set St_Grads=1
where Qu_Id IN
(
SELECT Qu_Id from Question
where Model_ANS = St_Ans
)
Update Takes
set St_Grads =0
where Qu_Id IN
(
SELECT Qu_Id from Question
where Model_ANS != St_Ans
)

Declare @stuDegree Float =(Select sum(St_Grads) FROM Takes
WHERE St_Id=@StID AND Ex_Id=@examID)
Declare @FinalDegree Float =(Select Count(St_Grads) FROM Takes
WHERE St_Id=@StID AND Ex_Id=@examID)
Declare @stuPer Float =(@stuDegree/@FinalDegree)*100
insert into Study_In values (@StID,2,@stuPer)
IF (@stuPer IS NULL)
Begin
Select 'student did not take the exam'
Return
END
 ExamCorrection 30, 1
----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------Reports--------------------------------------------
----------------------------------------------------------------------------------------------------------------
--1 get all students in a department

create proc getStudentInDept @dept_id int
as 
	begin try
		select s.St_Id , (s.St_Fname + ' ' + St_Lname) as [Full Name]
		from Student s , Department d
		where s.dept_id = d.dept_id and s.dept_id = @dept_id
	end try
	begin catch
		SELECT 'Error! Please Make Sure that the Department ID Exists'
	end catch

getStudentInDept 1
 -------------------------------------------------------------------------------------------------------------
 --2 show student courses and grades

create proc getStudentCoursesGrades @stID int
as
	begin try
		select Crs_Id ,grade 
		from Study_In 
		where St_Id = @stID
	end try
	begin catch
		select 'Error! Please Make sure that Student ID is Correct!'
	end catch

 getStudentCoursesGrades 1
 -------------------------------------------------------------------------------------------------------------
 --3 Take instructor id and print a list of courses that he teaches and number of student in each course

alter proc getInstructorCoursesDetails @ins_id int
as
	begin try
		select C.Crs_Name, Count (SI.St_Id) as [number of students]
		from Instructor I, Course C , Study_In SI 
		where C.Ins_Id= @ins_id and SI.Crs_Id = C.Crs_Id and C.Ins_Id = I.Ins_Id
		group by C.Crs_Name
	end try
	begin catch
		select 'Error! Please Make sure that Instructor ID is Correct!'
	end catch

getInstructorCoursesDetails 1

 -------------------------------------------------------------------------------------------------------------
--4-Report that takes course ID and returns its topics 

create proc getCoursesTopics @crs_id int
as
	begin try
		select T.Top_Name as Topic
		from  Course C , Topic T
		where T.Crs_Id = C.Crs_Id and T.Crs_Id = @crs_id
	end try
	begin catch
		select 'Error! Please Make sure that Instructor ID is Correct!'
	end catch

getCoursesTopics 1
 -------------------------------------------------------------------------------------------------------------
 create proc QuestionsChoicesinExam @ex_id int
	as
		declare @Ex_qst Table (qst_id int)
		
		declare @TF_questions Table ( qst_title varchar(200) , a varchar(300) ,b varchar(100) , c varchar(100) , d varchar(100) )
		declare @mcq_questions Table (qst_title varchar(200) , a varchar(300) ,b varchar(100) , c varchar(100) , d varchar(100) )


		insert into @Ex_qst 
		select Qu_Id  from Question
		where Ex_Id = @ex_id

		
	declare c1 cursor
	for 
	select q.qst_id from @Ex_qst q
	open c1
	declare @q int

	fetch c1 into @q

		
	while @@FETCH_STATUS=0
		begin
		-- insert into TF_questions
		insert into @TF_questions (qst_title,a,b)
		select Qu_Title ,a , b 
		from  Question q , Quest_Options o
		where type = 't/f' and q.Qu_Id = @q and q.Qu_Id =o.Qu_Id

		
		-- insert into mcq_questions
		insert into @mcq_questions (qst_title,a,b,c,d)
		select Qu_Title ,a , b , c , d
		from  Question q , Quest_Options o
		where type = 'mcq' and q.Qu_Id = @q and q.Qu_Id =o.Qu_Id
		

fetch c1 into @q
		end
	close c1 
	deallocate c1

declare @TF_Exsist int , @mcq_Exsist int

select * from @TF_questions
union all
select * from @mcq_questions

QuestionsChoicesinExam 1
 -------------------------------------------------------------------------------------------------------------
 --6 Report that takes studentId and ExamID & show exam questions and student answer

create proc show_stdAns_ModelAns @std_id int, @ex_id int 
	as
		select Q.Qu_Title , T.St_Ans
		from Student S, Takes T, Question Q
		where S.St_Id = T.St_Id and T.Qu_Id = Q.Qu_Id

show_stdAns_ModelAns 1, 1	
		


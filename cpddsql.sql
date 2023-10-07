create database CPD1;
use CPD1;
/* 1.information about rows and columns*/
DESCRIBE collegeplacementdata;

/*2.all retrive information data swt*/
/* rename column name */
alter table collegeplacementdata rename column ssc_b to SSC_B;
select * from collegeplacementdata; 
/*Explore the data*/
/*3.how many rows*/
select count(*) from collegeplacementdata;
/*4. how many columns*/
select count(*) from information_schema.columns where table_name='collegeplacementdata';
/* 5.univariate analysis*/
/*A:Find the total number of unique student name.*/
select count(distinct Name) count,name as total_Name from collegeplacementdata group by Name;
/*B: Retrieve the names of all students.*/
select Name from collegeplacementdata;
 /*C: Count the number of male and female students.*/
 select count(*) as count ,gender from collegeplacementdata  group by gender;
 /*Find the highest SSC percentage.*/
 select max(ssc_p) as HigestPercentage from collegeplacementdata;
 /*to count the number of male and female students and display their names:*/
 select gender, count(*) as count ,Name from collegeplacementdata  group by gender, Name;
 /*Find the average HSC percentage.*/
 select round(avg(hsc_p)) as totalavg1 from collegeplacementdata;
 /*Count the number of students from each board (hsc_b).*/
 select hsc_b ,count(*) as numberstudent from collegeplacementdata group by hsc_b;
 /* Count the number of students in each stream (hsc_s).*/
 select hsc_s,count(*) as EachStream from collegeplacementdata group by hsc_s;
 /* Find the minimum degree percentage.*/
 select min(degree_p) from  collegeplacementdata;
 /*Count the number of students in each type of degree program with name*/
 select degree_t ,count(*)  count ,name as EachTypeDegree from  collegeplacementdata group by Name,degree_t;
 /*Count the number of students in each specialisation.*/
 select Name,specialisation,count(*) as count  from collegeplacementdata group by Name,specialisation;
 /* Find the average MBA percentage.*/
 SELECT AVG(mba_p) AS average_mba_percentage FROM  collegeplacementdata;
select * from collegeplacementdata;
/*Count the number of students with and without work experience.*/
select workex, count(*) from collegeplacementdata group by workex;
/* Find the highest E-Test percentage.*/
select * from collegeplacementdata;
 select max(etest_p) from collegeplacementdata;
 /*Count the number of students in each placement status.*/
 select status,count(status) from collegeplacementdata group by status;
 /****************************************************************************************************************************/
/*Biavarte analyis*/
/*Does SSC percentage (`ssc_p`) have an impact on HSC percentage (`hsc_p`)*/
select ssc_p,avg(hsc_p) from collegeplacementdata group by  ssc_p;
/*Is there a relationship between SSC board (`ssc_b`) and SSC percentage (`ssc_p`)?*/
select ssc_b,avg(ssc_p) as avg_ssc_p from  collegeplacementdata group by ssc_b;
/*Is there a correlation between degree percentage (`degree_p`) and MBA percentage (`mba_p`)?*/
select degree_p, avg(mba_p) from collegeplacementdata group by degree_p;

/*Does work experience (`workex`) affect MBA percentage (`mba_p`)?*/
select workex,avg(mba_p) as effect from collegeplacementdata group by workex;
/*Is there a link between specialisation and salary (`specialisation`, `Salary`)?*/
select specialisation,avg(Salary) as linksalary from collegeplacementdata group by specialisation;
/*Are placement status (`status`) and etest percentage (`etest_p`) related?*/
select status, avg(etest_p) from collegeplacementdata group by status;
/*Is there a connection between gender (`gender`) and SSC board (`ssc_b`)?*/
select gender,ssc_b ,count(*) as count from collegeplacementdata group by gender,ssc_b;
 /*Does placement status (`status`) correlate with salary (`Salary`)?*/
SELECT gender,status, AVG(Salary) AS avg_salary FROM collegeplacementdata GROUP BY status ,gender;
/*Is there a connection between HSC board (`hsc_b`) and HSC subject (`hsc_s`)?*/
SELECT hsc_b, hsc_s, COUNT(*) AS count FROM collegeplacementdata GROUP BY hsc_b, hsc_s;


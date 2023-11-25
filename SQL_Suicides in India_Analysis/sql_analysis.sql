--Table creation for Suicides_in_India_Analysis

Create table Suicides_in_India_Analysis ("State" varchar, "Year" int, "Type_code" Varchar, "Type" Varchar, "Gender" varchar,"Age_Group" text, "Total" int);
select * from Suicides_in_India_Analysis;

--Copy data from the CSV file 

copy Suicides_in_India_Analysis from 'C:\Program Files\PostgreSQL\Suicides in India 2001-2012.csv' delimiter ',' csv header;

select * from Suicides_in_India_Analysis;

--Counts the Total Records 

select count ("Year") as Total_Records from Suicides_in_India_Analysis; 


					----------------------------------Total---------------
--Total suicdes Counts in india Period of 2011-2012

Select sum("Total") as Total_suicdes_Counts_in_india_Period_of_2011_to_2012 from Suicides_in_India_Analysis;

--

			----------------------------------Gender---------------

-- Gender wise sucides counts from all over the State year of 2011-2012 in Desending order

select "Gender", sum ("Total") as Gender_wise_sucides_count from Suicides_in_India_Analysis group by "Gender" order by "Gender" desc;

--Compare to Men and women who committed more sucides in india?

select "Gender", sum ("Total") as Gender_ from Suicides_in_India_Analysis group by "Gender" order by "Gender" desc limit 1;

-- Female sucides counts state wise from all over the india year of 2011-2012 in Desending order

select "State",sum("Total") as Female_sucides_state_wise from Suicides_in_India_Analysis where "Gender"='Female'group by "State" order by Female_sucides_state_wise Desc;

---- Male sucides counts state wise from all over the india year of 2011-2012 in Desending order

select "State",sum("Total") as Male_sucides_state_wise from Suicides_in_India_Analysis where "Gender"='Male' group by "State" order by Male_sucides_state_wise Desc;

--For which reason Males mostly committed sucides and total numbers of sucides?

select "Type", sum ("Total") as Most_Reason_For_Male_suicide from Suicides_in_India_Analysis where "Gender"='Male' group by "Type" order by Most_Reason_For_Male_suicide desc limit 1;

--For which reason Women mostly committed sucides and total numbers of sucides?

select "Type", sum ("Total") as Most_Reason_For_Female_suicide from Suicides_in_India_Analysis where "Gender"='Female' group by "Type" order by Most_Reason_For_Female_suicide desc limit 1;

---in which age group Male committed most sucides?

select "Age_Group", sum ("Total") as Most_Male_sucides_Age_group from Suicides_in_India_Analysis where "Age_Group" not in ('0-100+') AND "Gender"='Male' group by "Age_Group" order by Most_Male_sucides_Age_group desc limit 1;

---in which age group Female committed most sucides?

select "Age_Group", sum ("Total") as Most_Female_sucides_Age_group from Suicides_in_India_Analysis where "Age_Group" not in ('0-100+') AND "Gender"='Female' group by "Age_Group" order by Most_Female_sucides_Age_group desc limit 1;
		
		----------------------------------year---------------

-- year wise sucides counts from all over the india year of 2011-2012 in Desending order

select "Year", sum ("Total") as Year_wise_sucides_count from Suicides_in_India_Analysis group by "Year" order by Year_wise_sucides_count desc;

--Which year the most of sucides committed and how many?

select "Year", sum ("Total") as Year_wise_sucides_count from Suicides_in_India_Analysis group by "Year" order by Year_wise_sucides_count desc limit 1;

--Which year the least of sucides committed and how many?

select "Year", sum ("Total") as Year_wise_sucides_count from Suicides_in_India_Analysis group by "Year" order by Year_wise_sucides_count asc limit 1;

--Year wise state sucides_count

select "Year","State",sum ("Total") as Year_wise_sucides_count from Suicides_in_India_Analysis group by "Year","State" order by Year_wise_sucides_count desc;

--Year,state,gender wise state sucides_count

select "Year","State","Gender",sum ("Total") as Year_wise_sucides_count from Suicides_in_India_Analysis group by "Year","State","Gender" order by Year_wise_sucides_count desc;

						----------------------------------State--------------------


-- State wise sucides counts from all over the india year of 2011-2012 in Desending order

select "State", sum ("Total") as "State_wise_sucides_count" from Suicides_in_India_Analysis group by "State" order by "State_wise_sucides_count" desc;

select sum("Total") from Suicides_in_India_Analysis;

--Average State wise sucides counts from all over the india period of 2011-2012 in Desending order

select "State","Gender", sum ("Total") as "Counts of Gender wise Suicides in all states" , round(avg ("Total")) as "Average Suicides" from Suicides_in_India_Analysis group by "State","Gender" order by  "Counts of Gender wise Suicides in all states" desc;


-- State wise sucides counts from all over the india Period of 2011-2012

select "State","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis group by "State","Gender";


--Most sucides committed state in the india in the period of 2011-2012

select "State", sum ("Total") as State_wise_sucides_count from Suicides_in_India_Analysis where "State" not in ('Total (All India)','Total (Uts)','Total (States)') group by "State" order by State_wise_sucides_count desc limit 1;

--Least sucides committed state in the india in the period of 2011-2012

select "State", sum ("Total") as State_wise_sucides_count from Suicides_in_India_Analysis where "State" not in ('Total (All India)','Total (Uts)','Total (States)') group by "State" order by State_wise_sucides_count Asc limit 1;



							----------------------------------Catgery--------------------

--Major Categerys for Suicide in India

select distinct "Type_code" as "Major categorys" from Suicides_in_India_Analysis order by "Major categorys" asc ;

--Major Categery wise suicide counts from all over the india year of 2011-2012 in Desending order

select "Type_code", sum ("Total") as Type_wise_sucides_count from Suicides_in_India_Analysis group by "Type_code" order by Type_wise_sucides_count desc;

-- Which Catgery cause Most of the suicide in india?

select "Type_code", sum ("Total") as Type_wise_sucides_count from Suicides_in_India_Analysis group by "Type_code" order by Type_wise_sucides_count desc limit 1;

--Type_code vs Gender
select "Type_code","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis group by "Type_code","Gender" order by "Gender wise Suicides fall Under reason" desc ;

-- Total Counts of suicides under social Status with different reason

Select "Type_code","Type","Gender",sum("Total") as "Counts of suicides under social Status with different reason" from Suicides_in_India_Analysis where "Type_code"='Social_Status'  group by "Type_code","Type","Gender" order by "Counts of suicides under social Status with different reason" desc;

--Total Counts of suicides under Causes Category with different reason

Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Causes Category with different reason" from Suicides_in_India_Analysis where "Type_code"='Causes'  group by "Type_code","Type","Gender" order by "Total Counts of suicides under Causes Category with different reason" desc;

--Total Counts of suicides under Education_Status Category with different reason

Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Education_Status Category with different reason" from Suicides_in_India_Analysis where "Type_code"='Education_Status'  group by "Type_code","Type","Gender" order by "Total Counts of suicides under Education_Status Category with different reason" desc;

--Total Counts of suicides under Means_adopted Category with different reason

Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Means_adopted Category with different reason" from Suicides_in_India_Analysis where "Type_code"='Means_adopted'  group by "Type_code","Type","Gender" order by "Total Counts of suicides under Means_adopted Category with different reason" desc;

--Total Counts of suicides under Professional_Profile Category with different reason

Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Professional_Profile Category with different reason" from Suicides_in_India_Analysis where "Type_code"='Professional_Profile'  group by "Type_code","Type","Gender" order by "Total Counts of suicides under Professional_Profile Category with different reason" desc;



-----------------------------------Reason--------------------

--Reasons for Suicide in India

select distinct "Type" as "List of Reasons for Suicide in India" from Suicides_in_India_Analysis order by "List of Reasons for Suicide in India" asc ;

--Reason wise suicide counts from all over the india year of 2011-2012 in Desending order

select "Type", sum ("Total") as Reasons_wise_sucides_counts from Suicides_in_India_Analysis group by "Type" order by Reasons_wise_sucides_counts desc;

--What are the reasons to Male and Female committed Suicides in Desending order wise

select "Type","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis group by "Type","Gender" order by "Gender wise Suicides fall Under reason" desc ;


-- Which reason cause Most of the suicide in india?

select "Type", sum ("Total") as Most_Reason_For_suicide from Suicides_in_India_Analysis group by "Type" order by Most_Reason_For_suicide desc limit 1;



	----------------------------------Age_Group--------------------
						
--Age_Group wise suicide counts from all over the india year of 2011-2012 in Desending order

select "Age_Group", sum ("Total") as Age_group_wise_sucides_counts from Suicides_in_India_Analysis group by "Age_Group" order by Age_group_wise_sucides_counts desc;

--Which Age Group People Greatest Risk for Suicides in india?

select "Age_Group", sum ("Total") as Greatest_Risk_age from Suicides_in_India_Analysis where "Age_Group" not in ('0-100+')group by "Age_Group" order by Greatest_Risk_age desc limit 1;

---Age Group Vs suicide Analysis

select "Age_Group","Type_code","Type","Gender", sum ("Total") as "Total Counts of suicides" from Suicides_in_India_Analysis group by "Age_Group","Type_code","Type","Gender" order by "Total Counts of suicides" desc;








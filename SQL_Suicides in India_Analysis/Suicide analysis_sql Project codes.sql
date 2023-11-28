/*This data set contains yearly suicide detail of all the states/u.t of India by various parameters from 2001 to 2012*/
_________________________________________________________________________________
--Creating Table Named “Suicides_in_India_Analysis” 
Create table Suicides_in_India_Analysis ("State" varchar, "Year" int, "Type_code" Varchar, "Type" Varchar, "Gender" varchar,"Age_Group" text, "Total" int);
select * from Suicides_in_India_Analysis;
_________________________________________________________________________________
-- Copying CSV file data from the local path
copy Suicides_in_India_Analysis from 'C:\Program Files\PostgreSQL\Suicides in India 2001-2012.csv' delimiter ',' csv header;
select * from Suicides_in_India_Analysis;
_________________________________________________________________________________
-- counting the total number of records in this dataset
select count ("Year") as Total_Records from Suicides_in_India_Analysis; 
_________________________________________________________________________________
-- Total suicidal counts in India during the period of 2011–2012
 Select sum("Total") as Total_suicdes_Counts_in_india_Period_of_2011_to_2012 from Suicides_in_India_Analysis;
_________________________________________________________________________________
-- Gender-wise success counts from all over the India year 2011–2012 in the Descending order.

select "Gender", sum ("Total") as Gender_wise_suicide_count from Suicides_in_India_Analysis group by "Gender" order by "Gender" desc;
_________________________________________________________________________________
-- Compared to men and women who committed more suicides in India?
select "Gender", sum ("Total") as Gender_ from Suicides_in_India_Analysis group by "Gender" order by "Gender" desc limit 1;
_________________________________________________________________________________

-- Female suicides count state-wise from all over India in 2011-2012 in descending order.

select "State",sum("Total") as Female_suicide_state_wise from Suicides_in_India_Analysis 
where "Gender"='Female'group by "State" order by Female_suicide_state_wise Desc;
_________________________________________________________________________________
-- Male suicides count state-wise from all over India in 2011-2012 in descending order.
select "State",sum("Total") as Male_suicide_state_wise from Suicides_in_India_Analysis
where "Gender"='Male' group by "State" order by Male_suicide_state_wise Desc;
_________________________________________________________________________________
/* For which reason do males mostly commit suicide, and what are the total numbers of suicides, reason-wise? */
select "Type", sum ("Total") as Most_Reason_For_Male_suicide from Suicides_in_India_Analysis 
where "Gender"='Male' group by "Type" order by Most_Reason_For_Male_suicide desc limit 1;
_________________________________________________________________________________
--For which reason do women mostly commit suicides and what are the total numbers of suicides?
select "Type", sum ("Total") as Most_Reason_For_Female_suicide from Suicides_in_India_Analysis 
where "Gender"='Female' group by "Type" order by Most_Reason_For_Female_suicide desc limit 1;
_________________________________________________________________________________
-- In which age group did Male commit the most suicides?
select "Age_Group", sum ("Total") as Most_Male_suicide_Age_group from Suicides_in_India_Analysis 
where "Age_Group" not in ('0-100+') AND "Gender"='Male' group by "Age_Group" order by Most_Male_suicide_Age_group desc limit 1;
_________________________________________________________________________________
---in which age group Female committed most suicides?
select "Age_Group", sum ("Total") as Most_Female_suicide_Age_group from Suicides_in_India_Analysis
where "Age_Group" not in ('0-100+') AND "Gender"='Female' group by "Age_Group" order by Most_Female_suicide_Age_group desc limit 1;
_________________________________________________________________________________
-- year-wise suicide counts from all over India in 2011–2012 in Descending order
select "Year", sum ("Total") as Year_wise_suicide_count from Suicides_in_India_Analysis 
group by "Year" order by Year_wise_suicide_count desc;
_________________________________________________________________________________
-- Which year saw the most suicides committed, and how many?
select "Year", sum ("Total") as Year_wise_suicide_count from Suicides_in_India_Analysis 
group by "Year" order by Year_wise_suicide_count desc limit 1;

_________________________________________________________________________________
-- Which year saw the least suicides committed, and how many?
select "Year", sum ("Total") as Year_wise_suicide_count from Suicides_in_India_Analysis
group by "Year" order by Year_wise_suicide_count asc limit 1;
_________________________________________________________________________________
-- Year-wise in the state suicide counts
select "Year","State",sum ("Total") as Year_wise_suicide_count from Suicides_in_India_Analysis 
group by "Year","State" order by Year_wise_suicide_count desc;
_________________________________________________________________________________
--Year, state, gender-wise state suicide count using Group by
select "Year","State","Gender",sum ("Total") as Year_wise_suicide_count from Suicides_in_India_Analysis 
group by "Year","State","Gender" order by Year_wise_suicide_count desc;
_________________________________________________________________________________
-- State-wise suicide counts from all over India for the period of 2011–2012 are in Descending order.

select "State", sum ("Total") as "State_wise_suicide_count" from Suicides_in_India_Analysis
group by "State" order by "State_wise_suicide_count" desc;
_________________________________________________________________________________
-- Total suicide in India during the period of 2011–2012
select sum("Total") from Suicides_in_India_Analysis;
_________________________________________________________________________________
-- State-wise suicide counts from all over India during the period of 2011–2012
select "State","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis 
group by "State","Gender";
_________________________________________________________________________________
--Most suicides committed in India during the period of 2011–2012
select "State", sum ("Total") as State_wise_suicide_count from Suicides_in_India_Analysis
where "State" not in ('Total (All India)','Total (Uts)','Total (States)') group by "State" order by State_wise_suicide_count desc limit 1;
_________________________________________________________________________________
-- The least suicide-committed state in India during the period of 2011–2012
select "State", sum ("Total") as State_wise_suicide_count from Suicides_in_India_Analysis 
where "State" not in ('Total (All India)','Total (Uts)','Total (States)') group by "State" order by State_wise_suicide_count Asc limit 1;
_________________________________________________________________________________
-- Major Categories for Suicide in India
select distinct "Type_code" as "Major categorys" from Suicides_in_India_Analysis order by "Major categorys" asc ;
_________________________________________________________________________________
-- Major category-wise suicide counts from all over India during the years 2011–2012 are in Descending order.
select "Type_code", sum ("Total") as Type_wise_suicide_count from Suicides_in_India_Analysis 
group by "Type_code" order by Type_wise_suicide_count desc;
_________________________________________________________________________________
-- Which category causes most of the suicides in India ?
select "Type_code", sum ("Total") as Type_wise_suicide_count from Suicides_in_India_Analysis 
group by "Type_code" order by Type_wise_suicide_count desc limit 1;
_________________________________________________________________________________
--Category-wise gender count during the period of 2011–2012
select "Type_code","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis 
group by "Type_code","Gender" order by "Gender wise Suicides fall Under reason" desc ;
_________________________________________________________________________________
-- Total Counts of Suicides under Social Status with Different Reasons 
Select "Type_code","Type","Gender",sum("Total") as "Counts of suicides under social Status with different reason" 
from Suicides_in_India_Analysis where "Type_code"='Social_Status'  group by "Type_code","Type","Gender" 
order by "Counts of suicides under social Status with different reason" desc;
_________________________________________________________________________________
-- Total Counts of Suicides under the Causes Category with Different Reasons
Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Causes Category with different reason"
from Suicides_in_India_Analysis where "Type_code"='Causes'  group by "Type_code","Type","Gender"
order by "Total Counts of suicides under Causes Category with different reason" desc;
_________________________________________________________________________________
-- Total Counts of Suicides under the Education Status Category with Different Reasons
Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Education_Status Category with different reason" 
from Suicides_in_India_Analysis where "Type_code"='Education_Status'  group by "Type_code","Type","Gender" 
order by "Total Counts of suicides under Education_Status Category with different reason" desc;
_________________________________________________________________________________
--Total Counts of suicides under Means adopted Category with different reason
Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Means_adopted Category with different reason"
from Suicides_in_India_Analysis where "Type_code"='Means_adopted'  group by "Type_code","Type","Gender" 
order by "Total Counts of suicides under Means_adopted Category with different reason" desc;
_________________________________________________________________________________
--Total Counts of suicides under Professional Profile Category with different reason
Select "Type_code","Type","Gender",sum("Total") as "Total Counts of suicides under Professional_Profile Category with different reason" 
from Suicides_in_India_Analysis where "Type_code"='Professional_Profile'  group by "Type_code","Type","Gender" 
order by "Total Counts of suicides under Professional_Profile Category with different reason" desc;
_________________________________________________________________________________
--Reasons for Suicide in India
select distinct "Type" as "List of Reasons for Suicide in India" from Suicides_in_India_Analysis 
order by "List of Reasons for Suicide in India" asc ;
_________________________________________________________________________________
/*Reason wise suicide counts from all over the India during the year of 2011-2012 in Descending order*/
select "Type", sum ("Total") as Reasons_wise_suicide_counts from Suicides_in_India_Analysis 
group by "Type" order by Reasons_wise_suicide_counts desc;
_________________________________________________________________________________
--What are the reasons to Male and Female committed Suicides in Descending order wise
select "Type","Gender",sum ("Total") as "Gender wise Suicides fall Under reason" from Suicides_in_India_Analysis 
group by "Type","Gender" order by "Gender wise Suicides fall Under reason" desc ;
_________________________________________________________________________________
-- Which reason cause Most of the suicide in India?

select "Type", sum ("Total") as Most_Reason_For_suicide from Suicides_in_India_Analysis group by "Type"
order by Most_Reason_For_suicide desc limit 1;
_________________________________________________________________________________
/*In descending order, age-group suicide counts from all over India during the years 2011–2012*/
select "Age_Group", sum ("Total") as Age_group_wise_suicide_counts from Suicides_in_India_Analysis 
group by "Age_Group" order by Age_group_wise_suicide_counts desc;
_________________________________________________________________________________
--Which Age Group People Greatest Risk for Suicides in India?
select "Age_Group", sum ("Total") as Greatest_Risk_age from Suicides_in_India_Analysis where "Age_Group" not in ('0-100+')
group by "Age_Group" order by Greatest_Risk_age desc limit 1;
_________________________________________________________________________________
---Age Group Wise Vs Suicide Counts
select "Age_Group","Type_code","Type","Gender", sum ("Total") as "Total Counts of suicides" from Suicides_in_India_Analysis
group by "Age_Group","Type_code","Type","Gender" order by "Total Counts of suicides" desc;
_________________________________________________________________________________
/* Acknowledgements
National Crime Records Bureau (NCRB), Govt of India has shared this dataset under Govt. Open Data License - India.*/








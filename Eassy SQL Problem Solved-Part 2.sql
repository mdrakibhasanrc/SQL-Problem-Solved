1. Show first name, last name, and gender of patients who's gender is 'M'.
select
  first_name,last_name,gender
 from patients
 where gender='M';
2.Show first name and last name of patients who does not have allergies. (null).
select
  first_name,
  last_name
from patients
where allergies is null;
3. Show first name of patients that start with the letter 'C'
select
  first_name
from patients
where 
 first_name like 'C%';
4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive).
select
  first_name,
  last_name
from patients
where 
 weight between 100 and 120;
5. Show first name and last name concatinated into one column to show their full name.
select
  concat(first_name,' ',last_name) as full_name
 from patients;
6. Show first name, last name, and the full province name of each patient.
Example: 'Ontario' instead of 'ON'
select
   a.first_name,
   a.last_name,
   b.province_name
 from patients a 
 join  province_names b  on
 a.province_id=b.province_id
7.Show how many patients have a birth_date with 2010 as the birth year.
select
  count(patient_id) as total_patients
 from patients
 where year(birth_date)=2010;
8.Show the first_name, last_name, and height of the patient with the greatest height.
select
  first_name,
  last_name,
 max(height)
 from patients;
9. Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000
 select
  *
 from patients
 where
   patient_id in (1,45,534,879,1000);
 
10. Show the total number of admissions.
select 
   count(patient_id) as total_admissions
 from admissions;
11.Show all the columns from admissions where the patient was admitted and discharged on the same day.
select 
   *
 from admissions
 where
    admission_date = discharge_date;
12. Show the total number of admissions for patient_id 579.
SELECT
  patient_id,
  COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 579;
13. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select
  distinct(city) as unique_cities
 from patients
 where
   province_id='NS';
14.Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70.
select
   first_name,
   last_name,
   birth_date
 from patients
 where
   height >160 and weight >70;
15. Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null.
select 
   first_name,
   last_name,
   allergies
  from patients
  where
    city='Hamilton' and
    allergies is not NULL;
    
16. Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city.
select distinct city
from patients
where
  city like 'a%'
  or city like 'e%'
  or city like 'i%'
  or city like 'o%'
  or city like 'u%'
order by city;
17. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'.

UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;
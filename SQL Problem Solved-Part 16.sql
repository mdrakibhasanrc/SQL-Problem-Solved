1.This database is getting too big, lets remove all movies that were released before 2005.

delete from movies
where year <2005;


2. Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.

select
    city,
    count(patient_id) as total
  from patients
  group by city
  order by
     total desc,
     city asc;

3. Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"

SELECT first_name, last_name, 'Patient' as role FROM patients
    union all
select first_name, last_name, 'Doctor' from doctors;

4. Show all allergies ordered by popularity. Remove NULL values from query.

SELECT
  allergies,
  COUNT(*) AS total_diagnosis
FROM patients
WHERE
  allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC;

5. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

select
    first_name,
    last_name,
    birth_date
  from patients
  where year(birth_date) between 1970 and 1979
  order by birth_date asc;

6. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane.

select
   concat(upper(last_name),",",lower(first_name)) as full_name
 from patients
 order by first_name desc;

7. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

select
   province_id,
   sum(height)
  from patients
  group by province_id
  having sum(height) >= 7000;

8.Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

select
   (max(weight)-min(weight)) as weight_delta
  from patients
  where last_name='Maroni';

9. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

select
   day(admission_date) as day_number,
   count(*) as number_of_admissions
  from admissions
  group by day_number
  order by number_of_admissions desc;

10. Show all columns for patient_id 542's most recent admission_date.

select
  *
 from admissions
 where patient_id=542
 order by admission_date desc
 limit 1;
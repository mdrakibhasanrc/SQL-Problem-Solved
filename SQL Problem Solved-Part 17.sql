1. Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
a.. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
b.. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

select
     patient_id,
     attending_doctor_id,
     diagnosis
    from admissions
    where (patient_id%2 !=0 and attending_doctor_id in(1,5,19)) or
    (attending_doctor_id like "%2%" and len(patient_id)=3);


2. 
Show first_name, last_name, and the total number of admissions attended for each doctor.

Every admission has been attended by a doctor.


select
    d.first_name,
    d.last_name,
    count(a.patient_id) as counta
  from doctors d 
  join admissions a on a.attending_doctor_id=d.doctor_id
  group by d.doctor_id;

3. For each doctor, display their id, full name, and the first and last admission date they attended.

select
  doctor_id,
  first_name || ' ' || last_name as full_name,
  min(admission_date) as first_admission_date,
  max(admission_date) as last_admission_date
from admissions a
  join doctors ph on a.attending_doctor_id = ph.doctor_id
group by doctor_id;
    

4. Display the total amount of patients for each province. Order by descending.

select
   p.province_name,
   count(a.patient_id) as total
 from province_names p 
 join patients a on p.province_id=a.province_id
 group by p.province_name
 order by total desc;
    
5. For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

select
   concat(p.first_name," ",p.last_name) as patient_full_name,
   a.diagnosis,
   concat(d.first_name," ",d.last_name) as doctors_full_name
 from patients p 
 join admissions a on a.patient_id=p.patient_id
 join doctors d on a.attending_doctor_id=d.doctor_id;


6. display the number of duplicate patients based on their first_name and last_name.

select
  first_name,
  last_name,
  count(*) as num_of_duplicates
from patients
group by
  first_name,
  last_name
having count(*) > 1



7.Display patient's full name,
height in the units feet rounded to 1 decimal,
weight in the unit pounds rounded to 0 decimals,
birth_date,
gender non abbreviated.

Convert CM to feet by dividing by 30.48.
Convert KG to pounds by multiplying by 2.205.

select
   concat(first_name," ",last_name) as full_name,
   round((height/30.48),1) as height,
   Round(weight*2.205) as weight,
   birth_date,
   case 
      when gender="M" then "Male"
      else "Female"
   end as gender_type
  from patients;

8. Show all allergies ordered by popularity. Remove NULL values from query.

select
   allergies,
   count(*) as total
 from patients
 where allergies is not null
 group by allergies
 order by total desc;

9. Display every patient's first_name.
Order the list by the length of each name and then by alphbetically

SELECT first_name
FROM patients
order by
  len(first_name),
  first_name;



10. Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.

SELECT 
  (SELECT count(*) FROM patients WHERE gender='M') AS male_count, 
  (SELECT count(*) FROM patients WHERE gender='F') AS female_count;


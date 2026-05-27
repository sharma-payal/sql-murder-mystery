--SQL MURDER MYSTERY INVESTIGATION

--Detective : Payal Sharma

--Case notes:
--Murder committed : 15 Jan 2018 in SQL city

---1. QUERY

SELECT * FROM crime_scene_report
 WHERE date = 20180115
 AND city = 'SQL City';

---2.Query (1st witness and 2nd witness)

--a) First witness:

SELECT * FROM interview
 WHERE address_street_name = 'Northwestern Dr'
 ORDER BY address_number DESC;

--b) Second  witness:

SELECT * FROM interview
 WHERE name LIKE '%Annable%'
 AND address_street_name = 'Franklin Ave';

---3. Ivestigate Interview:

--Witness 1 identifies:
SELECT * FROM interview
 WHERE person_id = 14887 ;

--Witness 2 identifies:
SELECT * FROM interview
 WHERE person_id  = 16371;


--4 Investigating the gold membership with check in date on 09th Jan 2018

SELECT * FROM get_fit_now_member 
 WHERE membership_status = 'gold';

SELECT * FROM get_fit_now_check_in
 WHERE check_in_date = 20180109;


-- 5 Membership Inner JOIN + check in date 
 
SELECT m.id,
   m.name,
   m.membership_status,
   c.check_in_date
 FROM get_fit_now_member m 
 INNER JOIN get_fit_now_check_in c
 ON m.id = c.membership_id
 WHERE c.check_in_date = 20180109
 AND m.membership_status = 'gold';

--6.License Plate Clue (plate contains H42W)

 SELECT *
 FROM drivers_license
 WHERE plate_number LIKE '%H42W%';   


--7.JOIN member with person
SELECT p.id,
  p.name, 
  p.license_id,
  g.id AS membership_id
 FROM person p
 INNER JOIN get_fit_now_member g
 ON p.id = g.person_id;

--8.FILTER USING INTERVIEW CLUES
 
 SELECT p.name,
       d.plate_number,
       g.membership_status,
       c.check_in_date
FROM person p
INNER JOIN drivers_license d
ON p.license_id = d.id
INNER JOIN get_fit_now_member g
ON p.id = g.person_id
INNER JOIN get_fit_now_check_in c
ON g.id = c.membership_id
WHERE g.membership_status = 'gold'
AND c.check_in_date = 20180109
AND d.plate_number LIKE '%H42W%';


## Suspect Investigation

### SQL Techniques Used
- INNER JOIN
- LIKE
- Multi-table filtering

### Findings
- Identified suspect through gym membership and license plate analysis



--9. Jeremy Bower: the murderer's id
SELECT *
FROM interview
WHERE person_id = 67318;


--10. Filter query to find the red hair woman with tesla model s


SELECT p.id,
       p.name,
       d.hair_color,
       d.gender,
       d.car_make,
       d.car_model,
       fb.event_name,
       fb.date
FROM person p
INNER JOIN drivers_license d
ON p.license_id = d.id
INNER JOIN facebook_event_checkin fb
ON p.id = fb.person_id
WHERE d.gender = 'female'
AND d.hair_color = 'red'
AND d.car_make = 'Tesla'
AND d.car_model = 'Model S'
AND fb.event_name = 'SQL Symphony Concert'
AND fb.date LIKE '201712%';



--11. Filter the soecific

--- Find the mastermind
SELECT p.name,
       COUNT(*) AS concert_visits
FROM person p
INNER JOIN drivers_license d
ON p.license_id = d.id
INNER JOIN facebook_event_checkin fb
ON p.id = fb.person_id
WHERE d.gender = 'female'
AND d.hair_color = 'red'
AND d.car_make = 'Tesla'
AND d.car_model = 'Model S'
AND fb.event_name = 'SQL Symphony Concert'
AND fb.date LIKE '201712%'
GROUP BY p.name
HAVING COUNT(*) = 3;


--12. Insert the solution value

INSERT INTO solution VALUES (1, 'Miranda Priestly');


--13.
--Solution
SELECT value
FROM solution;


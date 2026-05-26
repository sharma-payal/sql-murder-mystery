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




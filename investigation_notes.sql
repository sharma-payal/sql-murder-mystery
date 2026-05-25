--SQL MURDER MYSTERY INVESTIGATION

--Detective : Payal Sharma

--Case notes:
--Murder committed : 15 Jan 2018 in SQL city

---1. QUERY

SELECT * FROM crime_scene_report WHERE date = 20180115 AND city = 'SQL City';

---2.Query (1st witness and 2nd witness)

--a) First witness:

SELECT * FROM interview WHERE address_street_name = 'Northwestern Dr' ORDER BY address_number DESC;

--b) Second  witness:
SELECT * FROM interview WHERE name LIKE '%Annable%' AND address_street_name = 'Franklin Ave';

---3. Ivestigate Interview:

--Witness 1 identifies:
SELECT * FROM interview WHERE person_id = 14887 ;

--Witness 2 identifies:
SELECT * FROM interview WHERE person_id  = 16371;




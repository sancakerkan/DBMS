-- |1st Special Query|----------------------
--------------------------------------------
	select Rooms.room_ID
	from Classes,Rooms
	where Classes.room_ID = Rooms.room_ID
	and class_day in('Wednesday','Friday')
	and class_time between 20:00 and 21:00
	ORDER BY class_count;


-- |2nd Special Query|---------------------
-------------------------------------------
	select * from Classes 
	where class_time between 18:100 and 19:00
	and class_day in('Saturday','Sunday');


-- |Other Queries|-------------------------
-------------------------------------------
	
	----finds max payment------
	select max(p.total_payment) 
	from payment p;				

	----finds min payment------
	select min(p.total_payment)
	from payment p;

	----gives average capacity by descending order while grouping by room_ID------
	SELECT AVG(capacity), room_ID
	FROM Rooms
	GROUP BY room_ID
	ORDER BY AVG(capacity) DESC;

	---finds sum of total_payment where students use their credit cards------
	select SUM(total_payment)
	from Payment
	where payment_method = 'Credit Card';

	---lists the number of students in each class, only include class_type with more than 2 students------
	SELECT COUNT(student_ID), class_type
	FROM Students
	GROUP BY class_type
	HAVING COUNT(student_ID) > 2;

	----------distinct values-----------------------------------------------
	SELECT DISTINCT class_time FROM Classes;

	-----------lists tutar phone which are not null---------------------------
	select tutor_ID, tutor_name 
	from Tutors
	where tutor_phone is not null;

	--------------lists null tutor phones--------------------------
	select tutor_ID, tutor_name 
	from Tutors
	where tutor_phone is null;
	
	------------lists union of student_ID from two tables and orders by ascending----------------
	SELECT student_ID FROM Students
	UNION
	SELECT student_ID FROM Payment
	ORDER BY student_ID ASC;
	
	------------lists classes without Guitar or Piano----------------
	SELECT * FROM Classes 		
	where class_type NOT IN ('Guitar Class', 'Piano Class');

	------------lists classes with Guitar or Piano----------------
	SELECT * FROM Classes 		
	where class_type  IN ('Guitar Class', 'Piano Class');

	-------------lists student names starts with 'e'----------------
	SELECT * FROM student_name
	WHERE Students LIKE '%e';

	
  	-------------lists students expect 'Metehan TÃ¼ter'--------------------
  	SELECT S.student_ID, S.student_name FROM Students S /* selects all the employees except that has employee id not euqal to 5*/
	EXCEPT
	SELECT S.student_ID, S.student_name FROM Students S where S.student_name ='Metehan TÃ¼ter';

	-----------------Selects David Gilmour if the room id matches-------------
	SELECT * FROM Tutors
	WHERE tutor_name='David Gilmour' AND room_ID = 'B1';

	----------------Lists David Gilmour and room_ID without looking for a match-------------------
	SELECT * FROM Tutors
	WHERE tutor_name='David Gilmour' OR room_ID = 'B1';
	
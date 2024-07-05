
--------------------- |Creating Tables| ---------------------------

CREATE TABLE public.Music_Company (
	company_name varchar(30),
	company_phone INT not null,
	company_mail varchar(30) not null,
	company_address varchar(30) not null,
	CONSTRAINT Music_Company_pk PRIMARY key(company_name)
);


CREATE TABLE public.Music_Studios (
	studio_name varchar(30),
	studio_phone INT not null,
	studio_mail varchar(30) not null,
	studio_address varchar(30) not null,
	company_name varchar(30) not null,
	CONSTRAINT Music_Studios_pk PRIMARY key(studio_name),
	CONSTRAINT Music_Studios_fk FOREIGN key(company_name) references Music_Company(company_name)
);

CREATE TABLE public.Rooms (
	room_ID varchar(30),
	capacity INT not null,
	CONSTRAINT Rooms_pk PRIMARY key(room_ID)
);


CREATE TABLE public.Classes (
	class_type varchar(30) ,
	class_time TIME not null,
	class_day varchar(30) not null,
	class_count INT not null,
	room_ID varchar(30) not null,
	tutor_name varchar(30) not null,
	studio_name varchar(30) not null,
	CONSTRAINT Classes_pk PRIMARY key(class_type),
	CONSTRAINT Classes_fk1 FOREIGN key(room_ID) references Rooms(room_ID),
	CONSTRAINT Classes_fk2 FOREIGN key(tutor_name) references Tutors(tutor_name),
	CONSTRAINT Classes_fk3 FOREIGN key(studio_name) references Music_Studios(studio_name)
);
	
CREATE TABLE public.Tutors (
	tutor_name varchar(30),
	tutor_ID INT not null,
	tutor_mail varchar(30) not null,
	tutor_phone INT not null,
	room_ID varchar(30) not null,
	CONSTRAINT Tutors_pk PRIMARY KEY(tutor_name),
	CONSTRAINT Tutors_fk FOREIGN key(room_ID) references Rooms(room_ID)
);	

CREATE TABLE public.Students (
	student_ID INT,
	student_name varchar(30) not null,
	student_mail varchar(30) not null,
	student_phone INT not null,
	class_type varchar(30) not null,
	room_ID varchar(30) not null,
	class_day varchar(30) not null,
	CONSTRAINT Students_pk PRIMARY key(student_ID),
	CONSTRAINT Students_fk1 FOREIGN key(class_type) references Classes(class_type)
	CONSTRAINT Students_fk2 FOREIGN key(room_ID) references Rooms(room_ID),
	CONSTRAINT Students_fk3 FOREIGN key(class_day) references Classes(class_day)
	
);


CREATE TABLE public.Payment (
	total_payment INT,
	payment_method varchar(30) not null,
	student_ID INT not null,
	CONSTRAINT Payment_pk PRIMARY key(total_payment),
	CONSTRAINT Payment_fk FOREIGN key(student_ID) references Students(studen_ID)
	
);

	

------------------------ |DATA Insertions| -------------------------------------

INSERT INTO Rooms values ('A1', 30);
INSERT INTO Rooms values ('A2', 30);
INSERT INTO Rooms values ('A3', 40);
INSERT INTO Rooms values ('B1', 50);
INSERT INTO Rooms values ('B2', 20);
INSERT INTO Rooms values ('B3', 10);
INSERT INTO Rooms values ('B4', 18);
INSERT INTO Rooms values ('C1', 30);
INSERT INTO Rooms values ('C2', 20);
INSERT INTO Rooms values ('D1', 40);

INSERT INTO Music_Company values ('SQL Music Company', 05325699722 , 'sqlmc@outlook.com' , 'Savaş Cad. 8. Sokak 14 Numara Ankara');
INSERT INTO Music_Company values ('SQL Music Company', 05325968741 , 'sqlmc@outlook.com' , 'Barış Cad. 2. Sokak 13 Numara Ankara');
INSERT INTO Music_Company values ('SQL Music Company', 05312596496 , 'sqlmc@outlook.com' , 'Gül Cad. 4. Sokak 2 Numara İstanbul');
INSERT INTO Music_Company values ('SQL Music Company', 05485329651 , 'sqlmc@outlook.com' , 'Gonca Cad. 9. Sokak 9 Numara İstanbul');
INSERT INTO Music_Company values ('SQL Music Company', 05323655262 , 'sqlmc@outlook.com' , 'Yıldız Cad. 1. Sokak  Numara İstanbul');
INSERT INTO Music_Company values ('SQL Music Company', 05023548865 , 'sqlmc@outlook.com' , 'Bayır Cad. 7. Sokak 32 Numara İstanbul');
INSERT INTO Music_Company values ('SQL Music Company', 05324898650 , 'sqlmc@outlook.com' , 'Ders Cad. 7. Sokak 64 Numara İstanbul');
INSERT INTO Music_Company values ('SQL Music Company', 05264856213 , 'sqlmc@outlook.com' , 'Cenk Cad. 5. Sokak 25 Numara İzmir');
INSERT INTO Music_Company values ('SQL Music Company', 05913545220 , 'sqlmc@outlook.com' , 'Lale Cad. 3. Sokak 12 Numara İzmir');
INSERT INTO Music_Company values ('SQL Music Company', 05329523010 , 'sqlmc@outlook.com' , 'Ata Cad. 2. Sokak 15 Numara Antalya');

INSERT INTO Music_Studios values ('Studio-1', 05335986712,'studio1@outlook.com' , 'Zambak Cad. 2. Sokak 12 Numara Ankara', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-2', 05868649855,'studio2@outlook.com' , 'Ayaş Cad. 5. Sokak 12 Numara Ankara', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-3', 05856514510,'studio3@outlook.com' , 'Genç Cad. 1. Sokak 7 Numara Ankara', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-4', 05335455811,'studio4@outlook.com' , 'İstiklal Cad. 1. Sokak 38 Numara İstanbul', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-5', 05335002541,'studio5@outlook.com' , 'Bahariye Cad. 3. Sokak 24 Numara İstanbul', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-6', 05333389777,'studio6@outlook.com' , 'Kıbrıs Cad. 3. Sokak 14 Numara İstanbul', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-7', 05335114544,'studio7@outlook.com' , 'Atatürk Cad. 6. Sokak 45 Numara İstanbul', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-8', 05331100245,'studio8@outlook.com' , 'Gazi Cad. 2. Sokak 8 Numara İstanbul', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-9', 05111254823,'studio9@outlook.com' , 'Cumhuriyet Cad. 2. Sokak 19 Numara İzmir', 'SQL Music Company');
INSERT INTO Music_Studios values ('Studio-10',05316898812,'studio0@outlook.com' , 'Hoşdere Cad. 2. Sokak 42 Numara Antalya', 'SQL Music Company');

INSERT INTO Classes values ('Guitar Class', 17.00 , 'Friday', 29 , 'A1', 'Slash', 'Studio-1');
INSERT INTO Classes values ('Guitar Class', 21.00 , 'Sunday', 28 , 'A1', 'Slash','Studio-1');
INSERT INTO Classes values ('Guitar Class', 21.00 , 'Sunday', 20 , 'C2', 'David Gilmour','Studio-5');
INSERT INTO Classes values ('Piano Class', 17.00 , 'Saturday', 32 , 'B1', 'Wolfgang Amadeus Mozart','Studio-6');
INSERT INTO Classes values ('Piano Class', 20.00 , 'Sunday', 48 , 'B1', 'Wolfgang Amadeus Mozart','Studio-6');
INSERT INTO Classes values ('Piano Class', 19.00 , 'Friday', 20 , 'B2', 'Ludwig van Beethoven','Studio-3');
INSERT INTO Classes values ('Piano Class', 22.00 , 'Monday', 19 , 'B2', 'Ludwig van Beethoven','Studio-3');
INSERT INTO Classes values ('Violin Class', 20.00 , 'Monday', 40 , 'D1', 'Antonio Vivaldi','Studio-10');
INSERT INTO Classes values ('Violin Class', 15.00 , 'Tuesday', 40 , 'D1', 'Antonio Vivaldi','Studio-10');
INSERT INTO Classes values ('Drum Class', 22.00 , 'Sunday', 27 , 'A2', 'John Bonham,''Studio-6');

INSERT INTO Tutors values ('Wolfgang Amadeus Mozart', 1791, 'mozart@outlook.com', 05317910512, 'B1');
INSERT INTO Tutors values ('Ludwig van Beethoven', 1770, 'beethoven@outlook.com', 05322603187, 'B2');
INSERT INTO Tutors values ('Antonio Vivaldi', 1678, 'vivaldi@outlook.com',  05319556122, 'D1');
INSERT INTO Tutors values ('John Bonham',  1948, 'john@outlook.com',  05356522210, 'A2');
INSERT INTO Tutors values ('Slash', 1965 , 'slash@outlook.com',   05111118934, 'A1');
INSERT INTO Tutors values ('David Gilmour', 1946, 'gilmour@outlook.com',  05355550513, 'C2');
INSERT INTO Tutors values ('Eric Clapton', 1945, 'clapton@outlook.com',  05825626512, 'B3');
INSERT INTO Tutors values ('Frédéric Chopin', 1849, 'chopin@outlook.com',  05366658974, 'C1');
INSERT INTO Tutors values ('Chad Smith', 1961, 'chadsmith@outlook.com', 05317910512, 'A3');
INSERT INTO Tutors values ('Johann Sebastian Bach', 1750, 'bach@outlook.com', 05317910519, 'B4');


INSERT INTO Students values (55555, 'Ali Berk' , 'aliberk@tedu.edu.tr' , 05377877479, 'Guitar Class', 'C2', 'Sunday');
INSERT INTO Students values (66666, 'Can Yan' , 'canyan@tedu.edu.tr' ,	053854561321, 'Piano Class', 'B1', 'Saturday');
INSERT INTO Students values (77777, 'Cem Berk' , 'cemberk@tedu.edu.tr' ,  05354562479, 'Violin Class', 'D1','Monday');
INSERT INTO Students values (88888, 'Ela Ayhan' , 'elaayhan@tedu.edu.tr' , 05385777797, 'Violin Class', 'D1', 'Monday');
INSERT INTO Students values (99999, 'Barış Uğur' , 'barisugur@tedu.edu.tr' , 0537897898, 'Violin Class', 'D1', 'Tuesday');
INSERT INTO Students values (11111, 'Ela Uzun' , 'elauzun@tedu.edu.tr' , 0532888759,'Drum Class', 'A2', 'Sunday' );
INSERT INTO Students values (22222, 'Erkan Sancak' , 'erkansancak@tedu.edu.tr' , 05365654555 'Piano CLass' , 'B1', 'Sunday');
INSERT INTO Students values (33333, 'Metehan Tüter' , 'metehantuter@tedu.edu.tr' , 05384854854 'Piano Class' , 'B1', 'Sunday');
INSERT INTO Students values (44444, 'Ayça Güneş' , 'aycagunes@tedu.edu.tr' , 05379712606 'Guitar Class' , 'A1', 'Friday');
INSERT INTO Students values (44445, 'Savaş Yılmaz' , 'savasyilmaz@tedu.edu.tr' , 05370002356 'Drum Class','A2', 'Sunday',);

INSERT INTO Payment values (5000, 'Credit Card', 00000);
INSERT INTO Payment values (5000, 'Credit Card', 11111);
INSERT INTO Payment values (5000, 'Credit Card', 22222);
INSERT INTO Payment values (5000, 'Credit Card', 33333);
INSERT INTO Payment values (5000, 'Cash', 44444);
INSERT INTO Payment values (5000, 'Cash', 55555);
INSERT INTO Payment values (5000, 'Credit Card', 77777);
INSERT INTO Payment values (5000, 'Cash', 66666);
INSERT INTO Payment values (5000, 'Credit Card', 99999);
INSERT INTO Payment values (5000, 'Cash', 88888);



------------------- |View --- Update and Deletions --- Alter| ----------------------


CREATE VIEW ViewTutors as SELECT tutor_name , tutor_ID FROM Tutors;
	insert into ViewTutors select 'Antonio Salieri', 1825;
	

DELETE FROM Music_Company 
	WHERE company_phone = 05323655262;
	
DELETE FROM Music_Studios
	WHERE studio_name != 'Studio-5';
	
DELETE FROM Rooms 
	WHERE capacity between 30 and 50;
	
DELETE FROM Classes
	WHERE class_type = 'Guitar Class';
	
DELETE FROM Tutors
	WHERE tutor_name != 'Slash';
	
DELETE FROM Students 
	WHERE student_name != 'Barış Uğur';
	
DELETE FROM Payment
	WHERE payment_method = 'Credit Card';
	
DELETE FROM ViewTutors
	WHERE tutor_id = 1750 ;
	
update Music_Studios
	SET studio_phone = 05855612124
	WHERE studio_name = 'Studio-1';
	
UPDATE Rooms
	SET capacity = 30
	WHERE room_ID = 'B2';
	
UPDATE Classes
	SET class_time = 18.00
	WHERE class_day = 'Friday' and tutor_name = 'Slash';
	
UPDATE Tutors
	SET tutor_mail = 'bestpianis@outlook.com'
	WHERE tutor_name = 'Wolfgang Amadeus Mozart';
	
UPDATE Students 
	SET student_ID = 12121
	WHERE student_name = 'Metehan Tüter';
	
UPDATE Payment
	SET payment_method = 'Cash'
	WHERE student_ID = 22222;
	
UPDATE ViewTutors
	SET tutor_name = 'Kirk Hammett'
	WHERE tutor_ID = 1945;
		
	
ALTER TABLE Music_Studios DROP COLUMN studio_name;

--------------------------------------------------------------------------------------------------






















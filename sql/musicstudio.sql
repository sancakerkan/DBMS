CREATE TABLE public.course (
	course_id int4 NOT NULL,
	course_type varchar(20) NOT NULL,
	course_price int4 NOT NULL,
	CONSTRAINT course_pk PRIMARY KEY (course_id)
);

CREATE TABLE public.management (
	course_name varchar(20) NOT NULL,
	present_tutors int4 NOT NULL,
	revenue varchar(20) NOT NULL,
	CONSTRAINT management_pk PRIMARY KEY (course_name)
);

CREATE TABLE public.manages (
	studio_id int4 NOT NULL,
	course_name varchar(20) NOT NULL,
	CONSTRAINT manages_pk PRIMARY KEY (studio_id, course_name)
);

CREATE TABLE public.payment (
	reservation_id int4 NOT NULL,
	customer_id int4 NOT NULL,
	payment_method varchar(20) NOT NULL,
	total_payment int4 NOT NULL,
	CONSTRAINT payment_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT payment_fk_1 FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);

CREATE TABLE public.customer (
	customer_id int4 NOT NULL,
	customer_name varchar(20) NOT NULL,
	email_address varchar NOT NULL,
	phone_number int4 NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

CREATE TABLE public.reservation (
	reservation_id int4 NOT NULL,
	customer_id int4 NOT NULL,
	course_id int4 NOT NULL,
	course_type varchar(20) NOT NULL,
	hours int4 NOT NULL,
	CONSTRAINT reservation_pk PRIMARY KEY (reservation_id),
	CONSTRAINT reservation_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	CONSTRAINT reservation_fk_1 FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE public.studio (
	hotel_id int4 NOT NULL,
	phone_number int4 NOT NULL,
	email_address varchar NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT studio_pk PRIMARY KEY (studio_id)
);

CREATE TABLE public.contains (
	course_id int4 NOT NULL,
	studio_id int4 NOT NULL,
	CONSTRAINT contains_pk1 PRIMARY KEY (course_id, studio_id)
);


CREATE TABLE public.tutor (
	tutor_id int4 NOT NULL,
	tutor_name varchar(20) NOT NULL,
	course_name varchar(20) NOT NULL,
	CONSTRAINT studio_pk PRIMARY KEY (tutor_id),
	CONSTRAINT studio_fk FOREIGN KEY (studio_id) REFERENCES studio(studio_id),
	CONSTRAINT studio_fk1 FOREIGN KEY (course_name) REFERENCES management(course_name)
);


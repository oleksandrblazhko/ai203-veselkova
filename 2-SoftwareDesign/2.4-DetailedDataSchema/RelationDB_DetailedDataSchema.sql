/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */
drop table Users CASCADE CONSTRAINTS;
drop table Dancers CASCADE CONSTRAINTS;
drop table Choreographers CASCADE CONSTRAINTS;
drop table Datas CASCADE CONSTRAINTS;
drop table Orders CASCADE CONSTRAINTS;
drop table Recommendations CASCADE CONSTRAINTS;

CREATE TABLE Users ( -- опис співробітників
	user_id NUMBER(10), -- N співробітника
	surname VARCHAR(20), -- прізвище співробітника
	name VARCHAR(20), -- ім'я співробітника
	email_address NUMBER(4), -- N email адреси співробітника
);

-- обмеження первинного ключа
ALTER TABLE Users ADD CONSTRAINT us_pk
	PRIMARY KEY (user_id);
	
ALTER TABLE Users ADD CONSTRAINT us_email_address
    CHECK ( regexp_like(email_address, 
	           '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));

CREATE TABLE Dancers( -- опис користувача
	dancer_id NUMBER(10), -- N користувача
	age DATE, -- дата народження
	experience NUMBER(2), -- досвід (у роках) користувача
	desire NUMBER(2), -- побажання користувача
	user_id NUMBER(10), -- N користувача
    order_id NUMBER(10), -- N користувача
);

-- обмеження первинного ключа
ALTER TABLE Dancers ADD CONSTRAINT dan_pk
	PRIMARY KEY (dancer_id);
	
-- обмеження зовнішніх ключів
ALTER TABLE Dancers ADD CONSTRAINT dan_dancer_id_fk
	FOREIGN KEY (order_id )
	REFERENCES Orders (order_id );

ALTER TABLE Dancers ADD CONSTRAINT dan_dancer_id_fk
	FOREIGN KEY (user_id )
	REFERENCES Users(user_id );
	
CREATE TABLE Choreographers( -- опис користувача
	choreographer_id NUMBER(10), -- N користувача
	education VARCHAR(20), -- ступінь освіти
	work_experience NUMBER(2), -- досвід (у роках) користувача
	salary NUMBER(6,2), -- з/п користувача
	user_id NUMBER(10), -- N користувача
    recommendation_id VARCHAR(40), -- рекомендации користувача
    data_id VARCHAR(40), -- дані користувача
);

-- обмеження первинного ключа
ALTER TABLE Choreographers ADD CONSTRAINT сhor_pk
	PRIMARY KEY (choreographer_id);
	
-- обмеження зовнішніх ключів
ALTER TABLE Choreographers ADD CONSTRAINT сhor_choreographer_id_fk
	FOREIGN KEY (recommendation_id)
	REFERENCES Recommendations (recommendation_id);

ALTER TABLE Choreographers ADD CONSTRAINT сhor_choreographer_id_fk
	FOREIGN KEY (data_id)
	REFERENCES Datas (data_id);
	
ALTER TABLE Choreographers ADD CONSTRAINT сhor_choreographer_id_fk
	FOREIGN KEY (user_id )
	REFERENCES Users(user_id );
	
CREATE TABLE Datas( -- опис даних 
	data_id NUMBER(10), -- N користувача
	type_of_dance VARCHAR(20), -- тип танцев
	dancer_id NUMBER(10), -- N користувача
);

-- обмеження первинного ключа
ALTER TABLE Datas ADD CONSTRAINT data_pk
	PRIMARY KEY (data_id);
	
-- обмеження зовнішніх ключів
ALTER TABLE Datas ADD CONSTRAINT сhor_data_id_fk
	FOREIGN KEY (dancer_id)
	REFERENCES Dancers (dancer_id );
	
CREATE TABLE Orders( -- закази
	order_id NUMBER(10), -- N заказа
	wishes VARCHAR(20), -- коментарії танцев
	dancer_id NUMBER(10), -- N користувача
);

-- обмеження первинного ключа
ALTER TABLE Orders ADD CONSTRAINT ord_pk
	PRIMARY KEY (order_id);
	
-- обмеження зовнішніх ключів
ALTER TABLE Orders ADD CONSTRAINT ord_order_id_fk
	FOREIGN KEY (choreographer_id)
	REFERENCES Choreographers (choreographer_id);
	
CREATE TABLE Recommendations( -- закази
	recommendation_id NUMBER(10), -- N заказа
	meditation VARCHAR(20), -- рекомендація
	proper nutrition VARCHAR(20), -- рекомендація
	data_id NUMBER(10), -- N даних
);

-- обмеження первинного ключа
ALTER TABLE Recommendations ADD CONSTRAINT rec_pk
	PRIMARY KEY (recommendation_id);
	
-- обмеження зовнішніх ключів
ALTER TABLE Recommendations ADD CONSTRAINT rec_order_id_fk
	FOREIGN KEY (data_id)
	REFERENCES Datas (data_id);
/* Створення об'єктного типу (класу) Users */
CREATE OR REPLACE TYPE Users AS OBJECT (
    users_id NUMBER(4), -- N співробітника
	surname VARCHAR(20), -- прізвище співробітника
	name VARCHAR(20), -- ім'я співробітника
	email_address NUMBER(4), -- N email адреси співробітника
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Створення типу для зберігання списку співробітників - "Колекція екземплярів об`єктів класу Users */
CREATE TYPE Users_List IS TABLE OF Users;
/

/* Cтворення об'єктного типу (класу) Dancers, що успадковує об'єктний тип Users */
CREATE OR REPLACE TYPE Dancers UNDER Users (
   	dancer_id NUMBER(10), -- N користувача
	age DATE, -- дата народження
	experience NUMBER(2), -- досвід (у роках) користувача
	desire NUMBER(2), -- побажання користувача
	user_id NUMBER(10), -- N користувача
	/* перевизначення методу-процедури класу Users */
    	OVERRIDING MEMBER PROCEDURE display 
);
/

/* Створення об'єктного типу (клас) Datas */
-- DROP TYPE Datas FORCE;
CREATE OR REPLACE TYPE Datas AS OBJECT (
    data_id NUMBER(10), -- N користувача
	type_of_dance VARCHAR(20), -- тип танцев
	dancer_id NUMBER(10), -- N користувача
    	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_type_of_dance - типи танців
	   умова 1) якщо в таблиці Datas вже існує вказаний тип танців,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Datas створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Datas(p_type_of_dance VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_type_of_dance(p_data_id NUMBER, p_type_of_dance VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_data_id RETURN NUMBER,
		MEMBER FUNCTION get_type_of_dance RETURN DATE,
    	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/
-- show errors;

/* Створення об'єктного типу (класу) Recommendations */
CREATE OR REPLACE TYPE Recommendations AS OBJECT (
    	recommendation_id NUMBER(10), -- N заказа
	meditation VARCHAR(20), -- рекомендація
	proper nutrition VARCHAR(20), -- рекомендація
	data_id NUMBER(10), -- N даних
	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_meditation  - медитації
	   умова 1) якщо в таблиці Recommendations вже існує вказаний дослід,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Recommendations створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Recommendations(p_meditation VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_meditation(p_recommendation_id  NUMBER, p_meditation VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_recommendation_id RETURN NUMBER,
		MEMBER FUNCTION get_meditation RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Choreographers */
CREATE OR REPLACE TYPE Choreographers AS OBJECT (
    	choreographer_id NUMBER(10), -- N користувача
	education VARCHAR(20), -- ступінь освіти
	work_experience NUMBER(2), -- досвід (у роках) користувача
	salary NUMBER(6,2), -- з/п користувача
	user_id NUMBER(10), -- N користувача
    recommendation_id VARCHAR(40), -- рекомендации користувача
    data_id VARCHAR(40), -- дані користувача
	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_education  - образование 
	   умова 1) якщо в таблиці Choreographers вже існує вказаний дослід,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Choreographers створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Choreographers(p_education VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_education(p_choreographer_id NUMBER, p_education VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_choreographer_id RETURN NUMBER,
		MEMBER FUNCTION get_education RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Choreographers */
CREATE OR REPLACE TYPE Orders AS OBJECT (
    	order_id NUMBER(10), -- N заказа
	wishes VARCHAR(20), -- коментарії танцев
	dancer_id NUMBER(10), -- N користувача
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/



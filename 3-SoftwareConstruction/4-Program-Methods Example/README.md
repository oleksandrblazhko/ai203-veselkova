	/* Методи класу Datas */
	-- DROP TYPE Datas FORCE;
	CREATE OR REPLACE TYPE BODY Datas AS 
    /* конструктор екземплярів об'єктів класів.
    Вхідні параметри:
	   1) p_type_of_dance - типи танців
	   умова 1) якщо в таблиці Datas вже існує вказана дата,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Datas створюється новий рядок з одночасним
	   створюється екземпляр класу 
	  Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTION Datas(p_type_of_dance VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_data_id Datas.data_id%TYPE;
    BEGIN
        SELECT data_id INTO v_data_id
        FROM Datas
        WHERE 
            type_of_dance = p_type_of_dance;
        SELF.data_id := v_data_id;
        SELF.type_of_dance := p_type_of_dance;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Datas (type_of_dance)
            VALUES (p_type_of_dance)
        RETURNING data_id INTO v_data_id;
        SELF.data_id := v_data_id;
        SELF.type_of_dance := p_type_of_dance;
        RETURN;
    	END Datas;
    
    
        /* Процедура додавання значень атрибутів */
	      MEMBER PROCEDURE sendDatas(p_data_id NUMBER, p_type_of_dance VARCHAR)
	      IS
	      BEGIN
        UPDATE Datas SET type_of_dance = p_type_of_dance
		      WHERE data_id = p_data_id;
		      SELF.type_of_dance := p_type_of_dance;
	      END sendDatas;
    
        /* Функції отримання значень атрибутів */
	      /* get_data_id */
        MEMBER FUNCTION get_data_id
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.data_id;
        END get_data_id;
        
        /* get_type_of_dance */
        MEMBER FUNCTION get_type_of_dance
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.type_of_dance;
        END get_type_of_dance;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('data_id: ' || data_id;);
          dbms_output.put_line('type_of_dance: ' || type_of_dance);
          dbms_output.put_line('type_of_dance: ' || type_of_dance);
        END display;
	END; 
	/

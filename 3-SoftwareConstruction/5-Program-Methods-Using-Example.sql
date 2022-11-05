/* Приклади роботи з класом Datas */
DECLARE
   dt1 Datas;
BEGIN 
    dt1:= NEW Datas (3, HipHop , 3);
dbms_output.put_line('data_id: ' || data_id);
dbms_output.put_line('type_of_dance: ' || type_of_dance);
dbms_output.put_line('dancer_id: ' || dancer_id);
    dt1.display();
END;
/


/* Приклад роботи з класами Datas, Recommendations */
DECLARE 
    dt1 Datas;
    rec1 Recommendations;
BEGIN 
    dt1:= Datas(3, HipHop , 3);
    rec1:= Recommendations(Мотивація досягненням, Палеодиета, dt1);
    rec1.display();
END;
/

/* Приклад роботи з класами Datas, Recommendations, Choreographers */
DECLARE 
   dt1 Datas;
   rec1 Recommendations;
   chr1 Choreographers;
BEGIN
    dt1:= Datas (3, HipHop , 3);
    rec1:= Recommendations(1, Мотивація досягненням, Палеодиета, dt1);
    chr:= Choreographers(3, Вища освіта, 14, 12000, 2, rec1, dt1);
    chr1.display(); 
END;
/

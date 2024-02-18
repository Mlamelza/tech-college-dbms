/*Now let's create our student_query view, and then display the result set*/
DROP VIEW IF EXISTS student_query;
CREATE VIEW student_query AS
SELECT CONCAT(db_user_first_name, ' ', db_user_last_name) AS 'Student Name', db_location_name AS 'College', 
	db_campus_name AS 'Campus Location', db_department_name AS 'Degree Major'
    FROM location l JOIN campus c ON 
    l.db_location_id = c.db_location_id JOIN user u ON 
    u.db_campus_id = c.db_campus_id JOIN department d ON
    u.db_department_id = d.db_department_id
    ORDER BY db_location_name, db_campus_name;


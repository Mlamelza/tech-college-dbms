/*Now let's create our professor_query view, and then display the result set*/
DROP VIEW IF EXISTS professor_query;
CREATE VIEW professor_query AS
SELECT db_title_name AS 'Title', CONCAT(db_user_first_name, ' ', db_user_last_name) AS 'Student Name', 
	db_location_name AS 'College Location', db_campus_name AS 'Campus Location', 
    db_department_name AS 'Department' FROM user u JOIN  campus c ON
    u.db_campus_id = c.db_campus_id JOIN location l ON c.db_location_id = l.db_location_id
    JOIN title t ON u.db_title_id = t.db_title_id JOIN department d ON u.db_department_id = d.db_department_id
    WHERE t.db_title_id = 2 OR t.db_title_id = 3 OR t.db_title_id = 13 OR t.db_title_id = 14 
    ORDER by db_location_name, db_campus_name, db_user_last_name;

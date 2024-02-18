/*Now let's create our course_query view, and then display the result set*/
DROP VIEW IF EXISTS course_query;
CREATE VIEW course_query AS
SELECT db_location_name AS 'College Location', db_campus_name AS 'Campus Location', 
	db_department_abbreviation AS 'Department', CONCAT(db_user_first_name, ' ', db_user_last_name) AS Professor,
    db_course_name AS 'Course', db_course_number AS 'Course Number'
	FROM location l
	JOIN campus c ON l.db_location_id = c.db_location_id
    JOIN user u ON u.db_campus_id = c.db_campus_id
    JOIN department d ON d.db_department_id = u.db_department_id
    JOIN course cs ON cs.db_department_id = d.db_department_id
    WHERE (l.db_location_id = 3 AND db_title_id = 2) OR (l.db_location_id = 3 AND db_title_id = 3)
		OR (l.db_location_id = 3 AND db_title_id = 4) OR (l.db_location_id = 3 AND db_title_id = 13)
        OR (l.db_location_id = 3 AND db_title_id = 14)
		ORDER BY db_location_name, db_campus_name;


use college;
/*Now let's create our college_query view, and then display the result set*/
DROP VIEW IF EXISTS college_query;
CREATE VIEW college_query AS
SELECT db_location_name AS 'College Name', db_campus_name AS 'Campus Name'
FROM location l JOIN campus c ON l.db_location_id = c.db_location_id
WHERE l.db_location_id = 9
ORDER BY l.db_location_name, c.db_campus_name;

/*Now let's create our department_query view, and then display the result set*/
DROP VIEW IF EXISTS department_query;
CREATE VIEW department_query AS
SELECT db_department_name AS 'Academic Department'
FROM department
WHERE db_department_id <> 9 
AND db_department_id <> 10 
AND db_department_id <> 11
AND db_department_id <> 22
AND db_department_id <> 23
AND db_department_id <> 24;

INSERT INTO permission VALUES 
(1,'adminPrivilege', 'SELECT UPDATE INSERT DELETE DROP (ALL)'), 
(2,'teacherPrivilege ', 'SELECT UPDATE INSERT DELETE (CLASS INFO)'), 
(3,'studentPrivilege', 'SELECT UPDATE INSERT DELETE (STUDENT INFO)'), 
(4,'generalPrivilege', 'SELECT ONLY'), 
(5,'directorPrivilege', 'SELECT UPDATE INSERT DELETE (DEPARTMENT INFO)'), 
(6,'admissionsPrivilege', 'SELECT UPDATE INSERT DELETE (STUDENT RESTRICTED)'),
(7,'registrarPrivilege', 'SELECT UPDATE INSERT DELETE (STUDENT INFO)'), 
(8,'cabinetPrivilege', 'SELECT UPDATE INSERT DELETE (RESTRICTED)'), 
(9,'managerPrivilege', 'SELECT UPDATE INSERT DELETE (LOCATION RESTRICTED)');

SELECT * FROM permission WHERE db_permission_id = 1;
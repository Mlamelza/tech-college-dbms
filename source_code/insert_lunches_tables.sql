INSERT INTO departments VALUES 
(1,'Accounting', 'ACT'), 
(2,'Executive', 'EXE'), 
(3,'Marketing', 'MKT'), 
(4,'Personnel', 'PER'), 
(5,'Sales', 'SAL'), 
(6,'Shipping', 'SHP');

SELECT db_department_id AS 'Building ID', db_department_name AS 'Department Name', 
	db_department_abbreviation AS 'Department Code' FROM departments;
	
	
	INSERT INTO employees VALUES 
(201,'Susan', 'Brown', '2', '1998-06-01', '30.00', '3484', '201'), 
(202,'Jim', 'Kern', '5', '1999-08-16', '25.00', '8722', '201'), 
(203,'Martha', 'Woods', '6', '2009-02-02', '25.00', '7591', '201'), 
(204,'Ellen', 'Owens', '5', '2008-07-01', '15.00', '6830', '202'), 
(205,'Henry', 'Perkins', '5', '2006-03-01', '25.00', '5286', '202'), 
(206,'Carol', 'Rose', '1', '2010-10-10', '25.00', '5460', '202'),
(207,'Dan', 'Smith', '6', '2008-12-01', '25.00', '2259', '203'), 
(208,'Fred', 'Campbell', '6', '2008-04-01', '25.00', '1752', '203'), 
(209,'Paula', 'Jacobs', '3', '1999-03-17', '15.00', '3357', '201'), 
(210,'Nancy', 'Hoffman', '5', '2007-02-16', '25.00', '2974', '201');


INSERT INTO constants VALUES 
(1,'Citywide Uniforms', '1998-06-01', '200.00', 'Susan Brown');

INSERT INTO constants_2 VALUES 
(1,'1.00', '2.00');


INSERT INTO lunches VALUES 
(1,'2011-11-16', '201', '2011-10-13'),
(2,'2011-11-16', '207', '2011-10-13'),
(3,'2011-11-16', '203', '2011-10-13'),
(4,'2011-11-16', '204', '2011-10-13'),
(5,'2011-11-16', '202', '2011-10-13'),
(6,'2011-11-16', '210', '2011-10-13'),
(7,'2011-11-25', '201', '2011-10-14'),
(8,'2011-11-25', '208', '2011-10-14'),
(9,'2011-11-25', '204', '2011-10-14'),
(10,'2011-11-25', '207', '2011-10-18'),
(11,'2011-11-25', '205', '2011-10-21'),
(12,'2011-12-05', '201', '2011-10-21'),
(13,'2011-12-05', '210', '2011-10-21'),
(14,'2011-12-05', '205', '2011-10-24'),
(15,'2011-12-05', '203', '2011-10-24'),
(16,'2011-12-05', '208', '2011-10-24');


INSERT INTO suppliers VALUES 
(1,'Alice & Rays Restaurant', 'ARR'),
(2,'A Soup Place', 'ASP'),
(3,'Certified Beef Company', 'CBC'),
(4,'Frank Reeds Vegetables', 'FRV'),
(5,'Frank & Sons', 'FSN'),
(6,'Just Beverages', 'JBR'),
(7,'Jim Parkers Shop', 'JPS'),
(8,'Virginia Street Bakery', 'VSB');


INSERT INTO foods VALUES 
(1,'2', '1', 'Fresh Salad', '2.00', '.25', 'FS'),
(2,'2', '2', 'Soup of the Day', '1.50', '.25', 'SP'),
(3,'2', '3', 'Sandwich', '3.50', '.40', 'SW'),
(4,'3', '4', 'Grilled Steak', '6.00', '.70', 'GS'),
(5,'3', '5', 'Hamburger', '2.50', '.30', 'SW'),
(6,'4', '6', 'Broccoli', '1.00', '.05', 'BR'),
(7,'4', '7', 'French Fries', '1.50', '.25', 'FF'),
(8,'6', '8', 'Soda', '1.25', '.25', 'AS'),
(9,'6', '9', 'Coffee', '.85', '.15', 'VR'),
(10,'8', '10', 'Dessert', '3.00', '.50', 'AS');


INSERT INTO lunch_items VALUES 
(1,'1', '2', '1', '1'),
(2,'1', '2', '3', '2'),
(3,'1', '6', '9', '2'),
(4,'2', '2', '3', '2'),
(5,'2', '4', '7', '1'),
(6,'2', '6', '9', '2'),
(7,'2', '8', '8', '1'),
(8,'3', '2', '1', '1'),
(9,'3', '3', '4', '1'),
(10,'3', '4', '7', '1'),
(11,'3', '6', '9', '1'),
(12,'3', '6', '8', '1');


SELECT db_food_description AS 'Menu Item', CONCAT('$', db_food_price) AS 'Food Price', 
	db_lunch_date AS 'Date', db_lunch_items_quantity AS 'Quantity',
	CONCAT(db_employee_first_name, ' ', db_employee_last_name) AS 'Employee', 
    d.db_department_code AS 'Dept', db_supplier_name AS 'Supplier' FROM lunch_items li JOIN foods f ON
    li.db_food_id = f.db_food_id JOIN lunches l ON li.db_lunch_id = l.db_lunch_id
    JOIN employees e ON l.db_employee_id = e.db_employee_id JOIN departments d
    ON e.db_department_id = d.db_department_id JOIN suppliers s ON li.db_supplier_id =
    s.db_supplier_id ORDER BY e.db_employee_last_name;
	
/*Notice here that the "evaluation" and "rating" columns are added in the result set, not in the database table*/
SELECT db_employee_id AS employee_number, db_employee_phone_number AS extension,
	db_employee_last_name, 'EXCELLENT WORKER' AS evaluation, 10 AS rating FROM employees;






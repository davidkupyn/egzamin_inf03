CREATE DATABASE baza;

USE baza;

CREATE TABLE restaurant (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    city_address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
);

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    personal_id VARCHAR(11) NOT NULL,
);

CREATE TABLE restaurant_employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL PRIMARY KEY,
    employee_id INT NOT NULL PRIMARY KEY,
    role_id INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE reservation_table (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    restaurant_id INT,
    number_of_seats INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
)
CREATE TABLE reservation (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(12) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    reservation_table_id INT NOT NULL,
    reservation_date DATETIME NOT NULL,
    guests INT NOT NULL,
    FOREIGN KEY (reservation_table_id) REFERENCES reservation_table(id)
);
CREATE TABLE meal_type (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
);
CREATE TABLE meals (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    meal_type_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    base_price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (meal_type_id) REFERENCES meal_type(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);


-- wyświetlić wszystkie i rezerwacje jeśli istnieją
select * from reservation_table as rt
join restaurant as r on r.id = rt.restaurant_id
left join reservation as rsv on rsv.reservation_table_id = rt.id;
-- wyświetlić wszystkie stoliki, które nie mają rezerwacji
select * from reservation_table as rt
join restaurant as r on r.id = rt.restaurant_id
left join reservation as rsv on rsv.reservation_table_id = rt.id
where rsv.reservation_table_id is null;
-- wyświetlić stoliki, które mają rezerwację w danej restauracji
select * from reservation_table as rt
join restaurant as r on r.id = rt.restaurant_id
left join reservation as rsv on rsv.reservation_table_id = rt.id
where r.id = 1;
-- wyświetlić wszystkich pracowników oraz ich dane dot. stanowiska i zatrudnienia w restauracjach
select * from employee as e
join restaurant_employee as re on re.employee_id = e.id 
join roles as r on r.id = re.role_id
join restaurant as rs on rs.id = re.restaurant_id;
-- wyświetlić pracowników nigdzie nie zatrudnionych
select * from employee as e
left join restaurant_employee as re on e.id = re.employee_id
left join roles as r on r.id = re.role_id
left join restaurant as rs on rs.id = re.restaurant_id
where re.employee_id is null;
-- wyświetlić pracowników, którzy pracują w conajmniej 2 restauracjach
select * from employee as e
join restaurant_employee as re on re.employee_id = e.id
group by e.id
having count(re.restaurant_id) > 1;
-- cross join restauracji i pracowników
select * from restaurant as res
cross join employee as e;








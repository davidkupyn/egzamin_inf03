CREATE DATABASE baza;

USE baza;

CREATE TABLE restaurant (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    city_address VARCHAR(100) NOT NULL,
    zip_code VARCHAR(6) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    personal_id VARCHAR(11) NOT NULL,
    PRIMARY KEY (id),
);
CREATE TABLE restaurant_employee (
    restaurant_id INT NOT NULL,
    employee_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (restaurant_id, employee_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE reservation (
    id INT NOT NULL AUTO_INCREMENT,
    phone VARCHAR(12) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    restaurant_id INT NOT NULL,
    reservation_date DATETIME NOT NULL,
    guests INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);
CREATE TABLE meal_type (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE meals (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    meal_type_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (meal_type_id) REFERENCES meal_type(id)
);

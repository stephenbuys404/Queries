CREATE DATABASE employee;

CREATE TABLE details(
id int,
name varchar(50)
);

INSERT INTO details(id,name) VALUES (0,'SALLY');
INSERT INTO details(id,name) VALUES (1,'JOHN');

SELECT * FROM details;
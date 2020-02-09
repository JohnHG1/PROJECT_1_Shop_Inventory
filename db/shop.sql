DROP TABLE suppliers;
DROP TABLE products;
DROP TABLE stocks;


CREATE TABLE suppliers
(
  id SERIAL primary key,
  name varchar(255),
  contact varchar(255)
);

CREATE TABLE products
(
  id SERIAL primary key,
  name varchar(255),
  description text,
  supplier_id INT REFERENCES suppliers(id),
  cost INT,
  retail INT
);

CREATE TABLE stocks
(
  id SERIAL primary key,
  product_id INT REFERENCES products(id),
  quantity INT,
  colour varchar(255)
);

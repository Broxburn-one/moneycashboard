DROP TABLE  merchants;
DROP TABLE  items;
DROP TABLE  transactions;


CREATE TABLE merchants (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE items (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE transactions (
  id serial4 primary key,
  transaction_date  date,
  merchant_id int4 references merchants(id),
  item_id int4 references items(id),
  amount decimal(12,2)
);


INSERT INTO merchants(name) VALUES ('Waitrose');
INSERT INTO merchants(name) VALUES ('Tesco');
INSERT INTO merchants(name) VALUES ('Aldi');
INSERT INTO merchants(name) VALUES ('Argos');
INSERT INTO merchants(name) VALUES ('Amazon');


INSERT INTO items(name) VALUES ('Basic Food');  
INSERT INTO items(name) VALUES ('Luxury Food');
INSERT INTO items(name) VALUES ('Alcohol');
INSERT INTO items(name) VALUES ('Juice/Soft Drink/Milk');
INSERT INTO items(name) VALUES ('White Goods');
INSERT INTO items(name) VALUES ('Utilities');
INSERT INTO items(name) VALUES ('Transport');

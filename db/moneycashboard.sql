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

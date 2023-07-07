--Metadata Queries
--1.0
SELECT *FROM pg_catalog.pg_tables;
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE';

--2.0
select table_name, column_name, data_type
from information_schema.columns
where table_name in ('actor', 'address', 'category', 'city', 'country', 'customer', 'film', 'film_actor', 'film_category', 'inventory', 'language', 'payment', 'rental', 'staff', 'store')
order by table_name
group by column_type;


--3.0
SELECT table_schema, table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema NOT IN ('information_schema', 'pg_catalog')
ORDER BY table_schema, table_name;

--4.0
SELECT conname AS constraint_name, conrelid::regclass 
AS table_name, pg_get_constraintdef(oid) AS constraint_definition
FROM pg_constraint
WHERE conrelid::regclass::text NOT LIKE 'pg_%' 
AND conrelid::regclass::text NOT LIKE 'sql_%'
ORDER BY conname;

--5.0
Primary key-
A Primary Key is a column or set of columns in a table that uniquely identifies each row in that table. It must contain unique values and cannot be null. The primary key is used as a reference for other tables to establish relationships.
Foreign key-
A Foreign Key is a column or set of columns in a table that refers to the Primary Key of another table. It is used to establish a relationship between two tables. A foreign key ensures referential integrity, which means that the value of the foreign key must exist in the referenced table's Primary Key, or it will not be allowed.
Unique Constraint-
A Unique Constraint ensures that a column or set of columns in a table contains unique values. Unlike a Primary Key, a Unique Constraint allows null values.

--6.0
 
    t.relname AS table_name, 
    i.relname AS index_name, 
    pg_get_indexdef(i.oid) AS index_definition
FROM 
    pg_class t, 
    pg_class i, 
    pg_index ix
WHERE 
    t.oid = ix.indrelid AND
    i.oid = ix.indexrelid AND
    t.relkind = 'r'
ORDER BY 
    t.relname, 
    i.relname;

--7.0
Table Name: actor
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: address
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: category
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: city
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: country
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: customer
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: film
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: film_actor
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: film_category
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: film_text
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: inventory
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: language
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: payment
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of three foreign keys, but there are no partial dependencies.

Table Name: rental
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: staff
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: store
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

--8.0
Table ACTOR {
  ACTOR_ID SMALLINT PK
  FIRST_NAME VARCHAR(45) 
  LAST_NAME VARCHAR(45) 
  LAST_UPDATE TIMESTAMP 
}

Table FILM_ACTOR{
 ACTOR_ID NUMBER(22)  
 FILM_ID NUMBER(22) PK
 LAST_UPDATE TIMESTAMP
}
Table FILM {
  FILM_ID NUMBER(22) PK
  TITLE VARCHAR2(255) 
  DESCRIPTION TEXT
  RELEASE_YEAR VARCHAR2(4)
  LANGUAGE_ID NUMBER(22) // [foreign key]
  ORIGINAL_LANGUAGE_ID NUMBER(22) //[foreign key]
  RENTAL_DURATION NUMBER(22)
  RENTAL_RATE DECIMAL(4,2)
  LENGTH  NUMBER(22)
  REPLACEMENT_COST DECIMAL(5,2) 
  rRATING VARCHAR2(10)
  SPECIAL_FEATURES VARCHAR2(100)
  LAST_UPDATE TIMESTAMP 
}

Table CATEGORY {
 CATEGORY_ID TINYINT PK
 NAME VARCHAR(25) 
 LAST_UPDATE TIMESTAMP
}

Table FILM_CATEGORY{
 FILM_ID NUMBER(22) PK
 CATEGORY_ID NUMBER(22) PK
 LAST_UPDATE TIMESTAMP
}

Table INVENTORY{
 INVENTORY_ID NUMBER(22) PK
 FILM_ID NUMBER(22) 
 STORE_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table RENTAL{
 RENTAL_ID NUMBER(22) PK
 RENTAL_DATE TIMESTAMP
 INVENTORY_ID NUMBER(22)
 CUSTOMER_ID NUMBER(22)
 RETURN_DATE TIMESTAMP
 STAFF_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table CUSTOMER {
  CUSTOMER_ID SMALLINT  PK
  STORE_ID TINYINT 
  FIRST_NAME VARCHAR(45) 
  LAST_NAME VARCHAR(45) 
  EMAIL VARCHAR(50) 
  ADDRESS_ID SMALLINT
  ACTIVE BOOLEAN 
  CREATE_DATE DATETIME
  LAST_UPDATE TIMESTAMP
}

Table STORE{
 STORE_ID NUMBER(22) PK
 MANAGER_STAFF_ID NUMBER(22) 
 ADDRESS_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table ADDRESS {
  ADDRESS_ID SMALLINT PK
  ADDRESS VARCHAR(50)
  ADDRESS2 VARCHAR(50)
  DISTRICT VARCHAR(20)
  CITY_ID SMALLINT 
  POSTAL_CODE VARCHAR(10) 
  PHONE VARCHAR(20) 
  LAST_UPDATE TIMESTAMP
}


Table CITY {
 CITY_ID TINYINT  PK
 CITY VARCHAR(25) 
 COUNTRY_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table COUNTRY {
 COUNTRY_ID TINYINT PK
 COUNTRY VARCHAR(25) 
 LAST_UPDATE TIMESTAMP
}



Table LANGUAGE{
 LANGUAGE_ID NUMBER(22) PK
 NAME CHAR(20)
 LAST_UPDATE TIMESTAMP
}

Table STAFF{
 STAFF_ID NUMBER(22) PK
 FIRST_NAME VARCHAR2(45)
 LAST_NAME VARCHAR2(45)
 ADDRESS_ID NUMBER(22)
 PICTURE BOOLEAN
 EMAIL VARCHAR2(50)
 STORE_ID NUMBER(22)
 ACTIVE NUMBER(22)
 USERNAME VARCHAR2(16)
 PASSWORD VARCHAR2(40)
 LAST_UPDATE TIMESTAMP
}

Table PAYMENT{
 PAYMENT_ID NUMBER(22) PK
 CUSTOMER_ID NUMBER(22)
 STAFF_ID NUMBER(22)
 RENTAL_ID NUMBER(22)
 AMOUNT DECIMAL(5,2)
 PAYMENT_DATE TIMESTAMP
 LAST_UPDATE TIMESTAMP
}



Ref: FILM_ACTOR.ACTOR_ID > ACTOR.ACTOR_ID

Ref: FILM_ACTOR.FILM_ID > FILM.FILM_ID

Ref: FILM_CATEGORY.CATEGORY_ID > CATEGORY.CATEGORY_ID

Ref: FILM_CATEGORY.FILM_ID > FILM.FILM_ID

Ref: FILM.LANGUAGE_ID > LANGUAGE.LANGUAGE_ID

Ref: INVENTORY.FILM_ID > FILM.FILM_ID

Ref: INVENTORY.STORE_ID > STORE.STORE_ID

Ref: STORE.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: ADDRESS.CITY_ID > CITY.CITY_ID

Ref: CITY.COUNTRY_ID > COUNTRY.COUNTRY_ID

Ref: CUSTOMER.STORE_ID > STORE.STORE_ID

Ref: CUSTOMER.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: STAFF.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: RENTAL.CUSTOMER_ID > CUSTOMER.CUSTOMER_ID

Ref: PAYMENT.STAFF_ID > STAFF.STAFF_ID

Ref: RENTAL.STAFF_ID > STAFF.STAFF_ID

Ref: STORE.ADDRESS_ID > STAFF.ADDRESS_ID

Ref: STAFF.STORE_ID > STORE.STORE_ID

Ref: PAYMENT.CUSTOMER_ID > CUSTOMER.CUSTOMER_ID

Ref:PAYMENT.RENTAL_ID > RENTAL.RENTAL_ID

Ref:RENTAL.INVENTORY_ID > INVENTORY.INVENTORY_ID

// Ref: posts.user_id > users.id // many-to-one

// Ref: users.id < follows.following_user_id

// Ref: users.id < follows.followed_user_id

--9.0
SELECT 
    relname AS table_name, 
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables 
ORDER BY pg_total_relation_size(relid) DESC;










\


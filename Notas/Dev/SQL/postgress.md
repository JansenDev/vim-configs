# SQL

## acciones

- CREATE
- ALTER
- DROP

# Backup postgres

c:\Program files\postgresql\9.3\bin> pg_dump -h localhost -p 5432 -U postgres test > D:\backup.sql


# Ejecutar archivos sql en postgres

psql -U admin -d db_formulario -a -f sp_listar_email_for_send_security.fnc

# help commands in console


\? -> listar comando de postgres
\h create role  -> Muestra la documentacion del comando
\dg -> Muestra los usuarios y sus roles.

ENTRAR A LA CONSOLA DE POSTGRES
psql -U postgres -W
VER LOS COMANDOS \ DE POSTGRES
\?
LISTAR TODAS LAS BASES DE DATOS
\l
VER LAS TABLAS DE UNA BASE DE DATOS
\dt
CAMBIAR A OTRA BD
\c nombre_BD
DESCRIBIR UNA TABLA
\d nombre_tabla
VER TODOS LOS COMANDOS SQL
\h
VER COMO SE EJECTUA UN COMANDO SQL
\h nombre_de_la_funcion
CANCELAR TODO LO QUE HAY EN PANTALLA
Ctrl + C
VER LA VERSION DE POSTGRES INSTALADA, IMPORTANTE PONER EL ';'
SELECT version();
VOLVER A EJECUTAR LA FUNCION REALIADA ANTERIORMENTE
\g
INICIALIZAR EL CONTADOR DE TIEMPO PARA QUE LA CONSOLA TE DIGA EN CADA EJECUCION ¿CUANTO DEMORO EN EJECUTAR ESA FUNCION?
\timing
LIMPIAR PANTALLA DE LA CONSOLA PSQL
Ctrl + L


## Tipos de datos 

### Más utilizados

- interger -> int a 4-byte integer that has a range from -2,147,483,648 to 2,147,483,647.
- smallint ->  a 2-byte signed integer that has a range from -32,768 to 32,767.
- serial-> tipo autoincrementable

float(n): is a floating-point number whose precision is at least, n, up to a maximum of 8 bytes
real: is a 4-byte floating-point number
numeric or numeric(p,s): is a real number with p digits with s number after the decimal point. The numeric(p,s) is the exact number

- character varying(n) -> varchar(n)
- character(n)-> char(n)
- text -> cadenas de longitud ilimitada
- date 
- time
- timestamp
- interval

- boolean


####Array Type

CREATE TABLE sal_emp (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);

INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch"}, {"training", "presentation"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

#### JSON Type

CREATE TABLE json_table (
     	json_type JSON,
    	jsonb_type JSONB
);

INSERT INTO json_table
VALUES
('{"title": "Influence","genres": ["Marketing & Sales","Self-Help","Psychology"],"published": true}', '{"title": "Sleeping Beauties","genres": ["Fiction","Thriller","Horror"],"published": false}');


## Mas

### SELECT current_date
### SELECT current_time
### SELECT current_timestamp
### SELECT gen_random_uuid();
CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; // Necesario importart para usar
los uuid_generate_v1 ...
### SELECT uuid_generate_v1(), uuid_generate_v4(), uuid_nil();
### SELECT version();
### show server_version;

### Using the Character Types

CREATE TABLE test1 (a character(4));
INSERT INTO test1 VALUES ('ok');
SELECT a, char_length(a) FROM test1; -- (1)

  a   | char_length
------+-------------
 ok   |           2


## Mucho mas


Name	Aliases	Description
bigint	int8	signed eight-byte integer
bigserial	serial8	autoincrementing eight-byte integer
bit [ (n) ]	 	fixed-length bit string
bit varying [ (n) ]	varbit [ (n) ]	variable-length bit string
boolean	bool	logical Boolean (true/false)
box	 	rectangular box on a plane
bytea	 	binary data (“byte array”)
character [ (n) ]	char [ (n) ]	fixed-length character string
character varying [ (n) ]	varchar [ (n) ]	variable-length character string
cidr	 	IPv4 or IPv6 network address
circle	 	circle on a plane
date	 	calendar date (year, month, day)
double precision	float8	double precision floating-point number (8 bytes)
inet	 	IPv4 or IPv6 host address
integer	int, int4	signed four-byte integer
interval [ fields ] [ (p) ]	 	time span
json	 	textual JSON data
jsonb	 	binary JSON data, decomposed
line	 	infinite line on a plane
lseg	 	line segment on a plane
macaddr	 	MAC (Media Access Control) address
macaddr8	 	MAC (Media Access Control) address (EUI-64 format)
money	 	currency amount
numeric [ (p, s) ]	decimal [ (p, s) ]	exact numeric of selectable precision
path	 	geometric path on a plane
pg_lsn	 	PostgreSQL Log Sequence Number
point	 	geometric point on a plane
polygon	 	closed geometric path on a plane
real	float4	single precision floating-point number (4 bytes)
smallint	int2	signed two-byte integer
smallserial	serial2	autoincrementing two-byte integer
serial	serial4	autoincrementing four-byte integer
text	 	variable-length character string
time [ (p) ] [ without time zone ]	 	time of day (no time zone)
time [ (p) ] with time zone	timetz	time of day, including time zone
timestamp [ (p) ] [ without time zone ]	 	date and time (no time zone)
timestamp [ (p) ] with time zone	timestamptz	date and time, including time zone
tsquery	 	text search query
tsvector	 	text search document
txid_snapshot	 	user-level transaction ID snapshot
uuid	 	universally unique identifier
xml	 	XML data

##rename table

  ALTER TABLE table_name
      RENAME TO new_table_name;

## rename table column 

ALTER TABLE estacion
    RENAME COLUMN id TO id_estacion

# drop column in table

ALTER TABLE table_name
    DROP COLUMN column_name;

##
-- Create a temporary TIMESTAMP column
ALTER TABLE AB ADD COLUMN create_time_holder TIMESTAMP without time zone NULL;

-- Copy casted value over to the temporary column
UPDATE AB SET create_time_holder = create_time::TIMESTAMP;

-- Modify original column using the temporary column
ALTER TABLE AB ALTER COLUMN create_time TYPE TIMESTAMP without time zone USING create_time_holder;

-- Drop the temporary column (after examining altered column values)
ALTER TABLE AB DROP COLUMN create_time_holder;

## create a table 

create table if not exists tren (
    id_tren serial primary key,
    modelo varchar(50) not null,
    capacidad integer not null
    fecha_nacimiento timestamp
);


## create table with foreign key

create table orders (
    order_id serial,
    dish_name text,
    customer_id integer references customers (id)
);

## alter table to in a foreign key

alter table orders
    add constraint fk_orders_customers foreign key (customer_id) references customers (id);


# create role

CREATE ROLE usuario_nuevo;

## add permisos to role  LOGIN

ALTER ROLE usuario_nuevo WITH LOGIN;

## add permisos to role SUPERUSER 

ALTER ROLE usuario_nuevo WITH SUPERUSER;

## drop role

DROP ROLE usuario_consulta; 

# TABLE INHERINTS

CREATE TABLE If NOT EXISTS test1(
    id_test1 serial primary key
) INHERITS (table_pasajero);

# SAVE DATA IN FILE using copy

COPY test1 TO 'E:\backup.txt' DELIMITER ','	

# Insert data using copy

COPY copy_test FROM '/path/to/file/sample_data.csv' DELIMITER ',';

# Create a function

CREATE OR REPLACE FUNCTION example() returns INTEGER AS $$
DECLARE
	prueba INTEGER;
BEGIN
	select count(*) into prueba from tasks;
	RETURN  prueba;
EXCEPTION
	when undefined_table
	THEN RETURN NULL;
END;
$$ LANGUAGE plpgsql;
-- 
select example()

# Create a procedure

create or replace PROCEDURE proc(_par1 int, _par2 varchar)
LANGUAGE sql
as $$
insert into table_t values()
$$;


call proc(1, 'lol')


# create funcion and return a table with languaje sql

DROP FUNCTION IF EXISTS getalltasks();
CREATE OR REPLACE FUNCTION GetAllTasks() RETURNS SETOF  tasks
LANGUAGE SQL
IMMUTABLE
AS $$
	SELECT * FROM tasks;
$$;
select * FROM GetAllTasks();


# create funcion and return a table with languaje plpgsql

DROP FUNCTION IF EXISTS getalltasks();
CREATE OR REPLACE FUNCTION GetAllTasks() RETURNS  SETOF tasks
AS $$
begin
	return query SELECT * FROM tasks;
end
$$ LANGUAGE plpgSQL;
-- 
select * FROM GetAllTasks();

# QUERYS DINAMICAS
Sirve para pasar nombre de una COLUMNA o tabla COMO PARAMETRO EN UNA FUNCION para ser ejecutada
https://ourtechroom.com/fix/dynamic-column-tablename-in-sql-statement-postgresql-query/

```sql
EXECUTE 
  format('UPDATE public."order" SET %I = %L WHERE ticket_id = %L', type_column_p, state_p, ticket_id_p);
```

format | description
--- | --- 
%s |	S formats the value of the argument as a simple string.
%I |	I treat the value of the argument as a SQL identifier and double-quote it if necessary. 
%L |	L quotes the argument value as an SQL literal.



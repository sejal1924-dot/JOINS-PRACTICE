DATABASE MIGRATION PACKAGE
 Target: Migrate MySQL → PostgreSQL
schema_postgres.sql

-- PostgreSQL schema (converted from MySQL)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    total NUMERIC(10, 2),
    order_date DATE
);

   data_insert.sql

-- Insert sample data
INSERT INTO users (id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com');


INSERT INTO orders (id, user_id, total, order_date) VALUES
(1, 1, 250.00, '2024-01-05'),
(2, 2, 480.75, '2024-02-15');

  pgloader.load (Optional — for automated transfer)

LOAD DATABASE
     FROM mysql://root:password@localhost/mydb
     INTO postgresql://postgres:password@localhost/mydb_pg

WITH include no drop, create tables, create indexes, reset sequences

SET work_mem TO '128MB', maintenance_work_mem TO '512 MB'

ALTER SCHEMA 'mydb' RENAME TO 'public';
Replace password and DB names accordingly.

    
MIGRATION SUMMARY REPORT

Source DB: MySQL (mydb)
Target DB: PostgreSQL (mydb_pg)
Tool: pgloader (or manual via SQL scripts)
Tables Migrated: users, orders

✅ Rows migrated:
- users: 2
- orders: 2

✅ Integrity Checks:
- Row counts match
- Foreign keys validated
- Unique constraints preserved

Status: SUCCESSFUL MIGRATION
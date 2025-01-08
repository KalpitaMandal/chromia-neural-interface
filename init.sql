-- init.sql

-- Check if the database exists, and create it if it doesn't
DO
$$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'postchain') THEN
        CREATE DATABASE postchain
            WITH TEMPLATE template0
            LC_COLLATE 'C.UTF-8'
            LC_CTYPE 'C.UTF-8'
            ENCODING 'UTF-8';
    END IF;
END
$$;

-- Switch to the postchain database
\c postchain

-- Create the postchain role
CREATE USER postchain WITH PASSWORD 'postchain';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE postchain TO postchain;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postchain;

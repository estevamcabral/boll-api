DO $$
    DECLARE
        r RECORD;
    BEGIN
        FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'privateschema') LOOP
                EXECUTE 'DROP TABLE IF EXISTS privateSchema.' || quote_ident(r.tablename) || ' CASCADE';
            END LOOP;
    END $$;

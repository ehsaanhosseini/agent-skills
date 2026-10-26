-- Synthetic fixture. Refuse to write outside a deliberately named disposable DB.
BEGIN;
DO $$
BEGIN
  IF left(current_database(), length('skill_eval_')) <> 'skill_eval_' THEN
    RAISE EXCEPTION 'This fixture requires a disposable skill_eval_ database';
  END IF;
END
$$;

CREATE TABLE skill_eval_accounts (
  id integer PRIMARY KEY,
  balance integer NOT NULL CHECK (balance >= 0)
);
INSERT INTO skill_eval_accounts (id, balance) VALUES (1, 10), (2, 10);
COMMIT;

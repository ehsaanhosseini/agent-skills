-- Synthetic fixture. Refuse to write outside a deliberately named disposable DB.
BEGIN;
DO $$
BEGIN
  IF current_database() NOT LIKE 'skill_eval_%' THEN
    RAISE EXCEPTION 'This fixture requires a disposable skill_eval_ database';
  END IF;
END
$$;

CREATE TABLE skill_eval_recovery_markers (
  marker text PRIMARY KEY,
  created_at timestamptz NOT NULL DEFAULT clock_timestamp()
);
INSERT INTO skill_eval_recovery_markers (marker) VALUES ('A');
COMMIT;
-- Insert B after a verified base backup. Insert C after the selected recovery target.

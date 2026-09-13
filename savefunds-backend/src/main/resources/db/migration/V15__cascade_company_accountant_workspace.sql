ALTER TABLE financial_obligations
    DROP CONSTRAINT IF EXISTS financial_obligations_entreprise_id_fkey;

ALTER TABLE financial_obligations
    ADD CONSTRAINT financial_obligations_entreprise_id_fkey
    FOREIGN KEY (entreprise_id)
    REFERENCES entreprises(id)
    ON DELETE CASCADE;

ALTER TABLE accountant_notes
    DROP CONSTRAINT IF EXISTS accountant_notes_entreprise_id_fkey;

ALTER TABLE accountant_notes
    ADD CONSTRAINT accountant_notes_entreprise_id_fkey
    FOREIGN KEY (entreprise_id)
    REFERENCES entreprises(id)
    ON DELETE CASCADE;

ALTER TABLE validation_decisions
    DROP CONSTRAINT IF EXISTS validation_decisions_entreprise_id_fkey;

ALTER TABLE validation_decisions
    ADD CONSTRAINT validation_decisions_entreprise_id_fkey
    FOREIGN KEY (entreprise_id)
    REFERENCES entreprises(id)
    ON DELETE CASCADE;

ALTER TABLE accountant_client_accesses
    DROP CONSTRAINT IF EXISTS accountant_client_accesses_entreprise_id_fkey;

ALTER TABLE accountant_client_accesses
    ADD CONSTRAINT accountant_client_accesses_entreprise_id_fkey
    FOREIGN KEY (entreprise_id)
    REFERENCES entreprises(id)
    ON DELETE CASCADE;

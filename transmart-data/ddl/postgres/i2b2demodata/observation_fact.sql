--
-- Name: observation_fact; Type: TABLE; Schema: i2b2demodata; Owner: -
--
CREATE TABLE observation_fact (
    encounter_num numeric(38,0),
    patient_num numeric(38,0) NOT NULL,
    concept_cd character varying(50) NOT NULL,
    provider_id character varying(50) NOT NULL,
    start_date timestamp without time zone,
    modifier_cd character varying(100) NOT NULL,
    instance_num numeric(18,0),
    trial_visit_num numeric(38,0),
    valtype_cd character varying(50),
    tval_char character varying(255),
    nval_num numeric(18,5),
    valueflag_cd character varying(50),
    quantity_num numeric(18,5),
    units_cd character varying(50),
    end_date timestamp without time zone,
    location_cd character varying(50),
    observation_blob text,
    confidence_num numeric(18,5),
    update_date timestamp without time zone,
    download_date timestamp without time zone,
    import_date timestamp without time zone,
    sourcesystem_cd character varying(50),
    upload_id numeric(38,0),
    sample_cd character varying(200)
);

--
-- Name: observation_fact_pkey; Type: CONSTRAINT; Schema: i2b2demodata; Owner: -
--
ALTER TABLE ONLY observation_fact
    ADD CONSTRAINT observation_fact_pkey PRIMARY KEY (encounter_num, patient_num, concept_cd, provider_id, instance_num, modifier_cd, start_date);

--
-- Name: fact_modifier_patient; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX fact_modifier_patient ON observation_fact USING btree (modifier_cd, patient_num);

--
-- Name: idx_fact_patient_num; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX idx_fact_patient_num ON observation_fact USING btree (patient_num);

--
-- Name: idx_fact_trial_visit_num; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX idx_fact_trial_visit_num ON observation_fact USING btree (trial_visit_num);

--
-- Name: idx_fact_concept Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX idx_fact_concept ON observation_fact USING btree (concept_cd);

--
-- Name: idx_fact_cpe; Type: INDEX; Schema: i2b2demodata; Owner: -
--
CREATE INDEX idx_fact_cpe ON observation_fact USING btree (concept_cd, patient_num, encounter_num);

--
-- Name: observation_fact_trial_visit_fk; Type: FK CONSTRAINT; Schema: i2b2metadata; Owner: -
--
ALTER TABLE ONLY observation_fact
ADD CONSTRAINT observation_fact_trial_visit_fk FOREIGN KEY (trial_visit_num) REFERENCES trial_visit_dimension(trial_visit_num);

--
-- Name: tf_trg_encounter_num(); Type: FUNCTION; Schema: i2b2demodata; Owner: -
--
CREATE FUNCTION tf_trg_encounter_num() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
       if NEW.ENCOUNTER_NUM is null then
 select nextval('i2b2demodata.SEQ_ENCOUNTER_NUM') into NEW.ENCOUNTER_NUM ;
end if;
       RETURN NEW;
end;
$$;

--
-- Name: trg_encounter_num; Type: TRIGGER; Schema: i2b2demodata; Owner: -
--
CREATE TRIGGER trg_encounter_num BEFORE INSERT ON observation_fact FOR EACH ROW EXECUTE PROCEDURE tf_trg_encounter_num();

--
-- Name: seq_encounter_num; Type: SEQUENCE; Schema: i2b2demodata; Owner: -
--
CREATE SEQUENCE seq_encounter_num
    START WITH 49814595
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- add documentation
--
COMMENT ON TABLE i2b2demodata.observation_fact IS 'Primary key = encounter_num + patient_num + concept_cd + provider_id + instance_num + modifier_cd + start_date';

COMMENT ON COLUMN observation_fact.encounter_num IS 'Primary key. Refers to visit_dimension.';
COMMENT ON COLUMN observation_fact.patient_num IS 'Primary key. Refers to patient_dimension.';
COMMENT ON COLUMN observation_fact.concept_cd IS 'Primary key. Refers to concept_dimension.';
COMMENT ON COLUMN observation_fact.provider_id IS 'Primary key. Refers to provider_dimension.';
COMMENT ON COLUMN observation_fact.start_date IS 'Primary key. Starting date-time of the observation Default: 0001-01-01 00:00:00';
COMMENT ON COLUMN observation_fact.modifier_cd IS 'Primary key. Refers to modifier_dimension. Default: ‘@’. Highdim values: [TRANSMART:HIGHDIM:GENE EXPRESSION, TRANSMART:HIGHDIM:RNASEQ_TRANSCRIPT]';
COMMENT ON COLUMN observation_fact.instance_num IS 'Primary key. Default: 1.';

COMMENT ON COLUMN observation_fact.trial_visit_num IS 'Refers to the new trial_visit dimension. Is not part of the primary key to make the primary key of observation_fact identical with that used by i2b2.';
COMMENT ON COLUMN observation_fact.end_date IS 'The end date-time for the observation';

COMMENT ON COLUMN observation_fact.valtype_cd IS 'Either T for string values or N for numeric values.';
COMMENT ON COLUMN observation_fact.tval_char IS 'If valtype_cd is T, the observations text value. If valtype_cd is N a i2b2 supported value modifier [E = Equals, NE = Not equal, L = Less than, LE = Less than and Equal to, G = Greater than, GE = Greater than and Equal to]';
COMMENT ON COLUMN observation_fact.nval_num IS 'Used in conjunction with VALTYPE_CD = “N” to store a numerical value';

COMMENT ON COLUMN observation_fact.sourcesystem_cd IS 'Deprecated. Is currently being ignored';
COMMENT ON COLUMN observation_fact.sample_cd IS 'Deprecated, together with the sample_dimension table';
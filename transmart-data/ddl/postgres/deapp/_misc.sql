--
-- Name: de_gene_info_gene_info_id_seq; Type: SEQUENCE OWNED BY; Schema: deapp; Owner: -
--
ALTER SEQUENCE de_gene_info_gene_info_id_seq OWNED BY de_gene_info.gene_info_id;

--
-- Name: TABLE de_gpl_info; Type: COMMENT; Schema: deapp; Owner: -
--
COMMENT ON TABLE de_gpl_info IS 'Definition of GPL platforms';

--
-- Name: TABLE de_rnaseq_transcript_data; Type: COMMENT; Schema: deapp; Owner: -
--
COMMENT ON TABLE de_rnaseq_transcript_data IS 'Table holds rnaseq transcript level values.';

--
-- Name: TABLE de_subject_microarray_data; Type: COMMENT; Schema: deapp; Owner: -
--
COMMENT ON TABLE de_subject_microarray_data IS 'Table holds microarray data values.';

--
-- Name: TABLE de_subject_sample_mapping; Type: COMMENT; Schema: deapp; Owner: -
--
COMMENT ON TABLE de_subject_sample_mapping IS 'Table to store information about assays, which are associated with high dimensional observations. Assays are typically associated with a patient. There can be many assays per patient, which may be distinguished by sample code, tissue type, platform, etc.';

--
-- Name: metabolite_sub_pth_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE metabolite_sub_pth_id
    START WITH 1095
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: metabolite_sup_pth_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE metabolite_sup_pth_id
    START WITH 152
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: metabolomics_annot_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE metabolomics_annot_id
    START WITH 4479
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: seq_assay_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_assay_id
    START WITH 45741
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 20;

--
-- Name: seq_metabolomics_partition_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_metabolomics_partition_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: seq_mrna_partition_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_mrna_partition_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: seq_proteomics_partition_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_proteomics_partition_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: seq_rbm_partition_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_rbm_partition_id
    START WITH 29
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: seq_rna_partition_id; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE seq_rna_partition_id
    START WITH 107
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: tt; Type: SEQUENCE; Schema: deapp; Owner: -
--
CREATE SEQUENCE tt
    START WITH 241
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


# RNASeq

## Platform Upload

Your platform configuration file has to have the `rnaseq_annotation.params` name.
The content of the params file is the same as for other HD data types.

For format of the platform data file see [chromosomal_region.md](chromosomal_region.md).

## RNASeq Data Upload

Your must have a `rnaseq.params` file. For possible parameters see [hd-params.md](hd-params.md).

Below is the expected file format for RNASeq data input files.
First column always has to be region name. The rest of the columns are recognised by the name, not by position.
Replace `<sample_code>` with an actual sample code (e.g. `CACO2`) as provided in your [subject sample mapping](subject-sample-mapping.md).

| Column Name | Description |
--------------|--------------
| REGION_NAME | **(Mandatory)** The name of this region. Mostly a gene symbol (e.g. `WASH7P`). |
| `<sample_code>`.readcount | **(Mandatory)** Raw measurement value. |
| `<sample_code>`.normalizedreadcount | Normalized readcount (e.g. RPKM). |
| `<sample_code>`.zscore | Z-Score. |

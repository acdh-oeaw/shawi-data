# SHAWI Transcription Repository

This git repository hosts the transcription data of the project *The Shawi-type Arabic dialects (FWF P 33574)*.

PI: Stephan Procházka (University of Vienna)
National Cooperation Partner: Charly Mörth (Austrian Academy of Sciences)

## Status

**THIS IS PRELIMINARY DATA AND COPYRIGHTED MATERIAL!**

If you want to use any material in this repository please contact PI Stephan Procházka (University of Vienna).

This will change at the end of the project.

## Directory Structure

| Directory             | Content                    | Remarks                                                                                                                                                                                                                     |
| --------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `001_src`             | Original sources           | Source documents (e.g. raw transcriptions)                                                                                                                                                                                  |
| `080_scripts_generic` | Conversion Scripts         | mostly the ELAN2TEI conversion script (implemented in Python) which generates the initial TEI data prior to tokenization based on the ELAN transcription documents in [122_elan](122_elan)                                  |
| `082_scripts_xsl`     | XSLT scripts               | XSLT scripts                                                                                                                                                                                                                |
| `102_derived_TEI`     | generated TEI-XML          | This is where ELAN2TEI puts its output. **Re-running TEI2ELAN will overwrite all content in this directory, so do not do any manual changes here.** Dumps of the SHAWI Dictionary will (most probably) also placed in here. |
| `010_manannot`        | manually annotated TEI-XML | Tokenized TEI documents which are manually annotated.                                                                                                                                                                       |
| `802_tei_odd`         | TEI customization (ODD)    | This is the source of truth for the SHAWI Schema and the HTML documentation generated from it.                                                                                                                              |
| `302_annot_ske`       | NoSketch Engine Verticals  | The annotated documents                                                                                                                                                                                                     |
| `803_RNG-schematron`  | Schemas                    | derived from the ODD in `802_tei_odd`                                                                                                                                                                                       |
| `850_docs`            | Documentation              | Further data documentation, esp. the HTML documentation of the ODD                                                                                                                                                          |

The oXygen project `shawi.xpr` contains the configuration for various transformation scenarios.

The directories `css`, `html`, `js` and `xsl` are used by the TEI Enricher.

## Other data locations

* Master files of the **audio recordings** are stored on the project's network share at the University of Vienna
* the **metadata spreadsheet** is [hosted on Sharepoint](https://oeawacat.sharepoint.com/sites/ACDH-CH_p_ShawiTypeArabicDialects_Shawi/_layouts/15/Doc.aspx?sourcedoc={F01FF43B-2409-4E31-A5BF-653E0559B160}&file=SHAWI%20Recordings.xlsx&action=default&mobileredirect=true&cid=f7311564-c2b6-4b08-9a52-468547688408).
* The **SHAWI Dictionary** is curated in (BaseX Curation)[https://redmine.acdh.oeaw.ac.at/issues/11318].

## General Workflow

For more information refer to the [*SHAWI Data Processing and Curation* Document](https://oeawacat.sharepoint.com/:w:/r/sites/ACDH-CH_p_ShawiTypeArabicDialects_Shawi/_layouts/15/Doc.aspx?sourcedoc=%7B2C46C1F7-110E-4BB9-981D-A068086B9767%7D&file=Data_Curation_and_Processing_Handbook_Template.docx&action=default&mobileredirect=true&cid=17912ea5-8f1f-4b88-ba45-43b73373ecfd)

The following steps happen _before_ data is ingested into this repository:

* **fieldwork (recording audio etc.)** – The recordings so far cover only material collected in previous campaigns
* **collecting metadata:** – This is collected at curated in [the metadata spreadsheet].

Workflow steps reflected in the data in this repository:

* **Transcription and translation** – Curators segment the audio recordings into sensible sets of "utterances" and transcribe and translate them using [ELAN](https://archive.mpi.nl/tla/elan). When transcription has finished, the curator adds the ELAN document(s) to `122_elan` and pushes the changes to git.
* This push triggers the **[ELAN2TEI conversion workflow](elan2tei)** which takes all *.eaf files in `122_ELAN` and transforms them into standalone TEI documents, storing them under `102_derived_TEI`. Additionally, a TEI Corpus file is generated which includes corpus level metadata and controlled vocabularies.
* **Tokenization and Annotation** After transformation to TEI, curators tokenize and annotate the texts using the TEI\_enricher and store the results under ``010_manannot``.
* **Conversion to NoSke Verticals and deployment** TBD – we have several options to transform annotated TEI to NoSke Verticals, e.g. https://github.com/acdh-oeaw/tunico-data or https://github.com/acdh-oeaw/voice-file-maker/. Processing might be triggered by a git tag (?)


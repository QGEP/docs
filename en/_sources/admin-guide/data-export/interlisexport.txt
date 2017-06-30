.. _export-interlis:

Export INTERLIS Data
====================

This represents a guide on how to export data from QGEP to INTERLIS 2 Transfer Format (xtf).


General
^^^^^^^^^^^^^

INTERLIS Export can be done using the ili2pg tool from Eisenhut Informatik and a series of prepared SQL scripts. They will do the following:
* Translation Englisch – German / French (Classes / Attributes)
* Conversion of value list to / from numeric values (Integer)
* Restructuring of data from relational to object oriented modelling
* Conversion of OID (16 characters) to foreign keys TID (integer)

 .. figure:: images/interlisexport.jpg
 
Step by step
^^^^^^^^^^^^^

Tool
--------
Download the latest version of `ili2pg <http://eisenhutinformatik.ch/interlis/ili2pg>`_

 .. figure:: images/eisenhut.jpg

Generate ili2pg schema with data model
--------------------------------------

You need a valid INTERLIS 2 Transferdataset, the corresponding INTERLIS model

This example uses the Transferdataset transferdatensatz2015_d_mod.xtf and the VSA-DSS 2015 Modell file with all it's corresponding models.

We create a batch file for the import with ili2pg to create an ili2pg schema (named ``vsa_dss_2015_2_d``) in postgres *importdaten_VSA_DSS_2015_2_d_381.bat*

Adapt for your environment if necessary.

>>> java -jar ili2pg.jar --createEnumTxtCol --import --importTid --sqlEnableNull --createEnumTabs --createFk  --noSmartMapping --dbdatabase qgep --dbschema vsa_dss_2015_2_d --dbusr postgres --dbpwd sjib  --log importdaten_VSA_DSS_2015_2_d_361.log transferdatensatz2015_d_mod.xtf

.. attention:: Very important to have these parameters: 

>>>--importTid --sqlEnableNull --createEnumTabs --createFk  --noSmartMapping

You need to have the necessary model files (ili) in the same folder as the xtf.

* Units.ili
* Base.ili
* SIA405_Base.ili
* VSA_DSS_2015_2_d_20170602.ili (for Version 2015) –> corrected version relations 

(!! 29.5.2017 Beziehung Erhaltungsereignis.Ausfuehrende_Firma 0..* statt 0..1 (Fehlerkorrektur)
!! 2.6.2017 Beziehung Abwasserknoten_Hydr_GeometrieAssocRef -- {0..*} statt 0..1 (Fehlerkorrektur))


Add additional functions
------------------------

We then need a series of function for the schema transformation form the created ili2pg schema to the qgep schema

- *00_vsa_dss_2015_2_d_304_schema_generate.sql*  : Creates ili2pg empty export schema
- *01_vsa_dss_2015_2_d_304_tid_generate.sql*  : Function to generate new tid in baseclass and sia405_baseclass when obj_id exists
- *02_vsa_dss_2015_2_d_304_tid_lookup.sql*  : Function to look up tid – used in 060
- *021_vsa_dss_2015_2_d_304_create_seq_ili2td.sql*


 .. figure:: images/functions.png

Create model tables in export schema
-----------------------

- *03_vsa_dss_2015_2_d_304_schema.sql*   (version 2015)

This SQL statement creates the vsa_dss tabellen tables and all related model tables

- **sia405_baseclass**
- **sia405_symbolpos**
- **sia405_textpos**

and some metatables for ili2pg:

- **t_ili2db_attrname**: iliname - sqlname
- **t_ili2db_basket**
- **t_ili2db_classname**: iliname - sqlname
- **t_ili2db_dataset**
- **t_ili2db_import**
- **t_ili2db_import_basket**
- **t_ili2db_import_object**
- **t_ili2db_inheritance**
- **t_ili2db_model** : bezeichnungen
- **t_ili2db_settings**
- **t_ili2_db_trafo**: new from  ili2pg 3xx -> Daten abfüllen TO DO
- **t_ili2_db_seq**: new from ili2pg 3xx -> fehlt in 03 – neu 021_erzeugen und Daten abfüllen TO DO
- **t_key_object**: missing in script 03 -> create with 046 and add data


Add more functions and modify ili2pg schema
--------------------------------------------

- *042_vsa_dss_2015_2_d_304_insert_t_ili2db_attrname_metadata.sql*
- *043_vsa_dss_2015_2_d_304_t_ili2db_attrname_add_column_owner_for_ili2pg301.sql* : Only needed if column does not exist yet (old ili2pg versions)

 .. figure:: images/43.png

- *044_vsa_dss_2015_2_d_304_t_ili2db_classname_VSA_DSS_2015_2.sql* : insert VSA-DSS Model 2015 model classes
- *045_vsa_dss_2015_2_d_304_t_ili2db_model_VSA_DSS_2015_2.ili_metadata.sql* : insert VSA-DSS Model 2015 in metatable
- *046_vsa_dss_2015_2_d_304_t_key_object_insert_metadata.sql* to create t_key_object if table does not exist.

- *047_vsa_dss_2015_2_d_340_t_ili2db_inheritance_create.sql*
- *048_vsa_dss_2015_2_d_340_t_ili2db_trafo_metadata.sql*


Run the export queries for your datamodel
----------------------------------------------

- *051_vsa_dss_2015_2_d_304_interlisexport2.sql* for VSA-DSS 2015 export
- *kf_0511_geoAbwBW_li2cu.sql* : change from compoundcurve to linestring (ändert Geometrie type in Export schema (curve))
- *052a_vsa_dss_2015_2_d_304_interlisexport2.sql* : second part of data export

For SIA 405 Abwasser export 

- *051_sia_2015_2_d_304_interlisexport2.sql* for SIA405 2015 export
* etc.

But then the ili2pg schema needs to be created with SIA405 Abwasser model structure.


Export data from ili2pg schema to INTERLIS
---------------------------------------------

Nachfolgender Aufruf exportiert nach INTERLIS2 sia405abwasser (Version 2015)

>>> java -jar ili2pg.jar --trace --export --log export_arbon_small_sia405abwasser_2015_2_d.log --models SIA405_Abwasser_2015 --dbhost localhost --dbport 5432 --dbdatabase qgep --dbschema sia405abwasser --dbusr postgres --dbpwd yourpassword ab3.xtf

* --models <tag> bestimmt den Modellnamen – die zugehörigen Modelldateien müssen alle im gleichen Verzeichnis sein.
* --log <tag> kann frei gewählt werden – sinnvoll strukturiert zu benennen export_ & namedatensatz_ & modellversion(ili namen).log
* Adapt dbdatabase, dbschema, dbusr and dbpwd

Braucht folgende Modelldateien (lizenpflichtig, VSA oder sia Lizenz notwendig – kann durch Kauf der Norm SIA405 2016 oder VSA-DSS CD erworben werden):

- *units.ili*
- *base.ili*
- *sia405_base.ili*
- *SIA405_Abwasser_2015_2_d.ili*

Nachfolgender Aufruf exportiert nach INTERLIS2 sia405abwasser (Version 2014)

>>> java -jar ili2pg.jar --trace --export --log export_arbon_small_sia405abwasser_2014_2_d.log --models SIA405_Abwasser --dbhost localhost --dbport 5432 --dbdatabase qgep --dbschema sia405abwasser --dbusr postgres --dbpwd yourpassword ab3.xtf

Needed models: *units.ili, base.ili, sia405_base.ili, SIA405_Abwasser_2014_2_d.ili*


Fachprüfung mit VSA Checker (online)
-----------------------------------------

https://www.vsa.ch/fachbereiche-cc/siedlungsentwaesserung/wegleitung-gep-daten/gep-datachecker/ -> Link to login at infogrips



Open issues
---------------
* ..

 
Possible problems
-------------------
* compoundcurve to linestring needed
* 2D -> 3D coordinates

 
 


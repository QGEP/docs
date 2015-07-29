Database initialization
=======================

* Install pgAdminIII

You will need a desktop to access the database server. PgAdminIII is a good
tool to access the database server.

Process
-------

In pgAdminIII

* Connect to the database server

* Create a new login role (preferred name "qgep", but you are free to choose)

* Create a new database (preferred name "qgep", but you are free to choose)

  * Change to this database

* Create a new schema (preferred name "qgep", but you are free to choose)

* Open an SQL Window and create the extensions (if not yet done)

  * ``CREATE EXTENSION hstore;``

  * ``CREATE EXTENSION postgis;``

* Download demo data

  * http://qgis.vitu.ch/qgep_demodata/qgep.backup

* Right click the `qgep` schema

  * Click restore

  * Load your download of backup_20140827.backup

  * Restore Options #2: Activate "Clean before restore"

  * Click "Restore"

  * Click "Cancel"

* Right click the database and click "Refresh"

* Update privileges for the database

  * Right click the `qgep` schema

  * Click "Grant Wizard …"

  * Selection, click "Check All"

  * Privileges
    * Group "qgep"
    * Choose "ALL"

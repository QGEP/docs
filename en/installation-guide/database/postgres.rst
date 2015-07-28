*********************
Setup database server
*********************

.. role:: sql(code)
   :language: sql

------------------
Install pgAdminIII
------------------

* Install PostgreSQL (>=9.3)

  * `Windows download page <http://www.postgresql.org/download/windows>`_

* Install PostGIS (>=2.1)

* Install pgAdminIII

-------------------------------------
Configure the system for the database
-------------------------------------

The project file uses a service configuration to be system independent. This service has first to be defined on your system. If you have the database on a seperate system, these instructions are for the system where QGIS is running.

These instructions depend on your operating system.

**Windows**

Create a new directory where you want to store the configuration in. (E.g. a new folder `pgconfig` in your home folder). This directory will be referred to as `PGSYSCONFDIR` in this guide.

Set the environment variable `PGSYSCONFDIR` to the path to `PGSYSCONFDIR`.

Create a file `pg_service.conf` in `PGSYSCONFDIR`.
You may have to adapt the variables for your setup.
 
.. code:: ini

    [pg_qgep]
    host=localhost
    port=5432
    dbname=qgep
    user=qgep

To save the password as well on the system you may use the file `pgpass <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_.

------------------
Setup the database
------------------

In pgAdminIII

* Connect to the database server

* Create a new login role (preferred name "qgep", but you are free to choose)

* Create a new database (preferred name "qgep", but you are free to choose)

  * Change to this database

* Create a new schema (preferred name "qgep", but you are free to choose)

* Open an SQL Window and create the extensions (if not yet done)

  * :sql:`CREATE EXTENSION hstore;`

  * :sql:`CREATE EXTENSION postgis;`

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
    * Click "Add/Change"
    * Click "OK"
    * Click "Done"

  * Right click the `qgep` schema

    * Click "Properties …"

    * Privileges
      * Role/Group "qgep"
      * Choose "ALL"
      * Click "Add/Change"
      * Click "OK"

* Open an SQL window and refresh the materialized views for network tracking

  * :sql:`REFRESH MATERIALIZED VIEW qgep.vw_network_node`;

  * :sql:`REFRESH MATERIALIZED VIEW qgep.vw_network_segment`;

------------
Install QGIS
------------

* Minimum requirement 2.10

-------------------
Install QGEP plugin
-------------------

* Open QGIS

* Go to Plugins

  * Manage and Install Plugins

  * Settings

    * Add...

      * Name: QGEP

      * URL: `http://qgis.vitu.ch/plugins/plugins.xml`

    * Enable `Show also experimental plugins`

  * All

    * Search `QGEP`

    * Click the checkbox next to it

------------------------
Install the demo project
------------------------

* Download http://qgis.vitu.ch/qgep_demodata/project_20140829.zip

* Extract the file

* Open `qgep_en.qgs` with QGIS

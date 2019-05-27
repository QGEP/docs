.. _database-initialization:

Database initialization
=======================

You can use :ref:`pgAdmin` to access and manage the database server.

.. note::

 By clicking the link you can learn how to :ref:`install-pgAdmin`

Process
-------

In pgAdmin4

* Connect to the database server

* Create a new group role (preferably named `qgep`, but you are free to choose)

* Create a new login role (`qgepuser` for example) and make it a member of the `qgep` group

You can do this graphically or by simply opening a pgAdminIII :ref:`SQL-query` window and type the following:

::

 CREATE GROUP qgep;
 CREATE ROLE qgepuser LOGIN;
 GRANT qgep TO qgepuser;

* Create a new database with UTF8 encoding. For restoring demo datamodel, the database has to be named `qgep-prod`.

  * Change to this database

* Open an :ref:`SQL-query` Window and create the extensions (if they're not created yet)

  * ``CREATE EXTENSION hstore;``

  * ``CREATE EXTENSION postgis;``

.. _restore-demomodel:

Restore demo datamodel
^^^^^^^^^^^^^^^^^^^^^^

Restore the latest data model that also includes demo data:

* Download demo data
  * https://github.com/QGEP/datamodel/releases/latest
  * download `qgep_vx.y.z_structure_and_demo_data.backup`

* Back in pgAdmin, right click the `qgep-prod` database

  * Click `Restore`

  * Load your download of qgep_vx.y.z_structure_and_demo_data.backup


  .. figure:: images/demodata-restore.jpg

  * Check the `Restore Options` Tab

  .. figure:: images/demodata-restore_options.jpg

  * Click `Restore`
  
  * Check whether in Message window `Restoring backup on the server` is successfully completed.
  
  .. note:
  
    If the the Restore is failed and the Detail reads something like
  "pg_restore: [archiver] unsupported version (1.13) in file header"
  or in German "pg_restore: [Archivierer] nicht unterstützte Version (1.13) im Dateikopf"
  try updating your PostgreSQL, see https://stackoverflow.com/questions/49064209/getting-archiver-unsupported-version-1-13-in-file-header-when-running-pg-r

  * Close the Restoring-Window

* Right click the database and click `Refresh`

.. figure:: images/pgadmin_qgep_refresh.jpg

* Propably you want to rename the database: Right click the database and click `Properties...` and rename the database.

There are 4 schemas (qgep_od, qgep_sys, qgep_vl, qgep_import)

* Update privileges for the qgep_od, qgep_sys and qgep_vl schema

  * Right click the `qgep_od` schema

  * Properties... -> Security Tab -> Privileges `+`Button (Add new row) > as `Grantee` choose ``qgep``, `Privileges` click ``USAGE``. Then Click `Save`

  * Right click again, choose `Grant Wizard …`

  * In Step 1 of 3: Click the Box to the left of `Object Type` to select all objects, click `Next`

  * In Step 2 of 3: `+`Button (Add new row) > as `Grantee` choose ``qgep``, `Privileges` click ``ALL``, click `Next`
  
  * In Step 3 of 3: click `Finish`

    
  * Right click the `qgep_sys` schema and the `qgep_vl` schema and repeat the steps described above for the qgep_od-schema
  
* You can update the privileges easier as a query: 
  
  ::
  
     GRANT USAGE ON SCHEMA qgep_od TO GROUP qgep;
     GRANT USAGE ON SCHEMA qgep_sys TO GROUP qgep;
     GRANT USAGE ON SCHEMA qgep_vl TO GROUP qgep;
     GRANT ALL ON schema qgep_od TO postgres;
     GRANT ALL ON schema qgep_sys TO postgres;
     GRANT ALL ON schema qgep_vl TO postgres;


Empty data model
^^^^^^^^^^^^^^^^

You also have the option to restore the latest empty data model (no demo data).

* Download the data model by going to https://github.com/QGEP/datamodel/releases/latest
  and by downloading the latest `qgep_vx.y.z_structure_with_value_lists.sql`.

* In order to restore (replace x.y.z with your version):: 

   psql -U postgres -h localhost -p 5432 -d qgep-prod -W -f qgep_vx.y.z_structure_with_value_lists.sql


Generate the data model under Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can also generate the data model under Linux.

* Download the data model::

   git clone https://github.com/QGEP/datamodel
   cd datamodel

* Setup the ``pg_service.conf`` file and add the ``pg_qgep`` service
  as in the :ref:`pg_service-linux` section.

* Create the database::

   psql -U postgres -c 'CREATE DATABASE qgep;'

* Run the generation script::

   ./scripts/db_setup.sh

If you want to use a different SRID you need to use the ``-s`` option.
For instance, run ``./scripts/db_setup.sh -s 2056`` for the **2056** SRID.

If you already have a data model and you want to force the regeneration
of the model you can also use the ``-f`` option: ``./scripts/db_setup.sh -f``.

You can use the ``-r`` option to add roles (``qgep_viewer``, ``qgep_user``, ``qgep_manager``, ``qgep_sysadmin``).

- Viewer: Can consult tables and views.
- User: Can edit data.
- Manager: Can edit data and value lists.
- Admin: Database administrator.

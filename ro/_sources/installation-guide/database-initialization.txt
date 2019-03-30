.. _database-initialization:

Database initialization
=======================

You can use :ref:`pgAdmin` to access and manage the database server.

.. note::

 By clicking the link you can learn how to :ref:`install-pgAdmin`

Process
-------

In pgAdminIII

* Connect to the database server

* Create a new group role (preferably named `qgep`, but you are free to choose)

* Create a new login role (`qgepuser` for example) and make it a member of the `qgep` group

You can do this graphically or by simply opening a pgAdminIII :ref:`SQL-query` window and type the following:

::

 CREATE GROUP qgep;
 CREATE ROLE qgepuser LOGIN;
 GRANT qgep TO qgepuser;

* Create a new database (preferably named `qgep`, but you are free to choose)

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


* Right click the `qgep` schema

  * Click `Restore`

  * Load your download of qgep_demodata.backup

  .. figure:: images/qgep_restore.jpg

  * Restore Options #2: Activate `Clean before restore`

  .. figure:: images/qgep_restore_options2.jpg

  * Click `Restore`

  .. figure:: images/qgep_restore_messages.jpg
  
  * Check whether in Message window last line is Exit Code 0

  * Click `Cancel`

* Right click the database and click `Refresh`

.. figure:: images/pgadmin_qgep_refresh.jpg

There are 4 schemas (qgep_od, qgep_sys, qgep_vl, qgep_import)

* Update privileges for the qgep_od, qgep_sys and qgep_vl schema

  * Right click the `qgep_od` schema

  * Properties -> Privileges Tab > Grant ``USAGE`` to group ``qgep``.

  * Click `Grant Wizard …`

  * Selection, click `Check All`

  * Privileges

    * Group `qgep`

    * Choose `ALL`
    
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

* In order to restore you can follow the steps from :ref:`restore-demomodel`,
  using the template data model instead of the demo data one.

Generate the data model
^^^^^^^^^^^^^^^^^^^^^^^

You can also generate the data model under Linux.

* Download the data model::

   git clone https://github.com/QGEP/datamodel
   cd datamodel && git submodule init && git submodule update

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

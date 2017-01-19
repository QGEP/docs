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

* Create a new schema with the name `qgep`

* Open an :ref:`SQL-query` Window and create the extensions (if they're not created yet)

  * ``CREATE EXTENSION hstore;``

  * ``CREATE EXTENSION postgis;``

.. _restore-demomodel:

Restore demo datamodel
^^^^^^^^^^^^^^^^^^^^^^

Restore the latest data model that also includes demo data:

* Download demo data

  * https://github.com/QGEP/data/raw/demodata/qgep_demodata.backup

* Right click the `qgep` schema

  * Click `Restore`

  * Load your download of qgep.backup

  .. figure:: images/qgep_restore.jpg

  * Restore Options #2: Activate `Clean before restore`

  .. figure:: images/qgep_restore_options2.jpg

  * Click `Restore`

  .. figure:: images/qgep_restore_messages.jpg
  
  * Check whether in Message window last line is Exit Code 0

  * Click `Cancel`

* Right click the database and click `Refresh`

.. figure:: images/pgadmin_qgep_refresh.jpg

* Update privileges for the database

  * Right click the `qgep` schema

  * Properties -> Privileges Tab > Grant ``USAGE`` to group ``qgep``.
    You can also do this as a query: ``GRANT USAGE ON SCHEMA qgep TO GROUP qgep;``

  * Click `Grant Wizard …`

  * Selection, click `Check All`

  * Privileges

    * Group `qgep`

    * Choose `ALL`

Empty data model
^^^^^^^^^^^^^^^^

You also have the option to restore the latest empty data model (no demo data).

* Download the data model by going to https://github.com/QGEP/datamodel/releases
  and by downloading the latest `template_db.dump`.

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

   ./scripts/dbsetup.sh

If you want to use a different SRID you need to use the ``-s`` option.
For instance, run ``./scripts/dbsetup.sh -s 2056`` for the **2056** SRID.

If you already have a data model and you want to force the regeneration
of the model you can also use the ``-f`` option: ``./scripts/db_setup.sh -f``.


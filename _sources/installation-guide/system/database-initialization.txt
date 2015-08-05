Database initialization
=======================

You can use :ref:`pgAdmin` to access and manage the database server.

.. note::

 By clicking the link you can learn how to :ref:`install pgAdmin`

Process
-------

In pgAdminIII

* Connect to the database server

* Create a new group role (preferably named `qgep`, but you are free to choose)

* Create a new login role (`qgepuser` for example) and make it a member of the `qgep` group

You can do this graphically or by simply opening a pgAdminIII :ref:`SQL query` window and type the following:

::

 CREATE GROUP qgep;
 CREATE ROLE qgepuser LOGIN;
 GRANT qgep TO qgepuser;

* Create a new database (preferably named `qgep`, but you are free to choose)

  * Change to this database

* Create a new schema with the name `qgep`

* Open an :ref:`SQL query` Window and create the extensions (if they're not created yet)

  * ``CREATE EXTENSION hstore;``

  * ``CREATE EXTENSION postgis;``

* Download demo data

  * http://qgis.vitu.ch/qgep_demodata/qgep.backup

* Right click the `qgep` schema

  * Click restore

  * Load your download of qgep.backup

  * Restore Options #2: Activate `Clean before restore`

  * Click `Restore`

  * Click `Cancel`

* Right click the database and click `Refresh`

* Update privileges for the database

  * Right click the `qgep` schema

  * Click `Grant Wizard …`

  * Selection, click `Check All`

  * Privileges

    * Group `qgep`

    * Choose `ALL`

.. database-initialization::

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

  * https://github.com/QGEP/data/raw/demodata/qgep_demodata.backup

* Right click the `qgep` schema

  * Click `Restore`

  * Load your download of qgep.backup

  .. figure:: images/qgep_restore.jpg

  * Restore Options #2: Activate `Clean before restore`

  .. figure:: images/qgep_restore_options2.jpg

  * Click `Restore`

  .. figure:: images/qgep_restore_messages.jpg

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

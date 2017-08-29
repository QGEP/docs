Setup workstation
=================

Database configuration
----------------------

To tell a workstation, where the database is (on the local system or on a
network server) you will have to create some files initially on every device on
which you will have QGIS/QGEP running. It is not required to do that on the
server itself.

These instructions depend on your operating system.

Windows pg_service
^^^^^^^^^^^^^^^^^^

Create a new directory where you want to store the configuration in. (E.g. a new folder ``pgconfig`` in your home folder). This directory will be referred to as ``PGSYSCONFDIR`` in this guide.

Set the environment variable ``PGSYSCONFDIR`` to the path to ``PGSYSCONFDIR``.

Inside this folder, there will be two files

* ``pg_service.conf``
* ``pgpass`` (If you do not want to enter the password for the db every time)

.. attention::

 On Windows, you need to save ``pg_service.conf`` in Unix format in order to work.
 One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
 and ``Edit --> EOL Conversion --> UNIX Format --> File save`` .
  
.. _pg_service-linux:

Linux pg_service
^^^^^^^^^^^^^^^^

On *nix systems (linux/macOS etc.) you may put the files ``.pg_service.conf``
and ``.pgpass`` into your home folder (normally ``/home/[username]``).

All systems
^^^^^^^^^^^

Put the following content in the file ``pg_service.conf`` or ``.pg_service.conf``.
You may have to adapt the variables for your setup.

.. code:: ini

    [pg_qgep]
    host=localhost
    port=5432
    dbname=qgep
    user=qgepuser

To save the password as well on the system you may use the file `pgpass <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_.

.. code:: ini

    localhost:5432:*:qgepuser:password

.. note:: If you don't have the database on your local machine replace any
   occurence of ``localhost`` with the network address of your database
   server.

Install QGIS
------------

* Minimum requirement 2.14

* We recommend using the latest master build (called qgis-dev on Windows)
  which often offers a better experience in combination with QGEP.
  For Windows installation, download the `OSGeo4W Installer <http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe>`_
  choose *advanced installation* and install qgis-dev.

Install QGEP plugin
-------------------

Plugin requirements:

- networkx
- Qt 4 PostgreSQL database driver

You can install them on debian based systems with::

 sudo pip install networkx
 sudo apt-get install libqt4-sql-psql

* Open QGIS

* Go to Plugins

  * Manage and Install Plugins

  * Settings

    * Add...

      * Name: QGEP

      * URL:
        ``https://raw.githubusercontent.com/QGEP/repository/master/plugins.xml``

    * Enable `Show also experimental plugins`

  * Activate the plugin (see image below):

  * All

    * Search `QGEP`

    * Click the checkbox next to it

.. figure:: images/001_searchplugin.jpeg

   **Add the QGEP plugin**

Install the demo project
------------------------

* Download https://github.com/QGEP/data/archive/demodata.zip

* Extract the file

* Restore the file `qgep_demodata.backup` with pgAdminIII

* Open `project/qgep_en.qgs` with QGIS

Working with more than one database
-----------------------------------

* Create a new database in pgAdmin III with a new name, e.g. communityA

* Create a new schema qgep in this database (do not choose an other name, because all scripts works with the schema-name qgep)

* Go further on as descript in 1.2 Database initialization

* Change the ``pg_service.conf`` - file 
.. code:: ini

  [pg_qgep]    
  host=localhost    
  port=5432    
  dbname=qgep    
  user=qgepuser
  [pg_communityA]    
  host=localhost      
  port=5432      
  dbname=communityA      
  user=qgepuser
  
* Search and replace in the copy of ``qgep_en.qgs`` all 'pg_qgep' with 'pg_communityA'


Add your own OID in the project
-----------------------------------

You have to add your OID data in the table is_oid_prefixes:

https://github.com/QGEP/datamodel/blob/master/02_oid_generation.sql

-- sample entry for the City of Uster - you need to adapt this entry later for your own organization
INSERT INTO qgep.is_oid_prefixes (prefix,organization,active) VALUES ('00000000','Invalid',TRUE);
INSERT INTO qgep.is_oid_prefixes (prefix,organization,active) VALUES ('ch11h8mw','Stadt Uster',FALSE);
INSERT INTO qgep.is_oid_prefixes (prefix,organization,active) VALUES ('ch15z36d','SIGE',FALSE);
INSERT INTO qgep.is_oid_prefixes (prefix,organization,active) VALUES ('ch13p7mz','Arbon',FALSE);
and set the OID you want to use in your project to TRUE.

Edit 02_oid_generation.sql with your OID if you want it permanently in the QGEP project and hand in a pull request or add it locally to your project with an INSERT statement.

OID prefixes have to be ordered at http://www.interlis.ch/oid/oid_commande_e.php

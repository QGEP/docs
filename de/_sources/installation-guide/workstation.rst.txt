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

.. note:: Search for environment variable in your windows system settings, then click one of the following options, for either a user or a system variable:

    Click ``New`` to add a new variable name and value.
    Click an existing variable, and then click ``Edit`` to change its name or value.
    Click an existing variable, and then click ``Delete`` to remove it.

  .. figure:: images/umgebungsvariablen_pgconfdir.jpg

  You can check your environment variables also within QGIS: Menu ``Settings`` --> ``Options...`` --> ``System`` Tab  --> ``Environment``

Inside this folder, there will be two files

* ``pg_service.conf``
* ``pgpass`` (If you do not want to enter the password for the db every time)

.. attention::

 On Windows, you need to save ``pg_service.conf`` in Unix format in order to work.
 One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
 and ``Edit`` --> ``EOL Conversion`` --> ``UNIX Format`` --> ``File save`` .

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

* Minimum requirement 3.4

* We recommend using the latest master build (called qgis-dev on Windows)
  which often offers a better experience in combination with QGEP.
  For Windows installation, download the `OSGeo4W Installer <http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe>`_
  choose *advanced installation* and install qgis-dev.

Install QGEP plugin
-------------------

Plugin requirements:

- networkx >= 2.1

You can install them on debian based systems with::

 sudo pip install networkx
 sudo apt-get install libqt4-sql-psql

* Open QGIS

* Go to ``Plugins``

  * ``Manage and Install Plugins``

  * ``Settings``

    * Enable ``Show also experimental plugins``

  * Activate the plugin (see image below):

  * All

    * Search `QGEP`

    * Click the checkbox next to it

.. figure:: images/001_searchplugin.jpeg

   **Add the QGEP plugin**

Optional plugin
~~~~~~~~~~~~~~~

QGEP uses a data historization process. The ``pg history viewer`` `plugin <http://plugins.qgis.org/plugins/pg_history_viewer/>`_ allows you to view the changes made and replay some of them.

Install the demo data
---------------------

* Download from https://github.com/QGEP/datamodel/releases/latest
  New Restore file: qgep_vx.x.x_structure_and_demo_data.backup (with data), other versions with schema only available

* Extract the file

* Restore the file `qgep_vx.x.x_structure_and_demo_data.backup` with pgAdmin

Install the demo project
------------------------

* Download from https://github.com/QGEP/qgep/releases/latest the qgep.zip

* Extract the file

* If you leave the qgep_[language].qm files in the same directory as the qgep.qgs file and start QGIS with one of these languages, your qgep-project will be translated to that langue when you start the project. E.g. you start qgep.qgs with a QGIS Installation that is set to German, then the qgep.qgs project will appear in German.

.. note:: You need to explicitly set the language in QGIS in settings. If QGIS is configured to take the system language, the QGEP translation is not loaded.

.. figure:: images/qgep_project_qm_language_files.jpg

* Open `project/qgep.qgs` with QGIS
* When you save that project it will keep it's language and it cannot be changed in the same way.


Add your own OID in the project
-----------------------------------

* You have to add your OID data in the table qgep_sys.oid_prefixes:

.. figure:: images/oid_prefix.jpg

* Edit ``02_oid_generation.sql`` with your OID if you want it permanently in the QGEP project and hand in a pull request

https://github.com/QGEP/datamodel/blob/master/02_oid_generation.sql

.. code:: sql

  -- sample entry for the City of Uster - you need to add an entry for your own organization
  INSERT INTO qgep_sys.oid_prefixes (prefix,organization,active) VALUES ('ch11h8mw','Stadt Uster',TRUE);
  INSERT INTO qgep_sys.oid_prefixes (prefix,organization,active) VALUES ('ch15z36d','SIGE',FALSE);
  INSERT INTO qgep_sys.oid_prefixes (prefix,organization,active) VALUES ('ch13p7mz','Arbon',FALSE);

and set the OID you want to use in your project to TRUE.

* or add it locally to your project with an INSERT statement.

* OID prefixes have to be ordered at https://www.interlis.ch/en/dienste/oid-bestellen

.. note:: If you work with different databases for different communities, you should use different OID prefixes for each database.


Working with more than one database
-----------------------------------

* Create a new database in pgAdmin with a new name, e.g. communityA

* Create a new schema qgep in this database (do not choose another name, because all scripts works with the schema-name qgep)

* Go further on as described in 1.2 Database initialization

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

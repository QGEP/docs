Setup workstation
=================

Database configuration
----------------------

To tell a workstation, where the database is (on the local system or on a
network server) you will have to create some files initially on every device on
which you will have QGIS/QGEP running. It is not required to do that on the
server itself.

These instructions depend on your operating system.

Windows
~~~~~~~

Create a new directory where you want to store the configuration in. (E.g. a new folder ``pgconfig`` in your home folder). This directory will be referred to as ``PGSYSCONFDIR`` in this guide.

Set the environment variable ``PGSYSCONFDIR`` to the path to ``PGSYSCONFDIR``.

Inside this folder, there will be two files

* ``pg_service.conf``
* ``pgpass`` (If you do not want to enter the password for the db every time)

.. attention::

 On Windows, you need to save ``pg_service.conf`` in Unix format in order to work.
 One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
 and ``Edit --> EOL Conversion --> UNIX Format --> File save`` .
  

Linux
~~~~~

On linux you may put the files ``.pg_service.conf`` and ``.pgpass`` into your home
folder (normally ``/home/[username]``)

All systems
~~~~~~~~~~~

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

* We recommend using the latest master builds (called qgis-dev on Windows)
  which often offer a better experience in combination with QGEP.
  For Windows installation, download the `OSGeo4W Installer <http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe>`_
  choose *advanced installation* and install qgis-dev.

Install QGEP plugin
-------------------

* Open QGIS

* Go to Plugins (position *1* in the image below)

  * Manage and Install Plugins

  * Settings (position *3*)

    * Add...

      * Name: QGEP

      * URL:
        ``https://raw.githubusercontent.com/QGEP/repository/master/plugins.xml``

    * Enable `Show also experimental plugins` (position *2*)

.. figure:: images/001_addplugin.jpeg

   **Add the plugin repo**

Activate the plugin (see image below):

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


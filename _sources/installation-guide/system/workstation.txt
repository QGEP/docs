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

Create a new directory where you want to store the configuration in. (E.g. a new folder :code:`pgconfig` in your home folder). This directory will be referred to as :code:`PGSYSCONFDIR` in this guide.

Set the environment variable :code:`PGSYSCONFDIR` to the path to :code:`PGSYSCONFDIR`.

Inside this folder, there will be two files

* :code:`pg_service.conf`
* :code:`pgpass` (If you do not want to enter the password for the db every time)

Linux
~~~~~

On linux you may put the files :code:`.pg_service.conf` and :code:`.pgpass` into your home
folder (normally :code:`/home/[username]`)

All systems
~~~~~~~~~~~

Put the following content in the file :code:`pg_service.conf` or :code:`.pg_service.conf`.
You may have to adapt the variables for your setup.

.. code:: ini

    [pg_qgep]
    host=localhost
    port=5432
    dbname=qgep
    user=qgep

To save the password as well on the system you may use the file `pgpass <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_.

.. code:: ini

    localhost:5432:*:qgep:password

Install QGIS
------------

* Minimum requirement 2.10

  * We recommend using the latest master builds (called qgis-dev on Windows)
    which often offer a better experience in combination with QGEP.

Install QGEP plugin
-------------------

* Open QGIS

* Go to Plugins

  * Manage and Install Plugins

  * Settings

    * Add...

      * Name: QGEP

      * URL: :code:`http://qgis.vitu.ch/plugins/plugins.xml`

    * Enable `Show also experimental plugins`

  * All

    * Search `QGEP`

    * Click the checkbox next to it

Install the demo project
------------------------

* Download http://qgis.vitu.ch/qgep_demodata/project_20140829.zip

* Extract the file

* Open `qgep_en.qgs` with QGIS


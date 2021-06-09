Update of the datamodel
=======================

The releases of the datamodel are available `here <https://github.com/QGEP/datamodel/releases/>`_. 
When a new datamodel is released, a QGEP database can be updated with `PUM <https://github.com/opengisch/pum>`_.
In this documentation, the main steps and requirements are reproduced.


Requirements
------------

Client
^^^^^^
Update is done using `PUM <https://github.com/opengisch/pum>`_ available on linux and windows environment. It does not require to be run on the server directly but can be run from a remote client or a virtual machine. `Pirogue <https://github.com/opengisch/pirogue>`_ is required for views regeneration.

PostgreSQL
^^^^^^^^^^
The functions ``pg_dump``, ``pg_restore`` must be available from the terminal, they are installed along with PostgreSQL. **The version of the client postgresql and the server postgresql must match.**

If several ``pg_dump`` and ``pg_restore`` are installed on the client, PUM has to use the proper version.
You can either:

* Set the default ``pg_dump`` and ``pg_restore`` with ``sudo ln -s /usr/lib/postgresql/XX/bin/pg_dump /usr/bin/pg_dump --force``

* Make use of the `PUM config file <https://github.com/opengisch/pum#config-file>`_.

Python
^^^^^^
The default python must be python 3.

PUM installation
^^^^^^^^^^^^^^^^
``pip3 install pum``

To update PUM

``pip3 install --upgrade pum``

``sudo`` can be used to install ``PUM`` and ``pirogue`` system wide or the ``--user`` flag can be used to install they into the current user's home directory.

If you encounter any problem with PUM installation or usage, check the `PUM documentation <https://github.com/opengisch/pum#pum>`_.

Pirogue installation
^^^^^^^^^^^^^^^^^^^^
``pip3 install pirogue``

To update pirogue

``pip3 install --upgrade pirogue``


Database update
---------------
For the following commands the database is connected with the service ``qgep_prod``.

PostgreSQL service
^^^^^^^^^^^^^^^^^^
The parameters to connect to the databases are provided in a service file (for instance the file ``~/.pg_service.conf``.)

There are at least three services inside:
* ``qgep_prod`` database to be updated
* ``qgep_test`` database which will store a test of the update
* ``qgep_comp`` current model, after the update the ``qgep_prod`` and ``qgep_comp`` models should be similar.

Database backup
^^^^^^^^^^^^^^^
It is recommended to backup the database before the update. In command line:

``pg_dump -Fc -f /path/to/dump/qgep_prod.dump -d "service=qgep_prod"``

Download and install current database release
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Download current datamodel release from ``https://github.com/QGEP/datamodel/archive/refs/tags/<release_number>.zip`` (replacing ``<release_number>`` with the desired version, such as ``1.5.4``). Run the following commands from the unzipped directory.

* Create current database. It is used for comparison (target).

``psql -h host -p port -U postgres -c 'CREATE DATABASE qgep_comp;'``

* Install current datamodel release. 

``./scripts/db_setup.sh -f -r -p qgep_comp`` Launched from the ``datamodel`` folder.

Create empty database 
^^^^^^^^^^^^^^^^^^^^^^
* Create test database. It is used to test the update processus.

``psql -h host -p port -U postgres -c 'CREATE DATABASE qgep_test;'``

Launch update
^^^^^^^^^^^^^^
The following command must be launched form the ``datamodel`` folder.

``pum test-and-upgrade -pp qgep_prod -pt qgep_test -pc qgep_comp -t qgep_sys.pum_info -f dump.dump -d delta/ -i constraints views indexes --exclude-schema public --exclude-schema qgep_migration -v int SRID 2056 -x``. 

* ``-pp`` Production database
* ``-pt`` Test database
* ``-pc`` Comparison database
* ``-t`` Table which stores the database versions and update state
* ``-f`` A backup file which is generated during the process. It is restored in ``qgep_test``.
* ``-i`` The constraints, views and indexes are ignored (if they are not similar in ``qgep_comp`` and ``qgep_test`` after the update, the processus continue anyway.
* ``-- exclude-schema`` schema which is ignored in the comparison
* ``-v`` Parameters of the delta scripts
* ``-x`` Ignore restore errors (materialized views can generate ``pg_restore`` errors
* ``--exclude-field-pattern 'usr_%'`` if custom attributes were added

****

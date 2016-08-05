Setup database server
=====================

If you expect to access the data from several different workstations, you can
install the database on a network accessible server. If it is just a single
desktop you are working on, this can be installed on the same machine.

Required Software
-----------------

Server installation
~~~~~~~~~~~~~~~~~~~

* Install PostgreSQL (>=9.3)

  * `Windows download page <http://www.postgresql.org/download/windows>`_

* Install PostGIS (>=2.3)

.. note::

 In a single desktop environment (no network database server) you can setup
 your database to trust local connections.

 This way, the database won't ask for a password if you're connecting from your
 local workstation while no password is written  anywhere. You even can do
 with no database password at all.

 This can be done by editing the database access configuration file
 `pg_hba.conf <http://www.postgresql.org/docs/devel/static/auth-pg-hba-conf.html>`_
 and set the auth-options from ``md5`` to ``trust``. A database service reload
 is required to activate changes.


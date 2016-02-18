Using Pgadmin
==============

.. _SQL query:

SQL query
---------

``.. figure:: images/001_roles.jpeg``

   **Running SQL commands in PgAdminIII**

.. note::

 * Clicking the highlighted icon at location *1* opens the SQL Window.
   The SQL icon is active only when you're connected to a database.
 * Clicking the icon at *2* runs the written SQL commands.

.. _Database dump:

Database dump
-------------

.. note::
 * Open pgAdminIII and connect to the database
 * Right click the Schema that you want to backup (in the tree structure below "Schemas")
 * Enter the filename where the dump should be stored
 * Check the following options

::

 .. figure:: images/Screenshot-from-2015-01-22-102152.png
 .. figure:: images/Screenshot-from-2015-01-22-102155.png
 .. figure:: images/Screenshot-from-2015-01-22-102159.png
 .. figure:: images/Screenshot-from-2015-01-22-102218.png

.. note::

 * After running the process, the exit code 0 indicates that everything went ok

``.. figure:: images/Screenshot-from-2015-01-22-102222.png``

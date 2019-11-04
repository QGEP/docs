.. _Create-DB-Tables:

SWMM Create DB Tables
=====================

QGEP plugin
-----------

Launch ``SWMM Create DB Tables``:

- ``Database``: the name of the service used to connect to the database (`QGEP services setup <http://qgep.github.io/docs/fr/installation-guide/workstation.html#windows-pg-service>`_)
- ``Path to DB Model SQL``: Folder which stores the SQL files used to create the schema and swmm views: ``datamodel\swmm_views``.


Python command line
-------------------

.. code :: python

	PGSERVICE = 'pg_qgep'
	DBMODEL = 'C:\\QGEP\\datamodel\\swmm_views'
	qs = QgepSwmm(None, PGSERVICE, None, None, None, None, None, DBMODEL)
	qs.create_fill_swmm_tables()



QGEP-SWMM installation
======================


Installation of a postgreSQL service
------------------------------------

In `pg_service.conf` create a service. You can also use an existing service.

.. code :: txt
[pg_qgep_demo_data]
host=localhost
port=5432
dbname=qgep_demo_data
user=postgres
password=postgres



Installation of QGEP-SWMM schema, views and tables
--------------------------------------------------

Launch *.\scripts\install_swmm_views.bat*

This script:
- Creates the schema *qgep_swmm*
- Creates views of qgep tables for correspondances with SWMM tables
- Copies data in the views in tables (record a state of the qgep database)


Installation of python scripts
------------------------------
The script require *psycopg2* to connect to the database.

'Psycopg2 installation<https://pypi.org/project/psycopg2/>'










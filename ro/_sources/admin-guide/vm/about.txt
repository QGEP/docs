About
=====

The VM is based on Debian Jessie with Cinnamon Desktop.

Installed software:

 - PostgreSQL 9.4.4 with Postgis 2.1.7
 - QGIS Master 2.11

Settings that are changed from a default software install:

 - ``pg_hba.conf`` has **trust** for local connections
 - QGIS is setup with `multithreaded rendering enabled <http://www.lutraconsulting.co.uk/products/qgis-mtr>`_
 - QGIS is setup with `postgres server side expression compiler enabled <http://www.opengis.ch/2015/07/29/postgres-expression-compiler>`_

.. note::

 The users ``web`` and ``root`` have the password ``qgis``

.. note::

 If you decide to use the VM in production, it is recommended to:

  - change the passwords
  - regenerate the ssh keys by running in a terminal ``sudo rm /etc/ssh/ssh_host_* && sudo dpkg-reconfigure openssh-server``


.. _security:

User Roles
=======

QGEP comes with a set of predefined roles for a multi user configuration.

The base installation of QGEP defines the following group roles :

* qgep_viewer : has the rights for project consultation, can select entities of QGEP, view values lists.
* qgep_user : main QGEP user, can edit entities (`qgep_od` schema), view values lists.
* qgep_manager : user of QGEP with extended privileges, can edit entities and values lists (`qgep_vl` schema).
* qgep_sysadmin : superuser of QGEP database, can edit qgep system tables (`qgep_sys` schema).

Data in QGEP are stored in 3 schemas with default permissions for all of these users.

.. Note:: The SQL related to these roles creation is stored `here <https://github.com/QGEP/datamodel/blob/master/12_roles.sql>`_

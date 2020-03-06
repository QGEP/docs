.. _security:

User Roles
=======

QGEP comes with a set of predefined roles for a multi user configuration.

The SQL related to these roles creation is stored here : 

https://github.com/QGEP/datamodel/blob/master/12_roles.sql

Users are defined in these classes :

* qgep_viewer : has the rights for project consultation, can select entities of QGEP, view values lists.
* qgep_user : main QGEP user, can edit entities, view values lists.
* qgep_manager : user of QGEP with extended privileges, can edit entities and values lists.
* qgep_sysadmin : superuser of QGEP database, has the highest privileges.

Data in QGEP are stored in 4 schemas with default permissions for all of these users.
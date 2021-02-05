Naming conventions
==================

Schemas in the QGEP-Database
---------------------------
The QGEP-Database has six qgep-schemas:

* qgep_od: in this schema you find the tables, that correspond to the VSA-DSS-datamodel (cover, wastewaternode, channel etc.) These are the tables you normally work with.

* qgep_vl: is the schema for value lists. There is a table for every value list of the VSA-DSS. As a QGEP-user you can not edit these tables.

* qgep_network: schema for the tables that are necessary to use the network-topology with the qgep-tools. You can rebuild these tables from the QGEP-tools.

* qgep_sys: special tables for administration of the database. As a QGEP-User you can not edit these tables.

* qgep_import and qgep_swmm: schema for additional plugins/functions (Qfield and working with SWMM)


Layer names
-----------

* Layer names have often a prefix like od_ or vl_.
This shows you, in which schema to look for the table. od_organisation is the table organisation in the qgep_od-schema.

* Layer Names that begin with vw_
Two or more VSA-DSS tables are joined in a view (vw). The layer has the name of the main-table. Example: vw_qgep_reach: the main layer is the table reach (not the table channel).
It is important to know the main-table to be sure, that you use the correct attributes. 

* Layer vw_network_
These are views in the schema qgep_network

Attibute names
-------------

* Prefixes in attribute names
In a view, you find fields from different tables. In easier cases, there are only a subclass and a superclass included. In the qgep-mainlayers there are several sub- und superclasses.
With the prefix of the attribute name, you know to which table an attribute belongs. The prefix are two letters that belong to a table of the VSA-DSS datamodel. Example: co = cover, ws = wastewater structure.
The convention is: attributes of the main table have no prefix, all other attributes have a prefix that points to the table they are from. In case of sub- and superclass, the two tables are taken together.
Example in layer vw_qgep_reach: identifier is the attribute of the table wastewater_networkelement (the superclass of maintable reach) and therefore has no prefix. Material is in table reach, has no prefix because its the maintable. ch_usage_current is an attribute of the table channel. ws_remark is the attribute remark of the table wastewater_structure.

* fk_ fields
fk_ is not a shortcut for a special table. It stands for foreign key.

* _ fields
Attributes that start with _ (underscore) are calculated fields. You can not find them in the schemas. Examples: _slope_per_mill in vw_qgep_reach. 
_channel_useage_current in vw_qgwp_wastewater_structure is calculated from the field usage_current of the channel, that is connected with the foreign keys of the wastewater_networkelement as outlet to a manhole or special structure.

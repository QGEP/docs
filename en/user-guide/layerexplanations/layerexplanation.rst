.. _layer-explanation:

Layer explanation
=================

Main layers
-----------

vw_qgep_wastewater_structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Main layer for manholes, special structures, infiltration installations, discharge points (and wastewater treatment plant (wwtp) structure). Creating a new record in this layer always creates a new wastewater structure, a new cover and a new wastewater node. In the edit form, you have access to a lot of the related tables (e.g. structure parts, maintenance events). In database-schema qgep_od.

.. figure:: images/schema_vw_qgep_wastewater_structure.jpg

Even if there are several covers or wastewater nodes, there is just one point for every wastewater structure in this layer. By default, the position of the wastewater node created first is used as the point coordinate.

.. attention:: Do not export this point coordinates as covers. Use the layer vw_cover for this.

vw_qgep_reach
^^^^^^^^^^^^^

Main layer for line-wastewater structures (channels). Creating a new record in this layer always creates a new reach and a new channel. In the edit form, you have access to a lot of the related tables (e.g. structure parts, maintenance events). In database-schema qgep_od.

.. figure:: images/schema_vw_qgep_reach.jpg

Wastewater Structures
---------------------

od_wastewater_structure
^^^^^^^^^^^^^^^^^^^^^^^

This layer shows the detailed geometries of wastewater structures. You digitize a new detailed geometry by the records of the layer vw_qgep_wastewater_structure. If you want to change an existing geometry, then you have to edit in the layer od_wastewater_structure. In database-schema qgep_od.

Structure Parts
^^^^^^^^^^^^^^^

Cover is the only structure part with a point-geometry himself. All other structure parts are just linked to there wastewater structures and should by only edited by the main layers (vw_qgep_wastewater_structure and vw_qgep_reach).

vw_cover
^^^^^^^^

You use this layer, if you want to change the situation of just one selected cover (and not the hole wastewater structure) or if you want to add a new cover to an existing wastewater structure. (you can add an additional cover also in the covers-tab of the vw_qgep_wastewater_structure, but this cover has no situation...). And you use this layer if you want to show the detail position of the covers (e.g. in network_plan or pipeline_registry) or to export the cover positions. In database-schema qgep_od.

vw_channel
^^^^^^^^^^

The channel-class has no geometry and is therefore mostly changed in the vw_qgep_reach layer. In database-schema qgep_od.

od_organisation
^^^^^^^^^^^^^^^

todo: This table is today at a strange place (it is not only related to wastewater structures) and has to be revised. In database-schema qgep_od.

Inspection
----------

These tables are used in the maintenance tabs in the main tables. Do not edit directly. In database-schema qgep_od.

Value Lists
-----------

These value lists are defined in the VSA-datamodel. Do not change. In database-schema qgep_vl.

Hydraulic
---------

vw_wastewater_node
^^^^^^^^^^^^^^^^^^

You use this layer only, if you want to change the situation of just one selected ww_node (and not the hole wastewater structure) or if you want to add a new ww_node to an existing wastewater structure. (you can add an additional ww_node also in the wastewater nodes-tab of the vw_qgep_wastewater_structure, but this node has no situation...). In database-schema qgep_od.

Overflow tables
^^^^^^^^^^^^^^^^

These tables are connencted to wastewater nodes. In the project-file template (Version 8.0, 4.6.2020) are no relations defined for these tables. In database-schema qgep_od.

Topology
--------

These two layers are used by the qgep-extension for the profile and the network-following. Do not change. In database-schema qgep_network.
You can use the vw_network_segment layer to show the flow direction, if you use a markerline (filled_arrowhead) as symbol.

Catchment
---------

Main layer to digitize and edit the catchment_areas.  In database-schema qgep_od.

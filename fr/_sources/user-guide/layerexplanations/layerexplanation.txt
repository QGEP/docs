.. _layer-explanation:

Layer explanation
=================

Main layers
-----------

vw_qgep_wastewater_structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Main layer for covers of manholes, special structures, infiltration installations, discharge points (and wastewater treatment plant (wwtp) structure). Creating a new record in this layer always creates a new cover, a new wastewater node and a new wastewater structure. In the edit form, you have access to a lot of the related tables (e.g. structure parts, maintenance events).

.. figure:: images/schema_vw_qgep_wastewater_structure.jpg

vw_qgep_reach
^^^^^^^^^^^^^

Main layer for line-wastewater structures (channels). Creating a new record in this layer always creates a new reach and a new channel. In the edit form, you have access to a lot of the related tables (e.g. structure parts, maintenance events).

.. figure:: images/schema_vw_qgep_reach.jpg

Wastewater Structures
---------------------

od_wastewater_structure
^^^^^^^^^^^^^^^^^^^^^^^

This layer shows the detailed geometries of wastewater structures. You digitize a new detailed geometry by the records of the layer vw_qgep_wastewater_structure. If you want to change an existing geometry, then you have to edit in the layer od_wastewater_structure.

Structure Parts
^^^^^^^^^^^^^^^

Cover is the only structure part with a point-geometry himself. All other structure parts are just linked to there wastewater structures and should by only edited by the main layers (vw_qgep_wastewater_structure and vw_qgep_reach).

vw_cover
^^^^^^^^

You use this layer only, if you want to change the situation of just one selected cover (and not the hole wastewater structure) or if you want to add a new cover to an existing wastewater structure. (you can add an additional cover also in the covers-tab of the vw_qgep_wastewater_structure, but this cover has no situation...).

vw_channel
^^^^^^^^^^

Is this layer in use for something or can it be deleted??

od_organisation
^^^^^^^^^^^^^^^

todo: This table is today at a strange place and has to be revised

Inspection
----------

These tables are used in the maintenance tabs in the main tables. Do not edit directly.

Value Lists
-----------

These value lists are defined in the VSA-datamodel. Do not change.

Hydraulic / vw_wastewater_node
------------------------------

You use this layer only, if you want to change the situation of just one selected ww_node (and not the hole wastewater structure) or if you want to add a new ww_node to an existing wastewater structure. (you can add an additional ww_node also in the wastewater nodes-tab of the vw_qgep_wastewater_structure, but this node has no situation...).

This layer must be expanded in the future with related tables (e.g. overflow-tables...)

Topology
--------

These two layers are used by the qgep-extension for the profil and the network-following. Do not change or use otherwise.

Catchment
---------

Main Layer to digitize and edit the catchment_areas.

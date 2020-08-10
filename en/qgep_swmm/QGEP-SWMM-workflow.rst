.. _QGEP-SWMM-workflow:

QGEP-SWMM workflow
==================

Workflow
--------

In the QGEP processing tool, there are three SWMM processes:

1. ``SWMM Create Input`` reads data from the PostgreSQL tables (schema ``qgep_swmm``) and generate an input file for SWMM.
2. ``SWMM Execute`` launches SWMM. Its likely that the ``.inp`` file generated in the previous step contains error. In this case, the ``.inp`` file has to be opened with the SWMM Graphical User Interface (GUI) to solve the errors. Similarly, if you need to tune the simulation parameters, you have to edit the ``.inp`` file with SWMM GUI.
3. ``SWMM Extract Results`` parses the result file and generates three QGIS table layers.

Mapping: The user has to join the computed values with the geometries and map them. This step is currently not automatised.



GEP project
-----------
**WORK IN PROGRESS: This section must be completed with end users**

Usually, a GEP analysis has at least three steps:

1. The current state of the network is analysed
2. The aimed state (available areas are built at 100%) is analysed.
3. Several variants are tested and analysed

**Minimal parameters to be set**

``Time series``: Create a time serie for the rain. The time series have to be linked to the raingages ``Hydrology > Rain Gages`` (which are linked to the subcatchments)

``Hydrology > Subcatchment``: Set percent of of impervious area and infiltration parameters

**Optional parameters**

``Climatology > Evaporation``

**Run aimed state simulation**

- Copy the ``inp`` file used for the previous simulation

- Increase the impervious areas:``Hydrology > Subcatchements > % Imperv``

**Run variants (network is modified)**

New links and new nodes are created directly in SWMM GUI








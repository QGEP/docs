.. _QGEP-SWMM-workflow:

QGEP-SWMM workflow
==================

Workflow
--------

1. Run ``SWMM Create Input``. It reads data from the QGEP views (schema ``qgep_swmm``) and generate an input file for SWMM. 

2. Check ``.inp`` file. Its likely that the ``.inp`` file generated in the previous step contains errors or needs some parameters to be tuned. We recommand to first open the ``.inp`` file with the SWMM Graphical User Interface (GUI) to solve the errors. Similarly, if you need to tune the simulation parameters, you have to edit the ``.inp`` file with SWMM GUI.

3. Run ``SWMM Execute`` launches SWMM. Run it on a tested ``.inp`` file.

4. Run ``SWMM Extract Results``. It parses the result file and generates three QGIS table layers.

5. Mapping: The user has to join the computed values with the geometries and map them. This step is currently not automatised.


Each step is explained in more details in the next chapters.



GEP project
-----------
**WORK IN PROGRESS: This section must be completed with end users**

Usually, a GEP analysis has at least three steps:

1. The current state of the network is analysed
2. The planned state is analysed.
3. Several variants are tested and analysed

**Minimal parameters to be set**

``Time series``: Create a time serie for the rain. The time series have to be linked to the raingages ``Hydrology > Rain Gages`` (which are linked to the subcatchments)

``Hydrology > Subcatchment``: Set percent of of impervious area and infiltration parameters

**Optional parameters**

``Climatology > Evaporation``

**Run planned state simulation**

- In the function ``SWMM Create Input`` choose the state planned. It extract the planned wastewater structures.

**Run variants (network is modified)**

New links and new nodes are created directly in SWMM GUI








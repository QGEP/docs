.. _Change-Simulation-Parameters:

Change simulation parameters
============================

The easiest way to edit the simulation parameters is to open the ``.inp`` file with SWMM GUI.
Then, you will find the parameters list hereunder.
These parameters are extracted from the QGEP database if they exists (i.e. sections hydrology, hydraulics in SWMM) or copied from the template ``.inp`` file.

Title/Notes:
------------
- Set by the user as a QGEP_SWMM option 
- update title if necessary.

Options: 
------------
- Copied from the template input file if exists.
- set / update simulation parameters.

Climatology:
------------
- Copied from the template input file if exists.
- set / update climatology parameters

Hydrology:
------------
**Rain Gages:**

QGEP_SWMM creates one raingage for each subcatchment. 

By default:

- Time serie: Each raingage is related to a default rain time serie called ``default_qgep_raingage_timeserie``. The time serie must be created and the value Series Name updated accordingly.
- Other parameters have default SWMM values

**Aquifers:**

QGEP_SWMM creates an aquifer for each QGEP ``aquifiers``.

By default:

- An aquifer is created for each QGEP ``aquifiers``
- The bottom elevation is set to the ``minimal_groundwater_level``
- The water table elevation is set to the ``average_groundwater_level``
- Other parameters have default SWMM values

**Subcatchment:**

QGEP_SWMM creates a subcatchment for each QGEP catchment area.

By default:
- A subcatchment is created for each QGEP ``wastewater_networkelement`` linked to the ``catchment area`` (max. 4: ``fk_wastewater_networkelement_rw_current``, ``fk_wastewater_networkelement_rw_planned``, ``fk_wastewater_networkelement_ww_current``, ``fk_wastewater_networkelement_ww_planned``)
- it is linked to a rain gage. 
- The width is computed from the mean of the minimal / maximal distance between the outlet and the catchment area contour. If the outlet is unknown the centroid is used rather thant the outlet.
- The coverages (attribute land uses) are computed from the intersection between the catchment area and the planning zone
- Other parameters have default SWMM values

The subcatchment can be linked to an aquifer via the groundwater attribute.


**Snow Packs**

- Copied from the template input file if exists.

**Unit hydrographs**

- Copied from the template input file if exists.

**LID Controls**

- Copied from the template input file if exists.

Hydraulics
---------------

**Junctions**

- QGEP_SWMM creates a junction for each QGEP manhole, some kind of special structures and the wastewater nodes linking primary pipes without a wastewater structure.

- See ``vw_swmm_junctions.sql`` for details.

**Outfalls**

- QGEP_SWMM creates an outfall for each QGEP discharge_point.

- See ``vw_swmm_outfalls.sql`` for details.

**Dividers**

- QGEP_SWMM creates a divider for the manholes and special structures having the function ``separating_structure``

- See ``vw_swmm_dividers.sql`` for details.

**Storage Units**

- QGEP_SWMM creates a storage for some kind of QGEP infiltration installations and some kind of QGEP special structures.

- See ``vw_swmm_storages.sql`` for details.

**Conduits**

- QGEP_SWMM creates a conduit for each QGEP reach.

- See ``vw_swmm_conduits.sql`` for details.

**Pumps**

- QGEP_SWMM creates a pump for each QGEP pump.

- See ``vw_swmm_pumps.sql`` for details.

**Orifices**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

**Weirs**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

**Outlets**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

**Transects**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

**Controls**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

Quality
---------------

**Land uses**

- QGEP_SWMM creates a land use for each QGEP planning zone kind.

**Pollutants**

- Are not created from QGEP objects.

- Copied from the template input file if exists.

Curves
---------------
- Are not created from QGEP objects.

- Copied from the template input file if exists.

Time series
---------------
- Are not created from QGEP objects.

- Copied from the template input file if exists.

Time patterns
---------------
- Are not created from QGEP objects.

- Copied from the template input file if exists.

Labels
---------------
- Are not created from QGEP objects.

- Copied from the template input file if exists.



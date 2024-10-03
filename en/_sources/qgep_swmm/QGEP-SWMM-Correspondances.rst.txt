.. _QGEP-SWMM-Correspondances:

QGEP - SWMM correspondances
---------------------------


Title/Notes:
^^^^^^^^^^^^

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.


Options:
^^^^^^^^
No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.


Climatology:
^^^^^^^^^^^^
No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Hydrology:
^^^^^^^^^^
**Rain Gauges [Gages in SWMM]:**

QGEP_SWMM creates one raingage for each subcatchment.

By default:

- Time serie: Each raingage is related to a default rain time serie called ``default_qgep_raingage_timeserie``. The time serie must be created and the value Series Name updated accordingly.
- Format is set to 'INTENSITY'. Format in which the rain data are supplied: INTENSITY: each rainfall value is an average rate in inches/hour (or mm/hour) over the recording interval. VOLUME: each rainfall value is the volume of rain that fell in the recording interval (in inches or millimeters). CUMULATIVE: each rainfall value represents the cumulative rainfall that has occurred since the start of the last series of non-zero values (in inches or millimeters).
- Interval is set to '0:15' (15 seconds). Recording time interval between gage readings in decimal hours or hours:minutes format.
- Other parameters have default SWMM values. If you want to use another Format or Interval, you have to adapt the view.

See ``vw_swmm_raingages.sql`` for details.

**Aquifers:**

QGEP_SWMM creates an aquifer for each QGEP ``aquifiers``.

By default:

- An aquifer is created for each QGEP ``aquifiers``
- The bottom elevation is set to the ``minimal_groundwater_level``
- The water table elevation is set to the ``average_groundwater_level``
- Other parameters have default SWMM values

See ``vw_swmm_aquifers.sql`` for details.

**Subcatchment:**

QGEP_SWMM creates a subcatchment for each QGEP catchment area.

By default:

- A subcatchment is created for each QGEP ``wastewater_networkelement`` linked to the ``catchment area`` (max. 4: ``fk_wastewater_networkelement_rw_current``, ``fk_wastewater_networkelement_rw_planned``, ``fk_wastewater_networkelement_ww_current``, ``fk_wastewater_networkelement_ww_planned``)
- it is linked to a rain gage.
- The width is computed from the mean of the minimal / maximal distance between the outlet and the catchment area contour. If the outlet is unknown the centroid is used rather than the outlet.
- The coverages (attribute land uses) are computed from the intersection between the catchment area and the planning zone (see ``vw_swmm_coverages.sql``)

- SWMM Dry Weather Flow:

    -  are set to 0 for rain water subcatchments
    -  are set to ``waste_water_production[_current,_planned]`` if set
    -  else it computed from the subcatchement area and ``population_density[_current,_planned]``

- Other parameters have default SWMM values

The subcatchment can be linked to an aquifer via the groundwater attribute.

See ``vw_swmm_subcatchments.sql``, ``vw_swmm_subareas.sql``, ``vw_swmm_dwf.sql`` and ``vw_swmm_coverages.sql`` for details.

**Snow Packs**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

**Unit hydrographs**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

**LID Controls**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Hydraulics
^^^^^^^^^^

**Junctions**

- QGEP_SWMM creates a junction for each QGEP manhole, some kind of special structures and the wastewater nodes linking primary pipes without a wastewater structure.

See ``vw_swmm_junctions.sql`` for details.

**Outfalls**

- QGEP_SWMM creates an outfall for each QGEP discharge_point.

See ``vw_swmm_outfalls.sql`` for details.

**Dividers**

- QGEP_SWMM creates a divider for the manholes and special structures having the function ``separating_structure``

- See ``vw_swmm_dividers.sql`` for details.

**Storage Units**

- QGEP_SWMM creates a storage for some kind of QGEP infiltration installations and some kind of QGEP special structures.

- See ``vw_swmm_storages.sql`` for details.

**Conduits**

- QGEP_SWMM creates a conduit for each QGEP reach.
- Roughness is created from ``coefficient_of_friction``, ``wall_roughness`` or ``swmm_default_coefficient_of_friction`` (see: :ref:`Coefficient-Of-Friction`)
- QGEP profile type are matched to SWMM profile type, dimensions are computed from ``reach.clear_height`` and ``pipe_profile.height_width_ratio``
- Custom pipe profile described by a curve are currently not exported

- See ``vw_swmm_conduits.sql`` and ``vw_swmm_xsections.sql`` for details.

**Pumps**

- QGEP_SWMM creates a pump for each QGEP pump. When a curve ``qgep_od.hq_relation`` is liked to the pump it is exported as a SWMM curve.

- See ``vw_swmm_pumps.sql`` and ``vs_swmm_curves.sql`` for details.

**Orifices**

No correspondance in QGEP. Orifices are not created from QGEP objects. An empty table is created

- See ``vw_swmm_orifices.sql`` for details.

**Weirs**

- Are created from QGEP prank weir (without H/Q relation) and leaping weir.

- See ``vw_swmm_weirs.sql`` for details.

**Outlets**

No correspondance in QGEP. However, outlets are created to export QGEP prank weir having a H/Q relation.

- See ``vw_swmm_outlets.sql`` for details.

**Transects**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

**Controls**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Quality
^^^^^^^

**Land uses**

- QGEP_SWMM creates a SWMM land use kind for each QGEP planning zone kind.

- See ``vw_swmm_landuses.sql``

**Pollutants**

No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Curves
^^^^^^
- Are created for pumps linked to a ``qgep_od.hq_relation`` and for wastewater structures linked to a ``qgep_od.hydr_geom_relation``

- See ``vw_swmm_curves.sql`` for details.

Time series
^^^^^^^^^^^
No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Time patterns
^^^^^^^^^^^^^
No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

Labels
^^^^^^
No correspondance in QGEP. This parameter must be set by the user in the template ``.inp`` file or before running the simulation.

- Copied from the template input file if exists.

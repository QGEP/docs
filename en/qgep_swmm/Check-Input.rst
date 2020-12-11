.. _Check-Input:

Check input file
================

The generated ``.inp`` file can be imported in SWMM GUI. It is likely that some errors will be raised. You will have to solve them (see hereunder a list of common errors)

You have to solve the errors in the order in which they appear in the report. Some errors are interrelated (i.e. a node in a conduit is not defined => the conduit is not imported => Undefined link error)

To fix an error you can search in the corresponding QGEP layers in the QGIS project:

- vw_wastewater_node for undefined nodes
- catchment_area for subcatchment errors
- etc.

.. _Common-Import-Errors:

Common import errors
--------------------

Catchment area connected to secondary wastewater structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
``
`Undefined Node (CHamtKnv00002706) referenced at line 20997:
[DWF]
CHamtKnv00002706	FLOW	0.0204074074074074	dailyPatternDWF
``

The catchment area is linked to a secondary wastewater structure

Missing discharge coefficients
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
``
Too few items at line 104:
[SUBCATCHMENT]
ch19ar68CA008855_ww_current	raingage@ch19ar68CA008855	CHamtKnv00001992	0.0276		19.4322613668305
``
The subcatchement discharge coefficients are not filled in. 
You can find them using sql:
`` 
select obj_id, fk_wastewater_networkelement_rw_current, discharge_coefficient_rw_current
from qgep_od.catchment_area
where fk_wastewater_networkelement_rw_current is not null and discharge_coefficient_rw_current is null;

select obj_id, fk_wastewater_networkelement_rw_planned, discharge_coefficient_rw_planned
from qgep_od.catchment_area
where fk_wastewater_networkelement_rw_planned is not null and discharge_coefficient_rw_planned is null;

select obj_id, fk_wastewater_networkelement_ww_current, discharge_coefficient_ww_current
from qgep_od.catchment_area
where fk_wastewater_networkelement_ww_current is not null and discharge_coefficient_ww_current is null

select obj_id, fk_wastewater_networkelement_ww_planned, discharge_coefficient_ww_planned
from qgep_od.catchment_area
where fk_wastewater_networkelement_ww_planned is not null and discharge_coefficient_ww_planned is null;
``

Introduction and Overview
=================

.. figure:: images/qgep_title.png

**QGEP**is a selection of tools and a database implementation to work with the data in the data structure for wastewater and GEP, short VSA-DSS.

.. note:: The Data Structure for urban drainage systems of the Swiss Waste Water Association (in German Verband Schweizer Abwasser- und Gewässerschutzfachleute (VSA)), referenced usually as VSA-DSS was published 1999 and is since then the valid standard for data covering General Water Drainage Planning (in German Generelle Entwässerungsplanung (GEP). More information you can find on the homepage of the `VSA <http://dss.vsa.ch>`_ 

The current database implementation in PostgreSQL is for the Version 2015 of the VSA-DSS datamodel, including the extension for sewer TV inspections called VSA-KEK.

To work with QGEP-tools, it is important to know the following norm: Wegleitung GEP-Daten <https://vsashop.ch/de/A~11_1104~1/Wegleitung-GEP-Daten/Mitglied/Gedruckte-Publikation>`_ of the VSA and there specially the annex "**Erfassungsgrundsätze**".

This is important because with VSA-DSS you do not only describe the manholes and channels (wastewater structures as constructive part), but with the nodes and reaches you do create the hydraulic model of the sewer network (network elements) also.

It is important to know the difference between **primary and secondary wastewater facilities** (pwwf / swwf). There are not the same rules for placing wastewater nodes in pwwf and swwf-networks. Catchment areas should be connected only to pwwf-network.
Reaches are always created in flow-direction (flow direction in case of normal-flow).

To support the digitizing, QGEP uses two main-views: **vw_qgep_wastewater_structure** and **vw_qgep_reach**. To edit these main views, there is a special wizard and the preconfigured feature attribute windows of these views.
The idea is, to support with the wizard the digitizing, so that 95% of the manholes and channels can be collected on the general-tab of the feature attribute-window, that means with as few mouse clicks as possible.

**QGEP wizard**
To use the wizard is recommended for digitizing reaches because it supports snapping and connecting to the nodes preferred to the reaches. If you use the QGIS - Add line feature - tool you can not select and pick the nodes as easy.


.. figure:: images/qgep_title.png

Introduction and Overview
=================

**QGEP** is a selection of tools and a database implementation to work with the data in the data structure for wastewater and GEP, short VSA-DSS.

.. note:: The Data Structure for urban drainage systems of the Swiss Waste Water Association (in German Verband Schweizer Abwasser- und Gewässerschutzfachleute (VSA)), referenced to usually as VSA-DSS was published 1999 and is since then the valid standard for data covering General Water Drainage Planning (in German Generelle Entwässerungsplanung (GEP). When applying VSA-DSS you also comply to SIA405 Abwasser, the subset for sewer networks as described in `Norm SIA405 (Merkblatt 2015 / 2016) <http://www.sia.ch/de/dienstleistungen/sia-norm/geodaten/>`_. More information you can find on the homepage of the `VSA <http://dss.vsa.ch>`_ 

.. note:: The current database implementation in PostgreSQL is for the Version 2015 of the VSA-DSS datamodel, including the extension for sewer TV inspections called VSA-KEK.

.. note:: We also recommend you to get a licence for the data model by purchasing the **CD VSA-DSS** with the datamodel in INTERLIS, object catalogues and additional description and introduction and transfer datasets in the `VSA Shop <https://vsashop.ch/de/A~21_1100~1/Datenstruktur-Siedlungsentw%C3%A4sserung-VSA-DSS-Lizenz/Mitglied>`_ 

To work with QGEP-tools, it is important to know also the following norm: `Wegleitung GEP-Daten <https://vsashop.ch/de/A~11_1104~1/Wegleitung-GEP-Daten/Mitglied/Gedruckte-Publikation>`_ which is a practitioners guide to modelling reality into GIS and hydraulic datamodel of the VSA and there specially the annex "**Erfassungsgrundsätze**" (data acquisition policy).

This is important because with VSA-DSS you do not only describe the manholes and channels (wastewater structures as constructive part), but with the nodes and reaches you do create the hydraulic model of the sewer network (network elements) also.

It is important to know the difference between **primary and secondary wastewater facilities** (pwwf / swwf). There are not the same rules for placing wastewater nodes in pwwf and swwf-networks. Catchment areas should be connected only to pwwf-network.
Reaches are always created in flow-direction (flow direction in case of normal-flow).

To support the digitizing, QGEP uses two main-views: **vw_qgep_wastewater_structure** and **vw_qgep_reach**. To edit these main views, there is a special wizard and the preconfigured feature attribute windows of these views.
The idea is, to support with the wizard the digitizing, so that 95% of the manholes and channels can be collected on the general-tab of the feature attribute-window, that means with as few mouse clicks as possible.

**QGEP wizard**

To use the wizard (:ref:`digitizing-wastewater-structures`) is recommended for digitizing reaches because it supports snapping and connecting to the nodes preferred to the reaches. If you use the QGIS - Add line feature - tool you can not select and pick the nodes as easy.


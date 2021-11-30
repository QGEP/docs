QGEP / TEKSI wastewater module
===========

TEKSI wastewater module (projet name: QGEP) is a selection of tools and a database implementation that allows you to:

* manage and map your seewer network data with all its components in compliance with Swiss standards
* indicate the characteristics of networks objects in the form of attributes such as diameter, material, depth, damages, construction year, etc.
* produce plans and extract statistics from the database such as network values, total length of pipes, identification of future interventions, etc.
* export geodata in compliance with Swiss standards

Main features
------------

**Network objects**

Creation, information and management of network elements according to the VSA-DSS model:

* Wastewater structures
* Special structures
* Primary collectors
* Secondary collectors (ex : private connection)
* Catchments
* GEP mesures
* Maintenances
* Network inspection (VSA-DSS model extension VSA-KEK)

**Viewing and editing**

A preconfigured QGIS project including the symbology, the forms and the relation between the objets is provided.

The editing can be done directly using the QGIS natives tools and the QGEP complementary toolbox (ex : inversion of the direction of the pipes and its related altitudes).

**Files**

Documents, pictures and videos can be linked to the network elements.

**Networks following tools**

Network topology management:

* Topology creation between pipes, structures and watersheds
* Upstream and downstream network tracking tools (water drop)
* Length profiles display

**Mapping and statistics production**

* Map production with pre-configured layout
* Serial plotting of structures protocole
* Statistics production on all or part of the network

**Data import**

* Field survey import tools [specific development in progress]
* Data survey with a mobile device and semi-automatic insertion of the informations
* Data import in INTERLIS format

**Data export**

* Direct connection with the network simulating software SWMM (Storm Water Management Model)
* Data export in CAD (dwg/dxf) and GIS format (all open data formats)
* Data export in interlis format

**Historisation**

* Modifications history viewer and possibility to roll back

More to come
------------

* Automatic integration of pipe inspection according to Wincan VX and VSA-DSS KEK format

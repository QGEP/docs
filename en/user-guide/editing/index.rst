Editing of existing data
========================

This represents a guide on how to edit existing data in QGEP.

Demo project
-------
* Make sure you have imported the demo project with pgAdminIII (:ref:`database-initialization`)
* Open the demoproject with Menu Project/Open

.. figure:: images/qgep_demoproject_selection_qgep_en_qgs.jpg

* Login to the database

.. figure:: images/qgep_demoproject_login.jpg

* You should now have the demoproject loaded

.. figure:: images/qgep_demoproject_overview.jpg

* The project consists of different layers. Depending on your task what to edit or add you choose the layer.

Layers
-----
* QGEP has different predefined layers:

Layer vw_qgep_cover
^^^^^^^^

* The layer vw_qgep_cover allows to edit all point elements. This are the wastewater structures such as manholes, special structures, discharge points and infiltration installation (not supported yet are wwtp_structures, which is also a wastewater structure), but not the channels.

.. figure:: images/layer_vw_qgep_cover.jpg

Layer vw_qgep_reach
^^^^^^^^

* The layer vw_qgep_reach allows to edit all linear elements of the wastewater (channels).

Layer Waste water structures
^^^^^^^^
* TO DO Add description

Layer Value lists
^^^^^^^^
* TO DO Add description

Layer Hydraulic
^^^^^^^^
* TO DO Add description

Layer Topology
^^^^^^^^
* TO DO Add description



Changing attributes of point elements (manholes / special structures)
-----

 * To change an attribut first select the vw_qgep_cover layer and switch to the edit mode
 * Then click on the info button and choose the element you want to edit by double-clicking
 
 .. figure:: images/qgep_info_button.jpg
 
 * The form of the vw_qgep_cover will open
 
 .. figure:: images/form_vw_qgep_cover.jpg
 
 * On the first tab you can change the most common attributes
 * To change attributes of related tables such as the cover select that tab. Depending on the kind of wastewater structure you can edit additional attributs in the respective tab (special structure, manhole). 
 * The tab "covers" allows you to add additional covers. 
 * In "Structure parts" you can add also further parts such as acces aids, backflow prevention, dryweather flume etc.
 
 .. figure:: images/form_vw_qgep_cover_structure_parts.jpg
 
 * In "Wastewater nodes parts" you can edit or add all attributes of this class or add a second element

 .. figure:: images/form_vw_qgep_cover_wastewater_nodes.jpg

Changing attributes of linear elements (channels)
-----

 * To change an attribut first select the vw_qgep_reach layer and switch to the edit mode 
 * Then click on the info button and choose the element you want to edit by double-clicking a channel
 * The form of the vw_qgep_reach will open
 * On the first tab you can change the most common attributes
 * To change attributes of related tables such as reaches select that tab. 

..TO DO: add image
 
..* TO DO:
  * Changing relations (Verknüpfungen ändern)
  * Change ws_type (Subklasse eines Abwasserbauwerkes ändern (ObjektID ändert dann auch!))
  * Split channels into different reaches (Kanäle unterteilen)
  
  
`Link to the Homepage of the Swiss Waste Water Association - Datamodel VSA-DSS: <http://dss.vsa.ch>`_



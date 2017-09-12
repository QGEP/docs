.. _editing-data:

Editing of existing data
========================

This represents a guide on how to edit existing data in QGEP.

Demo project
------------

* Make sure you have imported the demo project with pgAdminIII (see the :ref:`database-initialization` chapter)
* Open the demoproject by going to the main menu and press **Project** --> **Open**  or by pressing ``CTRL``
  + ``O`` at the same time.

.. figure:: images/qgep_demoproject_selection_qgep_en_qgs.jpg
   :scale: 50 %

* Login to the database

.. figure:: images/qgep_demoproject_login.jpg

* You should now have the demoproject loaded

.. figure:: images/qgep_demoproject_overview.jpg

* The project consists of different layers. Depending on your task what to edit or add you choose the layer.

Layers
------

* QGEP has different predefined layers:

Layer vw_qgep_cover
^^^^^^^^^^^^^^^^^^^

* The **vw_qgep_cover** layer allows to edit all point elements. This are the wastewater structures such as manholes,
  special structures, discharge points and infiltration installation (**wwtp_structures**, which is also a wastewater
  structure, are not supported yet).

.. figure:: images/layer_vw_qgep_cover.jpg

Layer vw_qgep_reach
^^^^^^^^^^^^^^^^^^^

* The **vw_qgep_reach** layer allows to edit all linear elements of the wastewater network (**reaches** / **channels**).

Layer Waste water structures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* This layer contains various sublayers related to the waste water structure. It also contains links to the mainntenance
  events, the relation table between waste water structures and maintenance events and the organisation table (where **owners**,
  **dataowners**, etc. are stored)

Layer Value lists
^^^^^^^^^^^^^^^^^

* Here you can see various value lists that are related to the sewer network classes.

Layer Hydraulic
^^^^^^^^^^^^^^^

* This layer allows to select and edit waste water nodes. Select the layer, then choose the **Identify Features** tool and double click on a node.

Layer Topology
^^^^^^^^^^^^^^

* Here you can find all needed information about the topology of the network.


Changing attributes of point elements (manholes / special structures)
---------------------------------------------------------------------

 * To change an attribute you first need to select the **vw_qgep_cover** layer and switch to the edit mode.
 * Or start the **QGEP Wizard** and click on **Start Data Entry**.
 * Then click on the **Identify features** button and choose the element you want to edit by double-clicking.
 
 .. figure:: images/qgep_info_button.jpg
 
 * The **vw_qgep_cover** form will open.
 
 .. figure:: images/form_vw_qgep_cover.jpg
 
 * On the first tab you can change the most common attributes
 * To change attributes of related tables (e.g. cover) you need to select the correspondent tab. Depending on the
   kind of wastewater structure you can edit additional attributes in the respective tab (**special structure**, **manhole**).
 * The **covers** tab allows you to add additional covers.
 To add a second cover in this part is not recommended, because you can not define the geometry of the new point.
 
 * In **Structure parts** you can add also further parts such as **acces aids**, **backflow prevention**, **dryweather flume** etc.
 
 .. figure:: images/form_vw_qgep_cover_structure_parts.jpg
 
 * In **Wastewater nodes parts** you can edit or add all attributes of this class or add a second element.
 To add a second wastewater node in this part is not recommended, because you can not define the geometry of the new point.

 .. figure:: images/form_vw_qgep_cover_wastewater_nodes.jpg
 

Changing attributes of linear elements (channels)
-------------------------------------------------

 * To change an attribute you first need to select the **vw_qgep_cover** layer and switch to the edit mode.
 * Then click on the **Idendify features** button and choose the element you want to edit by double-clicking a channel.
 * The **vw_qgep_reach** form will open.
 
  .. figure:: images/form_vw_qgep_reach.jpg
 
 * On the first tab you can change the most common attributes.
 * To change attributes of related tables (e.g. **reach points**) select the correspondent tab.
 
  .. figure:: images/form_vw_qgep_reach_reachpoints.jpg
 

Changing attributes of hydraulic elements
-----------------------------------------

* With the **Identify feature** tool activated, right clicking an element outputs a selection of all existing objects.

 .. figure:: images/qgep_info_button_rightclick.jpg
 
 * You can select then the object you want. This will get you to the correspondent form to see the details.
 
Adding additional covers and nodes to an existing wastewater structure
----------------------------------------------------------------------

The description is for an additional cover.

* Be sure to have the relation between vw_cover (field fk_wastewater_structure) and vw_qgep_wastewater_structure (field obj_id) in your project properties / relations.
* Define in layer vw_cover / properties / fields the field fk_wastewater_structure as value relation

.. figure:: images/vw_cover_properties_fields.jpg

* Start editing vw_cover and add the new cover
* In the form you find behind the field fk_wastewater_structure a button to connect the new cover to an existing wastewater structure

.. figure:: images/new_cover_connect_to_wws.jpg
 
Saving changes
--------------
 
* Click **Save** and then deactivate the edit mode or click on **Stop data entry** if you have worked with the **QGEP Data Entry** wizard.
  
..* TO DO:

  * Changing relations (Verknüpfungen ändern)
  * Change ws_type (Subklasse eines Abwasserbauwerkes ändern (ObjektID ändert dann auch!))
  * Split channels into different reaches (Kanäle unterteilen)
  
  
`Link to the Homepage of the Swiss Waste Water Association - Datamodel VSA-DSS: <http://dss.vsa.ch>`_


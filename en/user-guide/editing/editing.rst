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

* QGEP has different predefined layers. For explanations, see the :ref:`layerexplanation` chapter.




Changing attributes of point elements (manholes / special structures)
---------------------------------------------------------------------

 * To change an attribute you first need to select the **vw_qgep_wastewater_structure** layer.
 * Switch to the edit mode or start the **QGEP Wizard** and click on **Start Data Entry**.
 * Then click on the **Identify features** button and choose the element you want to edit by double-clicking.
 
 .. figure:: images/identify_feature_tool.jpg
 
 * The **vw_qgep_wastewater_structure** form will open.
 
 .. figure:: ../digitizing/images/wizard_wastewater_structure_manhole_form_data_ok3.jpg
 
 * On the first tab you can change the most common attributes
 * To change attributes of related tables (e.g. cover) you need to select the correspondent tab. Depending on the
   kind of wastewater structure you can edit additional attributes in the respective tab (**special structure**, **manhole**).
 * The **covers** tab allows you to add additional covers.
 
 .. attention:: It is not recommended to add a second cover in this form, because you can not define the geometry of the new cover. See the :ref:`Adding additional covers and nodes to an existing wastewater structure` chapter above.
 
 * In **Structure parts** tab you can add further parts such as **access aids**, **backflow prevention**, **dryweather flume** etc.
 
 .. figure:: images/form_vw_qgep_wastewater_structure_structure_parts.jpg
 
 * In **Wastewater nodes** tab you can edit or add all attributes of this class or add a second element.
 To add a second wastewater node in this part is not recommended, because you can not define the geometry of the new point.

 .. attention:: It is not recommended to add a second wastewater node in this form, because you can not define the geometry of the new node. See the :ref:`Adding additional covers and nodes to an existing wastewater structure` chapter above.
 

Changing attributes of linear elements (channels)
-------------------------------------------------

 * To change an attribute you first need to select the **vw_qgep_reach** 
 * Switch to the edit mode.
 * Then click on the **Idendify features** button and choose the element you want to edit by double-clicking a reach.
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


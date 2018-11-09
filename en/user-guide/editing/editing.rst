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

* QGEP has different predefined layers. For explanations, see the :ref:`layer-explanation` chapter.


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
 
 .. attention:: It is not recommended to add a second cover in this form, because you can not define the geometry of the new cover. See the :ref:`Adding-additional-covers-and-nodes-to-an-existing-wastewater-structure` chapter above.
 
 * In **Structure parts** tab you can add further parts such as **access aids**, **backflow prevention**, **dryweather flume** etc.
 
 .. figure:: images/form_vw_qgep_wastewater_structure_structure_parts.jpg
 
 * In **Wastewater nodes** tab you can edit or add all attributes of this class or add a second element.
 To add a second wastewater node in this part is not recommended, because you can not define the geometry of the new point.

 .. attention:: It is not recommended to add a second wastewater node in this form, because you can not define the geometry of the new node. See the :ref:`Adding-additional-covers-and-nodes-to-an-existing-wastewater-structure` chapter above.
 

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
 
 
Working with codes of valuelist
-------------------------------

* The values of fields with valuelist are stored in the database with codes. 
* In qgep with correct configuration you see in the table view or the form view the values in our language and not the codes.
* But if you use the editor for defining a selection or if you want to define a rule-based symbology for your layer, you have to know the codes or you use the following expression: **represent_value("field")**

* Examples for using **represent_value**
* Search all primary wastewater facility reaches (function_hierarchic starts with pwwf)
 .. figure:: images/represent_value1.jpg
 
* Search all reaches, that have not the same usage_planned as usage_current
.. figure:: images/represent_value2.jpg

.. note:: In the demo-project is no use of represent_value for rule-based symbols, because the rules will otherwise only for one language. 

An other way to choose an object
--------------------------------

* With the **Identify feature** tool activated, right clicking an element outputs a selection of all existing objects at this place.

 .. figure:: images/qgep_info_button_rightclick.jpg
 
 * You can select then the object you want. This will get you to the correspondent form to see the details.
 
Adding additional covers and nodes to an existing wastewater structure
----------------------------------------------------------------------

.. note:: The following description is for an additional cover. It works similar for additional wastewater nodes.

* Be sure to have the relation between vw_cover (field fk_wastewater_structure) and vw_qgep_wastewater_structure (field obj_id) in your project properties / relations.
* Define in layer vw_cover / Properties / **Attribute Forms** the field **fk_wastewater_structure** as value relation

.. figure:: images/vw_cover_properties_fields.jpg

* Start editing vw_cover and add the new cover
* In the form you find behind the field fk_wastewater_structure a button to connect the new cover to an existing wastewater structure
* After clicking this button, you get blue hint in the qgis-window. You can move the vw_cover - form-window and click on the wastewater_structure, that will be associated to the cover.

.. figure:: images/new_cover_connect_to_wws.jpg

Adding a wastewater node to an existing reach
---------------------------------------------

In some cases, you need to add a wastewater node between two or more reaches, although there is no manhole at this place.

.. note:: This cases are mainly in pwwf_channels (primary wastewater facilities) if there is e.g. a change of slope or a change of the material or if there is a connection of two channels without manhole (in German: Blindanschluss).

In the datamodel, you can connect a node between reaches to a channel (because also a channel is a wastewater structure). There is in the moment a discussion, if it is necessary or optional or even forbiden to define a connection to a wastewater structure.

In QGEP, there is in the moment no tool, that helps you to connect a wastewater node to a channel. So you just connect the reach points to the node. 

.. note:: If you really want to connect the node to a channel, then type the obj_id of the channel manualy in the fk_wasterwater_structure field of the node.
 
Saving changes
--------------
 
* Click **Save** and then deactivate the edit mode or click on **Stop data entry** if you have worked with the **QGEP Data Entry** wizard.
  
Changing Wastewater Structure Type
----------------------------------

In the vw_qgep_wastewater_structure form, you can change the subclass of the wastewater structure (e.g. from manhole to special structure or to infiltration installation). The old subclass-record will be deleted and you must enter those attributes, that are subclass specific. But all connections (they are defined to the class wastewater_structure and not to the subclass) or the obj_id or the identifier will not change.

.. note:: You can not change a point - wastewater structure (e.g. manhole) to a line wastewater structure (channel) or vice versa.


Split a reach (channel) into different reaches
-----------------------------------------------

This is a quite complex function and not jet implemented in QGEP. There exists a QGIS-Tool to split objects, but if you use this tool with vw_qgep_reach - layer, you will get a database error, because the obj_id if the split (= doublicated) records are no more unique.

Temporary solution: Change the existing reach and draw the second reach manually. Control the connections. 

There will be later a tool in QGEP to split reaches. The user has to decide, if splitting concerns only class reach or also the class channel, if there a new wastewater node shall be added and connected. The tool shall be able to calculate the new reachpoint - levels and should change the existing network-element-connections if nesseccary.
  
`Link to the Homepage of the Swiss Waste Water Association - Datamodel VSA-DSS: <http://dss.vsa.ch>`_


Digitizing Catchment Areas
===========================

General
-------

Catchments can be digitized with QGIS standard tools.

.. figure:: images/qgis_standard_tools.jpg

Catchment areas should not overlap and can have 4 connections to wastewater nodes.

Digitizing
----------
* Select the **Enable Snapping** button

.. figure:: images/enable_snapping_button.jpg

* Open the **Project Snapping Option Settings**, check the **od_catchment_area** layer and check the **avoid intersection** checkbox for the od_catchment_area layer

.. figure:: images/catchment_avoid_intersection2.jpg

.. note:: New digitized catchement areas will not overlap with existing areas with this settings.

* Set the layer ``od_catchment_area`` into the edit mode.
* Use the **Add Feature** tool to digitize a new area.

.. figure:: images/add_feature_tool.jpg

* Start digitizing with left click and continue with left click for every vertex of the polygon

.. figure:: images/catchment_area_digitizing1.jpg

* Stop digitizing with right click

.. note:: Keep in mind, that the finishing point of the polygon is the last point where you **left** clicked.

* The **od_catchment_area** form appears

.. figure:: images/catchment_area_digitizing2.jpg

* When finished editing attributes, click the **OK** button

.. note:: The new area does not overlap the old areas.

.. figure:: images/catchment_area_digitizing3.jpg

.. note:: To control the exact area of a selected polygon, see in the **Identify Results** window under **(Derived)**.

.. note:: To connect the area with wastewater nodes, see chapter :ref:`connect-wastewater-network-elements`.

Editing
-------

* You can edit existing areas with the **Identify features** tool.

.. figure:: images/identify_feature_tool.jpg

Split Areas
-----------

* You can split existing areas with the **Split** tool. 

.. figure:: images/split_tool.jpg

* There is no need to select the area first. Left clicks to define the spliting line. Right click after having defined the last point of the spliting line.

Merge Areas
-----------

You can merge existing areas with the **Merge selected Feature** tool.

.. figure:: images/merge_selected_feature_tool.jpg

* Selected the **od_catchment_area** layer an set it into the edit mode
* Select at least two areas you want to merge
* Click the "Merge selected Feature" tool. -> The **Merge Feature Attributes** windows appears.

.. figure:: images/merge_feature_attributes.jpg

* Choose which values will be taken from wich old record and click **OK**.

.. attention:: If you select one of the records and click on the **Take attributes from the selected feature** button, then the **obj_id** field will be skipped by default and the database will not accept the changes. After using this button, you have to choose one of the values in the **obj_id** field manually.

Digitizing Catchment Areas
===========================

General
-------

Catchments can be digitized with QGIS standard tools.

.. figure:: images/qgis_standard_tools.jpg

Catchment areas should not overlap and can have 4 connections to wastewater nodes.

So enable the **Advanced digitizing toolbar** in the **View** --> **Toolbars Menu**

.. figure:: images/advanced_digitzing_toolbar.jpg

Digitizing
----------
* Select the **Enable Snapping** button

.. figure:: images/enable_snapping_button.jpg

* Open the **Project Snapping Option Settings**, check the **od_catchment_area** layer and check the **avoid intersection** checkbox for the od_catchment_area layer

.. figure:: images/catchment_avoid_intersection.jpg

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

.. note:: Then new area does not overlap the old areas.

.. note:: To control the exact area of a selected polygon, see in the **Identify Results** window under **(Derived)**.

.. note:: To connect the area with wastewater nodes, see chapter editing / connect wastewater network elements.

Editing
-------

* You can edit existing areas with the **Identify features** tool.

.. figure:: images/identify_feature_tool.jpg

* You can split existing areas with the **Split** tool. There is no need to select the area first. Left clicks to define the spliting line. Right click after having defined the last point of the spliting line.

.. figure:: images/split_tool.jpg

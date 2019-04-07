Network following tools
=======================

Refresh network topology
------------------------

* Before using the notwork following tools, be sure, that your network topology is updated

* To refresh the network topology, you select the layer **vw_qgep_reach** and set the layer to the edit mode

* Click the **refresh network topology** tool (Button with SQL and drip)

* If ok, there is a message: **Success: Network successfully updated**


Upstream
--------

* It does not matter, which layer is selected

* To start upstream network following select the **Upstream** QGEP button 

.. figure:: images/network_upstream_button.jpg


* QGEP opens then profile window at the bottom of the map. Click on your start node. 

* If there is more than one node in this area, you choose the one you want form the mouse-list

.. attention:: With qgepplugin 1.1.8 / QGIS 3.4.2, it's a good idea to zoom in so far, that you can choose your startnode without having any other node nearby. If you choose the node from the mouse-list, you may get unexpected results.

.. figure:: images/network_select_start_node.jpg


* After a few seconds all upstream reaches will be highlighted and you can see where the water is coming from.

* If you want to select the highlighted reaches, then klick on the **Select current path** button in the profile window


.. figure:: images/network_select_currentpath.jpg

* You can now work with your reach selection in the attribute table or zoom to the selected reaches (if the vw_qgep_reach layer is selected)

* Use this tool to check if the topology of your network is correct.

.. note:: In the button select current path, you have a menu **Configure Select**. This is prepared to select later not only the path, put also the catchment areas that are connected to the path. This feature is not working with qgepplugin 1.1.8.


Downstream
----------

* Downstream network following works similar as the Upstream network following described above.

.. figure:: images/network_downstream_button.jpg


* You can see where the water is going to. 

* Control, if QGEP finds also the overflows

* Use this to check whether the topology of your network is correct or to find out where you could intervene in case of an accident.


Flow times downstream
---------------------

* This is a tool in the QGEP-toolbox.

* The idea for this tool is to get the flowtime between a startpoint (where e.g.is an accident) and an interesting wastewater structure downstreams. It is not the idea to create a flowtime plan for a whole network with this tool. There are already considerations about this functionality.

* For this tool you need a layer (table) in the QGEP-project with the flowtime per reach and the obj_id of the reach.

* You have to select the start-reach (where the accident is) in the vw_qgep_reach-layer

* Start the tool with double-click one **Flow times downstream**

.. figure:: images/toolbox.jpg
.. figure:: images/qgep_toolbox.jpg

* In the window you have to choose 

  * as reach layer: vw_qgep_reach

  * as flow time layer: your table with the reach obj_id and the flowtimes (or the values you want to sum up downstream)
  
  * as reach id field: the field in your table that is the obj_id of the reach
  
  * as Flow times field: the field in your table, that you want to sum up
  
  * as Flow times: if you let this field empty, there will be a temporary file with the resultats in your projects. Otherwise you can save the resultat to a vector layer.
.. figure:: images/flow_time_downstream_window.jpg

* The Tool makes a downstream network search starting with the selected reach and creates for every reach a record in the (temporary) vector layer with just one field (the sum of the Flow times).
.. figure:: images/flow_time_downstream_result.jpg

.. attention:: If there is more than one downstream-way, the results are wrong after the branch.

* There are some cases, where you get an empty flow time-Layer and red (error) text in the Log-window:
 
  * Do not select more than one reach to start
 
  * Do not select vw_qgep_reach as flow time layer (to sum up the length, use the vw_network_segment layer)
  
  * If the reach id field has no values that match the reach obj_id, you will also get an error


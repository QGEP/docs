Network following tools
=======================

Refresh network topology
------------------------

* Before using the network following tools, be sure, that your network topology is updated

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

.. attention:: With qgepplugin 1.1.8 / QGIS 3.4.2, it's a good idea to zoom in so far, that you can choose your start node without having any other node nearby. If you choose the node from the mouse-list, you may get unexpected results.

.. figure:: images/network_select_start_node.jpg


* After a few seconds all upstream reaches will be highlighted and you can see where the water is coming from.

* If you want to select the highlighted reaches, then click on the **Select current path** button in the profile window


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




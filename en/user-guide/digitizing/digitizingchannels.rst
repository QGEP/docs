Digitizing Waste channels 
=========================

General
-------

QGEP has a wizard to correctly build channels and connect them to the manholes / special structures and build up the topology for waste water nodes and reaches.

.. figure:: images/wizard_data_entry.jpg

.. figure:: images/wizard_data_entry_reach.jpg

Important: Start digitizing in the direction of the flow - starting with the from node and finishing with the to node / manhole. 

..There is no tool yet to change the flow direction (topology), so try to make it right from the beginning.

Digitizing
----------

When digitizing the cursor will automatically snap to the nearest cover or reach. When clicking a line starts to draw. 

.. figure:: images/wizard_data_entry_reach_with_new_cursor.jpg

With further left clicks anywhere you can define intermeditiary points of the reach progression. Or you directly select another manhole to draw a straight channel. 

.. figure:: images/wizard_data_entry_reach_with_new_cursor2.jpg

With right click you finish digitizing and the reach form will appear.

.. figure:: images/wizard_wastewater_structure_reach_form.jpg

Add the attributes on the general tab. For the profile type you will get a list of defined profiles. To edit those do so in the table pipe_profile. 

.. figure:: images/wizard_wastewater_structure_reach_form_profiles.jpg


When finished, then click the OK button. 

.. figure:: images/wizard_wastewater_structure_reach_form_data_ok.jpg

Save the information of this layer by stopping the data entry wizard

.. figure:: images/stop_data_entry.jpg

You can re-edit your point object selecting the edit mode and then click with the info cursor on the object you want to edit.
If you do not select the edit mode, you can just look add the existing data.

.. figure:: images/manhole_info_reach.jpg

For detailed information about editing see the edit chapter (:ref:`editing-data`).

Further attributes and classes
------------------------------

When a line object is digitized a series of steps take place in the background in the QGIS database:
a) an new object in the class wastewater structure is added
b) a new object in the subclass channel is added and linked
c) two new reach point objects are added and linked to the reach (rp_from, rp_to_node)

.. figure:: images/wizard_wastewater_structure_reach_form_reach_points.jpg

d) a new reach object is generated in wastewater network elements and its subclass wastewater nodes




..* Kanal/Haltung (Digitalisierrichtung, Schnappen)
..* Weitere verknüpfte: Eigentümer, Rohrprofil, Hydraulische Geometrie, Hydraulische Einbauten
..* evtl. Verknüpfungen erfassen
..(take more from GEPView-Howto 1.2. Chapter 4.2)

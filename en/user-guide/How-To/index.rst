How To
======
This represents a guide on different themes about configuring in QGEP.

Manual Label-positioning for different scales
---------------------------------------------
QGIS label definiton can handle different labels for different scales. This works very well if you work on the screen. 
If you have to print plans with labels or if you have to export labels for data exchange (e.g. exchange with RegioGIS-platform), it will often be necessary to determine the label positions manually.
If a label is positioned manually in QGIS, this fixed position applies to every scale. And that's not the good solution.

Solution
* Extend the Auxiliary Storage File with new fields for different labelpositions
* Use Rule-based labeling, then you can define different labelpositions for every rule 

In the example below, we want to label the wastewater-structures with a detailed label for network_plan (1:500) and for overviewmap (1:2000).
In the Auxiliary Storage we use the standard fields PositionX and PositionY for the  network_plan labels. For the overviewmap labels we add two new fields.
We name this fields posx2000 and posy2000.

.. figure:: images/man_labeling_newfields.jpg

Define now rule-based labeling with two rules. In the example the first rule is called WP-Labels (WP = Werkplan = network_plan). 
You have not the change something in the placement, because this rule uses the standard positioning-fields.

.. figure:: images/man_labeling_rules.jpg

The second rule is called UP-Labels (UP = Uebersichtsplan = overviewmap). In this rule, you have to change the coordinate fields in the placement-tab.

.. figure:: images/man_labeling_edit_rule.jpg

.. figure:: images/man_labeling_coordinatefield.jpg

Click on Coordinate X menutool and choose in the field type-menu the auxiliary_storage_user_custom_posx2000 field. Then the similar for Y.

.. attention:: Do not use the **Edit...** menu for defining the coordinate-field. If you use a formula or choose the field via the Edit... menu, QGIS will overwrite the definition everytime you do a manual positioning.


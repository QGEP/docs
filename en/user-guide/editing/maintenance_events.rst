.. _maintenance-events:

Adding or Editing of Maintenance Events
=========================================


This represents a guide on how to add or edit maintenance event data in QGEP.

General
-------

* Maintenance events can be connected to one structure or to many. 
  Therefore QGEP uses a intermediatry RE_table to model the n:m relationship (**re_maintenance_event_wastewater_structure**)


Adding a Maintenance Event
-------------------------------------------------------------

* Enable the edit mode.
* With the **Identify Features** tool you can select **wastewater_structures** or **reaches** by selecting their corresponding layer (**vw_qgep_wastewater_structure** or **vw_qgep_reach**).
* The respective form will open. Change to the **Maintenance** tab.
* Create a new maintenance event with the **Add child feature** button.

 .. figure:: images/maintenance_add_child.jpg
 
 .. figure:: images/maintenance_new_record.jpg
 
 .. figure:: images/maintenance_new_record_saved.jpg

* Or link with an already existing maintenance event with the **Link existing child features** button. 

 .. figure:: images/maintenance_link_record.jpg
 
 .. attention:: You have to click in the box in front of the record. There is only a link, if the box is yellow.
 
* Close the windows with **OK** and turn of the edit mode to save changes


Multi Edit
-----------------------------------------------------------

* to do


Editing
--------

 * Do as described in adding - but just edit existing maintenance events.

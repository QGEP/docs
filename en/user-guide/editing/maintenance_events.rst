.. _maintenance-events:

Adding or Editing of Maintenance Events
=========================================


This represents a guide on how to add or edit maintenance event data in QGEP.

General
------------

* Maintenance events can be connected only to one structure or to many. Therefore QGEP uses a intermediatry RE_table to model the n:m relationship (re_maintenance_event_wastewater_structure)


Adding (for single events that just belong to one structure)
-------------------------------------------------------------

* Enable the edit mode
* With the 'Identify Features Tool' you can select Manholes or Reaches, depending which layer you selected (vw_qgep_cover or vw_qgep_reach).
* The respective form will open - change to the tab Maintenance Event
* Create a new maintenance event

 .. figure:: images/qgep_info_button.jpg

* Or link with an already existing maintenance event

 .. figure:: images/qgep_info_button.jpg
 
* Close the form with OK and turn of the edit mode to save changes


Adding (for many events that can belong to many structures)
-----------------------------------------------------------

* to do


Editing
--------

 * Do as described in adding - but just edit existing maintenance events.
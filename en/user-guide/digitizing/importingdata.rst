Importing data
==============

It is quite easy to import data (geometry and attributes) from an external software.
Here is a general discription and a specific example.

General
-------

* You have to add the data you want to import as (vector) layer into the QGEP project.
* The field names of the attributes have to be the same as the field names of the QGEP Layer. 
  There for it is normally not the best idea the use shp-format because of the 10 letters limitation of the dbf-format (Alias field names do not work).
* If you have a translated project, be sure the take the English field names (not the translated name that you find as Alias of the field).
* If there is a field with valuelist, you have to use the code, not the plain text.

An example
----------

Importing a manholes form a list of (GPS)-coordinates

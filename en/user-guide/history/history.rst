History viewer
==============

`PG history viewer` plugin allows you to retrieve modification on the QGEP database.

Plugin configuration
--------------------

First, you have to configure the plugin for the session like this:

.. image:: img/pg_hv_configuration.png

Usage
-----

The "logged events" window is composed of 4 parts.

.. image:: img/pg_hv_history.png

- 1. Part identifying the tools used to filter modifications in the database.
- 2. Logged events with the modification date, the table, the action type "Update/Delete/Insert", the application and the user who made the modification.
- 3. The view comparing the data before and after the change. The red lines are the ones modified.
- 4. If the geometry has been modified, a canvas will show the difference.

Replay function
---------------

If you have configured the replay option, you can replay actions. Example below:

Actual value:

.. image:: img/pg_hv_replay_before.png

Select the event you want to replay and its values will become the current ones. Example for the year that becomes 2004 again:

.. image:: img/pg_hv_replay_after.png

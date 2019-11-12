.. _Create-Input:

SWMM Create Input
=================

The ``.inp`` file is the input file format for SWMM. It contains the wastewater network AND simulation parameters. The network can be extracted from the QGEP data, but the simulation parameters must be set according to your study.

The simulation parameters are copied from a provided ``.inp`` file. 
A default file is provided in the plugin folder in ``src\swmm\default_qgep_swmm_parameters.inp``, but you can create and use your own template file.

QGEP plugin
-----------

Launch ``SWMM Create Input``:

- ``Database``: the name of the service used to connect to the database
- ``Template INP file``: a ``.inp`` from which simulation parameters will be copied
- ``Result INP file``: the ``.inp`` generated from QGEP data

Check input file
----------------

The generated ``.inp`` file can be imported in SWMM GUI. It is likely that some errors will be raised. You will have to solve them (see `Common Import Errors <./Execute.html#common-import-errors>`_).


Change simulation parameters
----------------------------

From SWMM GUI you can set the simulation parameters (see `Change Simulation Parameters <./Change-simulation-parameters.html#change-simulation-parameters>`_).


Python command line
-------------------

.. code :: python

	TITLE = 'title simulation'
	PGSERVICE = 'pg_qgep'
	INPFILE = 'C:\\qgep_swmm\\input\\qgep_swmm.inp'
	INPTEMPLATE = 'C:\\qgep_swmm\\simulation_parameters\\default_qgep_swmm_parameters.inp'
	OUTFILE = ''
	qs = qgep_swmm(TITLE, PGSERVICE, INPFILE, INPTEMPLATE, OUTFILE)
	qs.write_input()


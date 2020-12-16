.. _Execute:

SWMM Execute
============


Change simulation parameters
----------------------------

From SWMM GUI you can set the simulation parameters (see `Change Simulation Parameters <./Change-simulation-parameters.html#change-simulation-parameters>`_).


QGEP plugin
-----------

The path to the SWMM executable must be set in the Processsing tools options.

Launch ``SWMM Execute``:

- ``INP file``: the ``.inp`` file generated during the previous step
- ``OUT file``: the output file containing the results


Common running errors
---------------------
The list of errors can be found `here <https://swmm5.org/2016/09/05/swmm-5-1-and-infoswmm-error-and-warning-messages/>`_

- ``ERROR 211: invalid number -XXX at line XXX of [JUNC] section:``: A negative number is provided for the depth. Change the value in QGEP or in the ``.inp`` file.
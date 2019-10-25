Open .INP with SWMM
===================

Open .INP with SWMM
-------------------

The .inp file is still open in Python. Close Python.

Solve import errors
-------------------

*Undefined Node*
The node doesn't exist in junctions, outfalls, dividers, storages

*Undefined Link*
The link doesn't exist im conduits, pumps, orifices, weirs, outlets

You have to solve the errors in the order they appear in the report. Some errors are interrelated (i.e. a node in a conduit is not defined => the conduit is not imported => Undefined link error)

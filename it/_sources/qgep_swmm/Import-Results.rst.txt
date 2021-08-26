.. _Import-Results:

SWMM Import Results
===================

Launch ``SWMM Import results``:

- ``SWMM report file``: the ``.rpt`` file generated during the previous step
- ``Database``: The name of the PostgreSQL service hosting the QGEP database.
- ``Simulation name``: The name that you want to give to this simulation.
- ``Import full results in addition to summary``: The full time series will be imported. Attention, if the report step is small, the import can take a long time.

Attention, a report file created from the SWMM GUI dont contain the full time series but only the summary.

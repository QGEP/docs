.. _Populate-Coefficient-Of-Friction:

Coefficient of friction
-----------------------

- The plugin will export the roughness according to these priorities:

    - If ``reach.coefficient_of_friction`` is set then it is converted (``1/coefficient_of_friction``) and exported to SWMM
    - Else if ``reach.wall_roughness`` and ``reach.clear_height`` are set, it is converted (``(1/(4 * SQRT(9.81)*POWER((32/re.clear_height/1000),(1/6))*LOG(((3.71*re.clear_height/1000)/(re.wall_roughness/1000)))))``) and exported.
    - Else if ``reach.default_coefficient_of_friction`` is set then it is used
    - Else a default value of ``0.01`` is set

..  note::
    The formula to convert from Strickler to Coolebrook is documented in *ATV-DVWK STANDARD ATV-DVWK-A 110E, Hydraulic Dimensioning and Performance Verification of Sewers and Drains September 2001*
    `Link <https://pdfslide.net/documents/atv-dvwk-a-110-e-55846635d4eef.html>`__ 
    

Populate default coefficient of friction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The table ``qgep_swmm.reach_coefficient_of_friction`` contains default coefficient of Strickler for the reach materials. 
If the default values don't match your needs you can edit them.
The function ``SWMM Set default coefficient of friction`` will put in ``qgep_od.reach.default_coefficient_of_friction`` these default values.
You can choose if you want to overwrite or not the values existing in this attribute.

Launch ``SWMM Set default coefficient of friction``:

- ``Overwrite existing default values``: If checked the values stored in ``default_coefficient_of_friction`` will be overwrited with new values.
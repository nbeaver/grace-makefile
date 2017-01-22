This is a `<Makefile>`_ for the `Grace 2-D plotting tool`_.
It is meant to be dropped into any directory containing Grace projects
and automatically generate a variety of image formats.

.. _Grace 2-D plotting tool: http://plasma-gate.weizmann.ac.il/Grace/

Usage::

    # Runs gracebat on *.agr files and puts output in current working directory.
    make

    # Generates a ZIP archive containing *.agr and generated files.
    make grace-plots.zip

    # Generates a gzipped tar archive containing *.agr and generated files.
    make grace-plots.tar.gz


The Makefile runs ``xmgrace`` to generate these vector formats:

- `Encapsulated PostScript`_
- `Maker Interchange Format`_
- `PostScript`_ and PDF via `GhostScript`_
- `Scalable Vector Graphics`_

.. _Encapsulated PostScript: https://en.wikipedia.org/wiki/Encapsulated_PostScript
.. _Maker Interchange Format: https://en.wikipedia.org/wiki/Maker_Interchange_Format
.. _PostScript: https://en.wikipedia.org/wiki/PostScript
.. _Ghostscript: https://en.wikipedia.org/wiki/Ghostscript
.. _Scalable Vector Graphics: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics

It also generates these raster formats:

- `JPEG`_
- `Portable Network Graphics`
- `Netpbm`_

.. _Portable Network Graphics: https://en.wikipedia.org/wiki/Portable_Network_Graphics
.. _Netpbm: https://en.wikipedia.org/wiki/Netpbm
.. _JPEG: https://en.wikipedia.org/wiki/JPEG

Finally, it also generates a Grace Metafile (GMF) text file.

-------
License
-------

This project is licensed under the terms of the `MIT license`_.

.. _MIT license: LICENSE.txt

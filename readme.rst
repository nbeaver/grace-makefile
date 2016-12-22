This is a `<Makefile>`_ for the `Grace 2-D plotting tool`_.
It generates EPS and PNG output.

.. _Grace 2-D plotting tool: http://plasma-gate.weizmann.ac.il/Grace/

Usage::

    # Runs gracebat on all .agr files and puts EPS and PNG output in out/ directory.
    make

    # Generates a ZIP archive containing all .agr, .eps, and .png files.
    make grace-plots.zip

    # Generates a gzipped tar archive containing all .agr, .eps, and .png files.
    make grace-plots.tar.gz

If you get an error message like this::

    Can't write to file out/reciprocal.eps, check permissions!

make sure that the ``out/`` directory exists.

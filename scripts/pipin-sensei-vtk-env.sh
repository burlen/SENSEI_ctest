#!/bin/bash
source /Users/bloring/apps/modulefiles/mpich/3.2.1
source /Users/bloring/apps/modulefiles/chaos/stable-11.12
source /Users/bloring/apps/modulefiles/adios/1.13.0
source /Users/bloring/apps/modulefiles/vtk/8.0.1
export DYLD_LIBRARY_PATH=${DASHROOT}/${DASHBOARD_TYPE}/sensei-build-vtk/lib:$DYLD_LIBRARY_PATH
export PYTHONPATH=${DASHROOT}/${DASHBOARD_TYPE}/sensei-build-vtk/lib:$PYTHONPATH
export PATH=${DASHROOT}/sensei-build-vtk/bin:$PATH

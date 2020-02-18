set(SENSEI_BACKEND $ENV{SENSEI_BACKEND})
set(SENSEI_BRANCH $ENV{SENSEI_BRANCH})
set(CTEST_SITE "sensei-ascent-sc19.dhcp.lbl.gov")
set(CTEST_BUILD_NAME "sensei-${SENSEI_BACKEND}-${SENSEI_BRANCH}")
set(CTEST_DASHBOARD_ROOT "$ENV{DASHROOT}")
set(INITIAL_CACHE
"PYTHON_EXECUTABLE=/usr/bin/python3
ENABLE_PYTHON=ON
ENABLE_CATALYST=ON
ENABLE_CATALYST_PYTHON=ON
ENABLE_VTK_IO=ON
ENABLE_VTK_MPI=ON
ENABLE_ADIOS1=ON
BUILD_TESTING=ON
ENABLE_HDF5=OFF
HDF5_ROOT=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
ParaView_DIR=/home/sensei/sensei_insitu/software/paraview/5.7.1/lib/cmake/paraview-5.7/
ADIOS_DIR1=/home/sensei/sensei_insitu/software/adios/1.13.1/")
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_GIT_COMMAND "/usr/bin/git")
set(CTEST_TEST_ARGS PARALLEL_LEVEL 1)
set(CTEST_BUILD_FLAGS -j4)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(DASHBOARD_RELIABLE TRUE)
set(ALWAYS_UPDATE ON)
set(INCREMENTAL_BUILD OFF)
include("${CTEST_DASHBOARD_ROOT}/sensei-dashboard.cmake")

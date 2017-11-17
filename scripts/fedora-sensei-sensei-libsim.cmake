set(SENSEI_BACKEND $ENV{SENSEI_BACKEND})
set(CTEST_SITE "sensei-fedora.dhcp.lbl.gov")
set(CTEST_BUILD_NAME "sensei-${SENSEI_BACKEND}")
set(CTEST_DASHBOARD_ROOT "$ENV{DASHROOT}")
set(VISIT_INSTALL /home/sensei/sc17/software/visit/2.13.0/linux-x86_64/)
set(VISIT_DEPS /home/sensei/sc17/software/visit/builds/visit-deps/)
set(VISIT_PYTHON_HOME ${VISIT_DEPS}/visit/python/2.7.11/x86_64/)
set(VISIT_VTK_HOME ${VISIT_DEPS}/visit/vtk/6.1.0/x86_64)
set(INITIAL_CACHE
"CMAKE_CXX_FLAGS=-fPIC -std=c++11 -Wall -Wextra -fpermissive
CMAKE_C_FLAGS=-fPIC -Wall -Wextra
ENABLE_SENSEI=ON
ENABLE_VTK_XMLP=ON
ENABLE_PYTHON=ON
ENABLE_LIBSIM=ON
ENABLE_ADIOS=ON
BUILD_TESTING=ON
ADIOS_DIR=/home/sensei/sc17/software/adios/1.13.0/
VTK_DIR=${VISIT_VTK_HOME}/lib/cmake/vtk-6.1/
VISIT_DIR=${VISIT_INSTALL}")
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_GIT_COMMAND "/usr/bin/git")
set(CTEST_TEST_ARGS PARALLEL_LEVEL 1)
set(CTEST_BUILD_FLAGS -j4)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(DASHBOARD_RELIABLE TRUE)
#set(ALWAYS_UPDATE ON)
#set(INCREMENTAL_BUILD ON)
include("${CTEST_DASHBOARD_ROOT}/sensei-dashboard.cmake")

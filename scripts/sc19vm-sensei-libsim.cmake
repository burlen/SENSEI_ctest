set(SENSEI_BACKEND $ENV{SENSEI_BACKEND})
set(SENSEI_BRANCH $ENV{SENSEI_BRANCH})
set(CTEST_SITE "sensei-ascent-sc19.dhcp.lbl.gov")
set(CTEST_BUILD_NAME "sensei-${SENSEI_BACKEND}-${SENSEI_BRANCH}")
set(CTEST_DASHBOARD_ROOT "$ENV{DASHROOT}")
# visit specific
set(VISIT_INSTALL /home/sensei/sensei_insitu/software/visit/3.0.2/linux-x86_64)
set(VISIT_DEPS /home/sensei/sensei_insitu/software/visit/builds/third_party)
set(VISIT_PYTHON_HOME ${VISIT_DEPS}/python/2.7.14/x86_64)
set(VISIT_VTK_HOME ${VISIT_DEPS}/vtk/8.1.0/x86_64)
set(VTK_DIR ${VISIT_VTK_HOME}/lib/cmake/vtk-8.1)
#
set(INITIAL_CACHE
"BUILD_TESTING=ON
ENABLE_SENSEI=ON
ENABLE_VTK_IO=ON
ENABLE_PYTHON=ON
SENSEI_PYTHON_VERSION=2
ENABLE_LIBSIM=ON
ENABLE_ADIOS1=ON
ADIOS1_DIR=/home/sensei/sensei_insitu/software/adios/1.13.1/
VTK_DIR=${VISIT_VTK_HOME}/lib/cmake/vtk-8.1
VISIT_DIR=${VISIT_INSTALL}")
#
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_GIT_COMMAND "/usr/bin/git")
set(CTEST_TEST_ARGS PARALLEL_LEVEL 1)
set(CTEST_BUILD_FLAGS -j4)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(DASHBOARD_RELIABLE TRUE)
#set(ALWAYS_UPDATE ON)
#set(INCREMENTAL_BUILD OFF)
include("${CTEST_DASHBOARD_ROOT}/sensei-dashboard.cmake")

set(SENSEI_BACKEND $ENV{SENSEI_BACKEND})
set(CTEST_SITE "pipin.dhcp.lbl.gov")
set(CTEST_BUILD_NAME "sensei-${SENSEI_BACKEND}")
set(CTEST_DASHBOARD_ROOT "$ENV{DASHROOT}")
set(INITIAL_CACHE
"CMAKE_CXX_COMPILER=/usr/bin/clang++
CMAKE_C_COMPILER=/usr/bin/clang
BUILD_TESTING=ON
ENABLE_VTK=ON
VTK_DIR=$ENV{VTK_DIR}
ENABLE_PYTHON=ON
ENABLE_ADIOS=ON
ADIOS_DIR=$ENV{ADIOS_DIR}") 
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_GIT_COMMAND "/usr/local/bin/git")
set(CTEST_TEST_ARGS PARALLEL_LEVEL 1)
set(CTEST_BUILD_FLAGS -j4)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(DASHBOARD_RELIABLE TRUE)
#set(ALWAYS_UPDATE ON)
#set(INCREMENTAL_BUILD OFF)
include("${CTEST_DASHBOARD_ROOT}/sensei-dashboard.cmake")

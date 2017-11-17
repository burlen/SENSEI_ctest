#!/bin/bash -l
if [[ $# != 2 ]]
then
    echo
    echo "ERROR: Usage"
    echo "$0 Experimental|Nightly|Continuous vtk|libsim|catalyst"
    echo
    exit -1
fi

case "$1" in
    Nightly)
      ;;
    Continuous)
      ;;
    *)
      echo "ERROR: bad config \$1=$1 is invalid."
      exit -1
esac

source /Users/bloring/apps/modulefiles/mpich/3.2.1
source /Users/bloring/apps/modulefiles/chaos/stable-11.12
source /Users/bloring/apps/modulefiles/adios/1.13.0

case "$2" in
    vtk)
      source /Users/bloring/apps/modulefiles/vtk/8.0.1
      ;;
    *)
      echo "ERROR: bad config \$2=$2 is invalid."
      exit -1
esac

export DASHBOARD_TYPE=$1
export SENSEI_BACKEND=$2

export DASHROOT=/Users/bloring/dashboards/sensei
export DASHCONFIG=pipin-sensei-${SENSEI_BACKEND}.cmake

export LD_LIBRARY_PATH=${DASHROOT}/${DASHBOARD_TYPE}/sensei-${SENSEI_BACKEND}/sensei-build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=${DASHROOT}/${DASHBOARD_TYPE}/sensei-${SENSEI_BACKEND}/sensei-build/lib:$PYTHONPATH
export PATH=${DASHROOT}/${DASHBOARD_TYPE}/sensei-${SENSEI_BACKEND}/sensei-build/bin:$PATH

cd $DASHROOT

EPOCH=`date +%s`
LOCKFILE=lock_$DASHBOARD_TYPE
if [[ -e $LOCKFILE ]]
then
    echo
    echo "ERROR: Found lockfile $LOCKFILE"
    echo "ERROR: Won't start another run while one is already running "
    echo
    exit -2
fi
touch $LOCKFILE
trap "rm $LOCKFILE; exit" SIGHUP SIGINT SIGTERM
ctest --verbose --timeout 30 -S $DASHROOT/$DASHCONFIG -O ./logs/$DASHBOARD_TYPE-$EPOCH.log -V ${CTESTFLAGS}
find $DASHROOT/logs -maxdepth 0 -name '*.log' -atime 2 -exec rm \{\} \;
rm $LOCKFILE

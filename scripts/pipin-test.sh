#!/bin/bash -l
if [[ $# != 2 ]]
then
    echo
    echo "ERROR: Usage"
    echo "$0 Experimental|Nightly|Continuous vtk|libsim|catalyst"
    echo
    exit -1
fi

export DASHBOARD_TYPE=$1

export DASHROOT=/Users/bloring/dashboards/sensei
cd $DASHROOT

#case "$1" in
#    Nightly)
#      cd Nightly/src
#      SVNREV=`date -v-2d +%Y-%m-%d`
#      echo $SVNREV
#      svn up -r {"$SVNREV 22:00:00"}
#      cd ../..
#      ;;
#    Continuous)
#      CTESTFLAGS="-L serial"
#      ;;
#esac

case "$2" in
    vtk)
      source pipin-sensei-vtk-env.sh
      DASHCONFIG=pipin-sensei-vtk.cmake
      ;;
    *)
      echo "ERROR: bad config \$2=$2 is invalid."
      exit -1
esac

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

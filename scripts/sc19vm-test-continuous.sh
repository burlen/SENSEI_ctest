#!/bin/bash -l

bes=( vtk catalyst libsim ascent )
brs=( develop master )

for be in ${bes[*]}
do
    for br in ${brs[*]}
    do
        /home/in-situ-user/SENSEI_ctest/sc19vm-test.sh Continuous ${be} ${br}
    done
done

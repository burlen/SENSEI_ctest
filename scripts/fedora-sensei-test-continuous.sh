#!/bin/bash -l

bes=( vtk catalyst libsim )
brs=( sensei_3_development in_transit_data_adaptor master )

for be in ${bes[*]}
do
    for br in ${brs[*]}
    do
        /home/sensei/sc17/software/sensei/builds/SENSEI_ctest/fedora-sensei-test.sh Continuous ${be} ${br}
    done
done

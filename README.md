# SENSEI_ctest
A collection of scripts that drive SENSEI CTest regression tests.

## Usage
The followinig guide assumes bash shell.
1. Choose a dashboard type, *Nightly* or *Continuous*. The *Nightly* type will once per day, at some convinient time of your choosing, fetch updates, blow away its build dir, make a full build, and run the regresssions. The *Continuous* type will periodically check for updates and make and incremental build if any are found.
2. Create a "root" directory where your dashboard will live and in the root directory create the following subdirectories.
    ```bash
    mkdir -p dashroot/{Nightly,Continuous}
    mkdir -p dashroot/sensei-deps
    mkdir -p dashroot/logs
    ```
3. Make an initial checkout of the sources, and test data. If you have both *Nightly* and *Continuous* dashboards you need a set of source trees for each. Each backend requires a source tree.
    ```bash
    cd dashroot/{Nightly,Continuous}/sensei-{vtk,libsim,catalyst}
    git clone git@gitlab.kitware.com:sensei/sensei.git
    ```
4. Pull the dashbaord scripts:
    ```bash
    git init
    git remote add github git@github.com:burlen/SENSEI_ctest.git
    git pull github master
    ```
5. In the scripts directory make a copy of one of the existing pairs of files to *hostname-config.cmake* and *hostname-test.sh*. Modify the copies of these files to fit the paths of your system. Back in the root directory make symlinks to the new copies. You will also need to set up the environment in the shell script.
6. Setup a cron job to run the dashboard at a convinient time. For example use *crontab -e* and add one or both of the following.
    ```bash
    # Nightly
    0 6 * * * dashroot/hostname-test.sh Nightly
    # Continuous
    0/20 * * * * dashroot/hostname-test.sh Continuous
    ```

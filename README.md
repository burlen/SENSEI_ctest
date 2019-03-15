# SENSEI_ctest
A collection of scripts that drive SENSEI CTest regression tests. Results are submitted to http://cdash.hpcvis.com/index.php?project=SENSEI

## Usage
The followinig guide assumes bash shell.
1. Choose a dashboard type, *Nightly* or *Continuous*. The *Nightly* type will once per day, at some convinient time of your choosing, fetch updates, blow away its build dir, make a full build, and run the regresssions. The *Continuous* type will periodically check for updates and make and incremental build if any are found.
2. Create a "dashroot" directory where your dashboard will live and in the *dashroot* directory create the following subdirectories.
    ```bash
    mkdir -p dashroot/{Nightly,Continuous}/sensei-{vtk,libsim,catalyst}
    mkdir -p dashroot/logs
    ```
    Note that the brace notation all permutations are expressed, so the first line above is telling you to create 6 directories.
3. Pull the dashbaord scripts:
    ```bash
    cd dashroot
    git init
    git remote add origin git@github.com:burlen/SENSEI_ctest.git
    git pull origin master
    ```
5. In the scripts directory make a copy of one of the existing pairs of files to *hostname-config.cmake* and *hostname-test.sh*. Modify the copies of these files to fit the paths of your system. Back in the root directory make symlinks to the new copies. You will also need to set up the environment in the shell script. This assumes you have all of the necessary dependencies built and installed correctly. Installing the dependencies and configuring the build correctly is the hardest step of this process, and finer points are not documented here.
6. Setup a cron job to run the dashboard at a convinient time. For example use *crontab -e* and add one or both of the following.
    ```bash
    # Nightly
    0 6 * * * dashroot/hostname-test.sh Nightly
    # Continuous
    0,20,40 * * * * dashroot/hostname-test.sh Continuous
    ```

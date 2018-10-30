README

How to use:

Access the scripts folder and enter the command given below in terminal window:

./profiler.py [application name] [time of execution in ms (optional)]

The output is a .cfg file in the application folder. 



EXAMPLE OF EXECUTION

Execution of synthetic application.
Write in terminal window:

./profiler.py synthetic 100

This command creates a testcase file ([application name].cfg) in the testcases folder that is used to execute HeMPS.

[project name]
synthetic
[tasks per pe]
1
[processor description]
sc
[noc buffer size]
8
[noc routing algorithm]
xy
[mapping]
WithProfiler
[dimensions]
3
3
[cluster size]
3
3
[masters location]
LB
[global master]
0
[application]
synthetic

After that HeMPS is executed and the files below are analysed:

File platform.cfg read from: /$HEMPS_PATH/testcases/synthetic/debug/platform.cfg
File traffic_router.txt read from: /$HEMPS_PATH/testcases/synthetic/debug/traffic_router.txt
File log_energy.txt read from: /$HEMPS_PATH/testcases/synthetic/log_energy.txt

This files contains informations about the execution and are used to calculate the number of flits between tasks and load of each task.

The output of the execution is the file /HEMPS_PATH/applications/synthetic/synthetic.cfg, this file contains information about the initial tasks, load and communication between tasks. This file is used by the kernel when HeMPS is executed to better allocate the tasks.

<initialTasks>
taskA
taskB
<dependences>
<task>
taskF
<load>
1685382480
<comm>
taskE
6000
taskD
6000
<end task>
<task>
taskE
<load>
1685382480
<comm>
taskC
6000
taskF
6000
<end task>
<task>
taskD
<load>
1685382480
<comm>
taskC
6000
taskF
6000
<end task>
<task>
taskC
<load>
995821
<comm>
taskA
6000
taskB
6000
taskD
6000
taskE
6000
<end task>
<task>
taskB
<load>
1455381
<comm>
taskC
6000
<end task>
<task>
taskA
<load>
1685382480
<comm>
taskC
6000
<end task>
<end application>


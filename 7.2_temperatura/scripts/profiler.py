#!/usr/bin/env python
#DESCRIPTION: Generates the file .CFG in the application folder
#HOW TO EXECUTE: In terminal write:
#			./profiler.py [application_name] [time_of_execution_in_ms (not mandatory)]
#

import sys, os, time, glob, fnmatch, math
from sys import argv


application = str(sys.argv[1])
#The time of execution is not mandatory, if not informed use 100ms as default.
if len(sys.argv) > 2:
	time = str(sys.argv[2])
else:
	time = 100

hemps_path = os.environ['HEMPS_PATH'] 
testcase_path = hemps_path+"/testcases"
scripts_path = hemps_path+"/scripts"
applicationhmp = application + '.hmp'
print "Creating %r." % applicationhmp

#Get the number of .c files in the application folder.
applications_path = hemps_path+"/applications/"+application
numoffiles =  len(fnmatch.filter(os.listdir(applications_path), '*.c'))
testcaseAppFolder = testcase_path + "/" + application
applicationhmpfolder = testcase_path + "/" + applicationhmp
target = open(applicationhmpfolder, 'w')

projectname = application
tasksperpe = "1"
processordescription = "sc"
nocbuffersize = "8"
nocroutingalgorithm = "xy"
#Use mapping WithProfiler (1 task per pe)
mapping = "WithProfiler" 
#Clutersize is always a square matrix
aux = math.sqrt(numoffiles)
aux = int(aux)
if (aux*aux > numoffiles):
	dimension = "%d" % (aux)
	dimensions = "%d\n%d" % (aux, aux)
else:	
	dimension = "%d" % (aux+1)
	dimensions = "%d\n%d" % (aux+1,aux+1)
clustersize = dimensions
masterslocation = "LB"
globalmaster = "0"

#Write the .HMP file.
target.write("[project name]\n")
target.write(projectname)
target.write("\n")
target.write("[tasks per pe]\n")
target.write(tasksperpe)
target.write("\n")
target.write("[processor description]\n")
target.write(processordescription)
target.write("\n")
target.write("[noc buffer size]\n")
target.write(nocbuffersize)
target.write("\n")
target.write("[noc routing algorithm]\n")
target.write(nocroutingalgorithm)
target.write("\n")
target.write("[mapping]\n")
target.write(mapping)
target.write("\n")
target.write("[dimensions]\n")
target.write(dimensions)
target.write("\n")
target.write("[cluster size]\n")
target.write(clustersize)
target.write("\n")
target.write("[masters location]\n")
target.write(masterslocation)
target.write("\n")
target.write("[global master]\n")
target.write(globalmaster)
target.write("\n")
target.write("[application]\n")
target.write(application)
target.write("\n")
target.close()

#Run Hemps with the .HMP
os.chdir(testcase_path)
os.system("rm -rf %s" % testcaseAppFolder)
os.system("perl ../scripts/hemps.pl %s ../applications" % applicationhmp) 
os.chdir(testcaseAppFolder)
os.system("make all; ./HeMPS -c %s ms" % time)
			
#os.system("./run %s %s" % (applicationhmp, time)) 

#Run profiler.cpp to generate .CFG in the application folder
os.chdir(scripts_path)
os.system("g++ profiler.cpp -o profilerC")
os.system("./profilerC %s %s" % (application, dimension))

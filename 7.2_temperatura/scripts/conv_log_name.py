import sys, os, time, glob
from subprocess import call

log_list = []

for log in glob.glob("*.txt"):
    if log.find('~') != -1:
        continue
    print log
    f = open(log, "r")
    line = f.readline();
    if line.find("Initializing PE:") != -1: 
        new_name =  "log"+line.split(':')[1][8:-3]+"x"+line.split(':')[1][10:-1]+".txt"
        print new_name
        f.close()
        call(["mv", log, new_name])
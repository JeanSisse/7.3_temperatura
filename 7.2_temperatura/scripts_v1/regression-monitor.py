import sys, os, time, glob
from subprocess import call

def fail():
     return '\033[41;1;37mFAIL\033[0;0m'

def sucess():
    return '\033[42;1;37mPASSED\033[0;0m'

def running():
    return '\033[40;1;37mRUNNING\033[0;0m'


hemps_path = sys.argv[1]
testcase_path = hemps_path+"/testcases"
os.chdir(testcase_path)
testcase_list = []
testcase_simulation_cont = 0
l=0
for testcase in glob.glob("*.hmp"):
    
    if testcase.find('~') != -1:
        continue
    
    no_extension_name = testcase[:-4]
    testcase_list += no_extension_name,
    testcase_simulation_cont = testcase_simulation_cont + 1;
    if len(no_extension_name) > l:
        l = len(no_extension_name)
    
#print commands
#print testcase_list
#print testcase_simulation_cont

while 1 :
    call(["clear"])
    print '\n\n\033[0;1;37mREGRESSION MONITOR:\n'  
    print '{:>50}  {:>33}  {:>65}'.format('Testcase Name', 'Status', 'Execution time\033[0;0m')
    print ""
    passed = 0
    failed = 0
    run = 0
    checked_testcases = 0;
    for testcase in testcase_list:
    
        finish = 0;
        execution_time = 0;
        file_name = testcase+"/log/log0.txt"
        if os.path.isfile(file_name) == True:
            checked_testcases = checked_testcases + 1
            f = open(file_name, "r")
            
            if f.read() == "":
                finish = -1;
            else:
                f.seek(0);
                while 1:
                    line = f.readline();
                    if line == "":
                        break;
                    elif line.find("FINISH") != -1:
                        execution_time = line.split(' ')[1][:-2];
                        finish = 1
                        break
                  
            f.close()
            if finish == 1:
                passed = passed + 1
                print '{:>50}  {:>50}  {:>50}'.format(testcase, sucess(), execution_time)
            elif finish == 0:
                failed = failed + 1
                print '{:>50}  {:>50}  {:>50}'.format(testcase, fail(), '----')
            else:
                run = run + 1
                print '{:>50}  {:>50}  {:>50}'.format(testcase, running(), '----')
    print '\n\n\033[0;1;37mTotal testcases:      '+str(testcase_simulation_cont)
    print 'Simulated testcases:  '+str(checked_testcases)
    print 'Remaining testcases:  '+str(testcase_simulation_cont-checked_testcases)
    print 'Percent passed:       '+str(passed*100/(checked_testcases-run))+'%'
    print 'Percent failed:       '+str(failed*100/(checked_testcases-run))+'%'
    #print 'Percent running:      '+str(run*100/checked_testcases)+'%\033[0;0m'
    time.sleep(1)

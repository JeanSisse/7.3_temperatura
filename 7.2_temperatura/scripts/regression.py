import sys, os, time, glob
from subprocess import Popen, list2cmdline

def fail():
     return '\033[41;1;37mFAIL\033[0;0m'

def sucess():
    return '\033[42;1;37mPASSED\033[0;0m'

def cpu_count():
    ''' Returns the number of CPUs in the system
    '''
    num = 1
    if sys.platform == 'win32':
        try:
            num = int(os.environ['NUMBER_OF_PROCESSORS'])
        except (ValueError, KeyError):
            pass
    elif sys.platform == 'darwin':
        try:
            num = int(os.popen('sysctl -n hw.ncpu').read())
        except ValueError:
            pass
    else:
        try:
            num = os.sysconf('SC_NPROCESSORS_ONLN')
        except (ValueError, OSError, AttributeError):
            pass

    return num

def exec_commands(cmds):
    ''' Exec commands in parallel in multiple process 
    (as much as we have CPU)
    '''
    if not cmds: return # empty list

    def done(p):
        return p.poll() is not None
    def success(p):
        return p.returncode == 0
    def fail():
        sys.exit(1)

    max_task = cpu_count()
    processes = []
    while True:
        while cmds and len(processes) < max_task:
            task = cmds.pop()
            print list2cmdline(task)
            processes.append(Popen(task))

        for p in processes:
            if done(p):
                if success(p):
                    processes.remove(p)
                else:
                    fail()

        if not processes and not cmds:
            break
        else:
            time.sleep(0.05)
            
            
commands = []
testcase_list = [];
testcase_simulation_cont = 0

hemps_path = sys.argv[1]
simul_time = sys.argv[2]
testcase_path = hemps_path+"/testcases"

print testcase_path
os.chdir(testcase_path)
l = 0;

for testcase in glob.glob("*.hmp"):
    
    if testcase.find('~') != -1:
        continue
    no_extension_name = testcase[:-4]
    
    file_name = testcase_path+"/"+no_extension_name+"/output_master.txt"
    if os.path.isfile(file_name) == True:
        continue
    
    testcase_list += no_extension_name,
    commands += ['./run', testcase, simul_time],
    testcase_simulation_cont = testcase_simulation_cont + 1;
    if len(no_extension_name) > l:
        l = len(no_extension_name)
    
#print commands
#print testcase_list
#print testcase_simulation_cont
exec_commands(commands)

print '\n\n########################### REGRESSION REPORT ###########################\n'  
print '{:>50}  {:>50}  {:>50}'.format('Testcase Name', 'Status', 'Execution time')
print ""

for testcase in testcase_list:

    finish = 0;
    execution_time = 0;
    file_name = testcase+"/output_master.txt"
    if os.path.isfile(file_name) == True:
        
        f = open(file_name, "r")
        
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
            print '{:>50}  {:>50}  {:>50}'.format(testcase, sucess(), execution_time)
        else:
            print '{:>50}  {:>50}  {:>50}'.format(testcase, fail(), '----')
#!/usr/bin/perl
# hexadec.pl
use POSIX;

print "
  _   _      __  __ ____  ____    _____ 
 | | | | ___|  \\/  |  _ \\/ ___|  |___  |
 | |_| |/ _ \\ |\\/| | |_) \\___ \\     / / 
 |  _  |  __/ |  | |  __/ ___) |   / /  
 |_| |_|\\___|_|  |_|_|   |____/   /_/   
                                        
";

$path_applications=".";
#$app_repo_size = 60000;
$kernelSize=32;
$NoC_buffer_size=8;
$NoC_routing_algorithm="xy"; 
$hempsPath = $ENV{"HEMPS_PATH"};

	if ($hempsPath eq ""){
		print "
		Enviroment variable: HEMPS_PATH not defined.
		Please define in your .barch file:
		export HEMPS_PATH=<hemps root directory>
		export PATH=\$PATH:\$HEMPS_PATH/bin 
		";
		exit;
	} elsif ($ARGV[0] ne "") {

		$path = shift; 		    #caminho do projeto ou HMP		
		$path_applications = shift; #caminho das aplicacoes
		
	}

	else {
          print "

         Main script of the HeMPS platform
         
         Input:  project description (hmp file - see https://corfu.pucrs.br/redmine/projects/hemps/wiki)
               
         Usage:   hemps.pl <test>.hmp  [optional: path to the application]
         
         This step is responsible to compile the software (kernel and user applications) in the <test>/build. 
	 Any modification in the software may be done by using the makefile inside the build directory.
         
         Applications are search in the following order: (1) path specified by the user (if present); 
	 (2) current directory; (3) repository installation
         
          
         NEXT: 
         It is necessary to create the platform (i.e. - create the hardware): cd <test>;  make all

    	 THEN:
     	 Execute the applications specified in the project description:  ./HeMPS -c 10
     	 -c parameter corresponds to the simulation time in ms

     	 At the end of the execution it is expected the following message:

	        END OF ALL APPLICATIONS!!!
	        SystemC: simulation stopped by user.
	        END OF ALL APPLICATIONS!!!

         Tools to debug:  hemps-read.pl <test>.hmp, hemps-debugger; hemps-trace \n\n" ;


	  exit;
	}




# READ HMP FILE
($projectName, $pagesPerPe, $memorySize, $pageSize, $procDescription,
$x_dimensions, $y_dimensions, $x_cluster, $y_cluster, $mastersLocation,
$masterCluster) = read_hmp_file($path);

# CREATE CLUSTERS
create_clusters();
# SET PROCESSORS TYPE
set_processors_type();

# CREATE PROJECT
create_project();

# READ APPLICATIONS INFO
read_applications_info();

# TASK DEPENDENCES
initial_tasks();


# FIRST TIME  #######################

if($pagesPerPe > 0) {
	# PARAMETERS MEMORY
	parameters_memory_fake();

	# PARAMETERS NoC
	parameters_NoC();

	# Generates HeMPS_PKG
	generate_Hemps_PKG();

	#Generates application IDs files
	generate_app_id_files();

	#Generates ids_master.h
	generate_ids_master();

	#Generates ids_slave.h
	generate_ids_slave();

	#Generates hemps_param.h
	generate_hemps_param();

	# Generates makefile software
	generate_makefile_software();
	
	# PARAMETERS MEMORY
	parameters_memory();

	#Generates ids_master.h
	generate_ids_master();

	#Generates ids_slave.h
	generate_ids_slave();

	#Generates hemps_param.h
	generate_hemps_param();

	# Generates HeMPS_PKG
	generate_Hemps_PKG();

	# Generates makefile software
	generate_makefile_software();

}
else{
	# PARAMETERS MEMORY
	parameters_memory_per_memory_size();

	# PARAMETERS NoC
	parameters_NoC();

	# Generates HeMPS_PKG
	generate_Hemps_PKG();

	#Generates application IDs files
	generate_app_id_files();

	#Generates ids_master.h
	generate_ids_master();

	#Generates ids_slave.h
	generate_ids_slave();

	#Generates hemps_param.h
	generate_hemps_param();

	# Generates makefile software
	generate_makefile_software();

}

# Generates makefile hardware
generate_makefile_hardware();

# Generates sim.do
generate_sim_do();

# Generates wave.do
generate_wave_do();

#Generates Repositories
repositories();

#Generates Debugger files
generate_debugger_files();



#################################################################################################
################################## PARAMETERS NoC ###############################################
#################################################################################################

sub parameters_NoC{

#NoC Routing Algorithm
	opendir(DIR, "$hempsPath/hardware/router/sc/");

	(@aux)=readdir(DIR);
	@aux = sort @aux;
	$size_aux = @aux; 
	closedir(DIR);
	system("mkdir ./$projectName/hardware/ 2> /dev/null");
	system("mkdir ./$projectName/hardware/router/ 2> /dev/null");
	system("mkdir ./$projectName/hardware/router/sc/ 2> /dev/null");
	system("cp -rf $hempsPath/hardware/router/sc/* ./$projectName/hardware/router/sc 2> /dev/null");
			
	if($NoC_routing_algorithm ne ""){
		for($i=0; $i<$size_aux; $i++){
			if($aux[$i] =~ /switchcontrol_$NoC_routing_algorithm/ig){
				$aux[$i] =~ s/\n//ig;
				($aux2) = $aux[$i];
				
				if($aux[$i] =~ /.cpp/ig){
					($switchcontrol_cpp) = $aux[$i];
					$switchcontrol_cpp =~ s/\.cpp//ig;
				}
				else{
					($switchcontrol_h) = $aux[$i];
				}
			}
			elsif($aux[$i] =~ /switchcontrol_/ig){
				system("rm -rf ./$projectName/hardware/router/sc/$aux[$i] 2> /dev/null");
			}
		}
	}
	else{
		$switchcontrol_cpp="switchcontrol";
		$switchcontrol_h="switchcontrol.h";
	}

	system("sed 's/#include \"switchcontrol\.h\".*/#include \"$switchcontrol_h\"/ig' ./$projectName/hardware/router/sc/router_cc.h > ./$projectName/hardware/router/sc/router_cc.h.tmp && mv -f ./$projectName/hardware/router/sc/router_cc.h.tmp ./$projectName/hardware/router/sc/router_cc.h");


#NoC Buffer Size
	if($NoC_buffer_size ne ""){
		system("sed 's/#define BUFFER_TAM.*/#define BUFFER_TAM $NoC_buffer_size/ig' ./$projectName/hardware/router/sc/packet.h > ./$projectName/hardware/router/sc/packet.h.tmp && mv -f ./$projectName/hardware/router/sc/packet.h.tmp ./$projectName/hardware/router/sc/packet.h");
	}
}

#################################################################################################
################################## Generates Repositories #######################################
#################################################################################################

sub repositories{

### REPOSITORY SYSTEMC	

	open( C_FILE_H, ">./$projectName/repository.h" );

	print C_FILE_H "#ifndef _repository\n";
	print C_FILE_H "#define _repository\n\n";
	
	print C_FILE_H "\t#define NUMBER_OF_APPS ".$numberAPPs."\n";
	print C_FILE_H "\tint appstime[".$numberAPPs."] = {";

	$pastTime=0;
	$delay=0;
	for($i=0; $i<$numberAPPs; $i++){
		($delay)=$StartTimeApp[$i]-$pastTime;
		$pastTime=$StartTimeApp[$i];
		print C_FILE_H "$delay,";
	}
	print C_FILE_H "};\n";

	$aux_repo_size=$app_repo_size*$cont_app_new;
	
	print C_FILE_H "\t#define REPO_SIZE\t".$aux_repo_size."\n";
	print C_FILE_H "\tunsigned int repository[REPO_SIZE] = {		\n";
	print C_FILE_H "     											\n";
	

### REPOSITORY VHDL

	open( C_FILE_VHD, ">./$projectName/repository.vhd" );
	
	print C_FILE_VHD "-------------------------------------------------------------------------------------\n";
	print C_FILE_VHD "--\tPartial Repository																\n";
	print C_FILE_VHD "--\t\tContains the object codes of the tasks inserted on runtime						\n";
	print C_FILE_VHD "-------------------------------------------------------------------------------------\n";
	print C_FILE_VHD "--repository structure:																\n";
	print C_FILE_VHD "--[/this structure is replicaded according the number of tasks]						\n";
	print C_FILE_VHD "--number of tasks																	\n";
	print C_FILE_VHD "--task id																			\n";
	print C_FILE_VHD "--task code size																		\n";
	print C_FILE_VHD "--processor (ffffffff means dynamic allocation)										\n";
	print C_FILE_VHD "--task code start address															\n";
	print C_FILE_VHD "--[/this structure is replicaded according the number of tasks]						\n";
	print C_FILE_VHD "--tasks codes																		\n";
	print C_FILE_VHD "-------------------------------------------------------------------------------------\n";
	print C_FILE_VHD "library IEEE;																		\n";
	print C_FILE_VHD "use IEEE.Std_Logic_1164.all;														  \n\n";
	print C_FILE_VHD "package memory_pack is 															  \n\n";
	print C_FILE_VHD "\tconstant NUMBER_OF_APPS\t\t\t: integer := ".$numberAPPs.";\n";
	
	print C_FILE_VHD "\ttype timearray is array(0 to NUMBER_OF_APPS) of time;\n";
	print C_FILE_VHD "\tconstant appstime : timearray := (";

	$pastTime=0;
	$delay=0;
	for($i=0; $i<$numberAPPs; $i++){
		($delay)=$StartTimeApp[$i]-$pastTime;
		$pastTime=$StartTimeApp[$i];
		print C_FILE_VHD "$delay ms,";
	}
		print C_FILE_VHD "0 ms";

	print C_FILE_VHD ");\n";
	
	print C_FILE_VHD "\tconstant REPOSITORY_SIZE	: integer := ".$aux_repo_size.";\n"; 
	print C_FILE_VHD "\ttype ram is array (0 to REPOSITORY_SIZE) of std_logic_vector(31 downto 0);		  \n\n";
	print C_FILE_VHD "\tsignal memory : ram := (		
														\n";
														
	$cont_app_new=0;
	$application_new[0]=-1;					
	for($i=0; $i<$numberAPPs; $i++){
		$application_new[$i]=-1;													

	}
	for($i=0; $i<$numberAPPs; $i++){
		
		$cont_aux=0;
		for($g=0; $g<=$cont_app_new; $g++){
			if($applications[$i] eq $application_new[$g]){
				$cont_aux=1;
				last;
				}
		}
		if($cont_aux == 0){
			$application_new[$cont_app_new]=$applications[$i];


		# Sets the first task object code start in the repositoty
		$initialAddressCode= (26 * $size_apps[$i]) + 11 + ($app_repo_size*$cont_app_new);
		
		$codeCont = (26 * $size_apps[$i]) + 11;
		

		# Creates the repository file
		
		print C_FILE_VHD "\t\tx\"".sprintf("%08x", $size_apps[$i])."\",\t --application $applications[$i]\t#id $i\n";
		print C_FILE_H "\t\t0x".sprintf("%08x", $size_apps[$i]).",\t //application $applications[$i]\t#id $i\n";

		$cont=0;
		
		for($j=0; $j<$size_apps[$i]; $j++){
			if($initTasks[$i][$j][0] != -1){
				
				print C_FILE_VHD "\t\tx\"".sprintf("%08x", $applications_Tasks_id[$i][$j][0])."\",\t --initial task id $applications_Tasks[$i][$j]\n";
				print C_FILE_H "\t\t0x".sprintf("%08x", $applications_Tasks_id[$i][$j][0]).",\t //initial task $applications_Tasks[$i][$j]\n";
				$cont++;
			}
		}
		
		for($h=$cont; $h<10; $h++){
			print C_FILE_VHD "\t\tx\"ffffffff\",\n";
			print C_FILE_H "\t\t0xffffffff,\n";
		}

		for($j=0; $j<$size_apps[$i]; $j++){
			$name_aux = $applications_Tasks[$i][$j];
			$name_aux =~ s/\.c//ig;
			$ids_aux = ($cont_app_new << 8) | $applications_Tasks_id[$i][$j][0];

			open( C_FILE, "<./$projectName/build/$name_aux\_$ids_aux\.txt" );
			my @c_lines = <C_FILE>;
			close(C_FILE);
			
			$code_size = @c_lines;

			$x_master_h= sprintf("%x", $x_master);
			
			$cont_sta=0;
						
			$static_task=-1;
			for($t=0; $t<$size_apps[$i]*3; $t++){
			
				if($static_app[$i][$t] eq $name_aux){
					$static_task=$static_app[$i][$t+1];
				}
			}
			
			$task_full_name = $name_aux."_".$applications_Tasks_id[$i][$j][0];
			
			$command = "mips-elf-size $projectName/build/$name_aux\_$ids_aux\.bin | tail -1 | sed 's/ //g' | sed 's/\t/:/g' | cut -d':' -f2";
			
			$data_size = qx{$command};
			
			$command = "mips-elf-size $projectName/build/$name_aux\_$ids_aux\.bin | tail -1 | sed 's/ //g' | sed 's/\t/:/g' | cut -d':' -f3";
			
			$bss_size = qx{$command};
			
			while($data_size % 4 != 0){
				$data_size++;
			}
			
			while($bss_size % 4 != 0){
				$bss_size++;
			}
			
			$data_size = $data_size / 4;
			
			$bss_size = $bss_size / 4;
						
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $applications_Tasks_id[$i][$j][0])."\",\t --$applications_Tasks[$i][$j]\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $applications_Tasks_id[$i][$j][0]).",\t //$applications_Tasks[$i][$j]\n";
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $code_size)."\",\t --code size\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $code_size).",\t //code size\n";
			
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $data_size)."\",\t --data size\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $data_size).",\t //data size\n";
			
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $bss_size)."\",\t --bss size\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $bss_size).",\t //bss size\n";
			
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $initialAddressCode * 4)."\",\t --initial address\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $initialAddressCode * 4).",\t //initial address\n";	
		#	if($static_task == -1){
		#		print C_FILE_VHD "\t\tx\"ffffffff\",\t --static position\n";
		#		print C_FILE_H "\t\t0xffffffff,\t //static position\n";	
		#		}
		#	else{
		#		print C_FILE_VHD "\t\tx\"".sprintf("%08x", $static_task )."\",\t --static position\n";
		#		print C_FILE_H "\t\t0x".sprintf("%08x", $static_task ).",\t //static position\n";	

		#	}
		
			print C_FILE_VHD "\t\tx\"".sprintf("%08x", $load_Tasks[$i][$j] )."\",\t --load\n";
			print C_FILE_H "\t\t0x".sprintf("%08x", $load_Tasks[$i][$j] ).",\t //load\n";	
			$initialAddressCode = $initialAddressCode + $code_size;

			$codeCont = $codeCont + $code_size;
		

			$cont=0;
			for($t=0; $t<$size_apps[$i]; $t++){
				if(($depTasks_txt[$i][$j][$t] ne -1) and ($depTasks_txt[$i][$j][$t] ne "")){
										
					print C_FILE_VHD "\t\tx\"".sprintf("%08x", $depTasks_txt[$i][$j][$t])."\",\n";
					print C_FILE_H "\t\t0x".sprintf("%08x", $depTasks_txt[$i][$j][$t]).",\n";
					print C_FILE_VHD "\t\tx\"".sprintf("%08x", $depTasks_txt_load[$i][$j][$t][0])."\",\n";
					print C_FILE_H "\t\t0x".sprintf("%08x", $depTasks_txt_load[$i][$j][$t][0]).",\n";
					$cont++;
				}
			}
			
			for($k=$cont; $k<10; $k++){
				print C_FILE_VHD "\t\tx\"ffffffff\",\n";
				print C_FILE_VHD "\t\tx\"ffffffff\",\n";
				print C_FILE_H "\t\t0xffffffff,\n";
				print C_FILE_H "\t\t0xffffffff,\n";
			}
		}
		for($j=0; $j<$size_apps[$i]; $j++){
			$name_aux = $applications_Tasks[$i][$j];
			$name_aux =~ s/\.c//ig;
			
			$ids_aux = ($cont_app_new << 8) | $applications_Tasks_id[$i][$j][0];
			
			open( C_FILE, "<./$projectName/build/$name_aux\_$ids_aux\.txt" );
			my @c_lines = <C_FILE>;
			close(C_FILE);
			
			$code_size = @c_lines;
			$first=0;

			for($t=0; $t<$code_size; $t++){
				$c_lines[$t] =~ s/\n//ig;
				if($first == 0){
					print C_FILE_VHD "\t\tx\"".$c_lines[$t]."\",\t --$applications_Tasks[$i][$j]\n";
					print C_FILE_H "\t\t0x".$c_lines[$t].",\t //$applications_Tasks[$i][$j]\n";
					$first++;
				}
				else{
					print C_FILE_VHD "\t\tx\"".$c_lines[$t]."\",\n";
					print C_FILE_H "\t\t0x".$c_lines[$t].",\n";

				}
			}		
		}

		for($t=$codeCont; $t<$app_repo_size; $t++){
				print C_FILE_VHD "\t\tx\"00000000\",\n";
				print C_FILE_H "\t\t0x00000000,\n";
				$count_lines++

		}

			$cont_app_new++;

		}	
	}

	print C_FILE_VHD "\t\t(others=>'0'));\n";
	print C_FILE_VHD "end memory_pack;\n";
	
	print C_FILE_H "};\n";
	print C_FILE_H "\n";
	print C_FILE_H "#endif\n";	


	close(C_FILE_VHD);
	close(C_FILE_H);

}

#################################################################################################
################################## Generates ids_slave.h #######################################
#################################################################################################

sub generate_ids_slave{
	
	open( C_FILE, ">./$projectName/build/ids_slave.h" );
	
	$aux= $pageSize*1024;
	
	print C_FILE "#define MAX_PROCESSORS\t\t".$slaveProcessors."\t/* Number of slave processors available in the platform */\n";
	print C_FILE "#define MAXLOCALTASKS\t\t".$maxTasksSlave."\t/* Number of task which can be allocated simultaneously in one processor */\n";
	print C_FILE "#define MAX_GLOBAL_TASKS\tMAXLOCALTASKS * MAX_PROCESSORS\t/* Number of task which can be allocated simultaneously in the platform */\n";
	print C_FILE "#define KERNELPAGECOUNT\t".$kernelPages."\n";
	print C_FILE "#define PAGESIZE\t\t\t".$aux."\n";
	print C_FILE "#define APP_NUMBER\t\t".$numberAPPs."\n";
	print C_FILE "#define TASK_NUMBER\t\t".$taskNumber."\n";
	print C_FILE "#define MAX_APP_SIZE\t\t".$max_app_size."\n";   
					          
	print C_FILE "int task_location[APP_NUMBER][MAX_APP_SIZE] = { ";
	for($i=0; $i<$numberAPPs; $i++){
		print C_FILE "{";
		for($j=0; $j<$max_app_size; $j++){	
			print C_FILE "-1, ";
		}
		print C_FILE "}, ";
	}
	print C_FILE "};\n";
	
	print C_FILE "unsigned char task_status[APP_NUMBER][MAX_APP_SIZE] = { ";
	for($i=0; $i<$numberAPPs; $i++){
		print C_FILE "{";
		for($j=0; $j<$max_app_size; $j++){	
			print C_FILE "0, ";
		}
		print C_FILE "}, ";
	}
	print C_FILE "};\n";
	
	print C_FILE "int request_task[APP_NUMBER][MAX_APP_SIZE] = {";
	for($i=0; $i<$numberAPPs; $i++){
		print C_FILE "{";
		for($j=0; $j<$max_app_size; $j++){	
			print C_FILE "-1, ";
		}
		print C_FILE "}, ";
	}
	print C_FILE "};\n";
	close(C_FILE);
}

#################################################################################################
################################## Generates ids_master.h #######################################
#################################################################################################

sub generate_ids_master{
	
	
	$cont_app_new=0;
	$app_repo_size=0;

	for($i=0; $i<$numberAPPs; $i++){
		$application_new[$i]=-1;													

	}
	for($i=0; $i<$numberAPPs; $i++){
		
		$cont_aux=0;
		for($g=0; $g<=$cont_app_new; $g++){
			if($applications[$i] eq $application_new[$g]){
				$cont_aux=1;
				last;
				}
		}
		if($cont_aux == 0){
			for($j=0; $j<$size_apps[$i]; $j++){
				$name_aux = $applications_Tasks[$i][$j];
				$name_aux =~ s/\.c//ig;
				$ids_aux = ($cont_app_new << 8) | $applications_Tasks_id[$i][$j][0];
				open( C_FILE, "<./$projectName/build/$name_aux\_$ids_aux\.txt" );
				my @c_lines = <C_FILE>;
				close(C_FILE);
				
				$app_repo_size_aux += @c_lines + 26;
				#print "app_repo_size_aux $app_repo_size_aux $name_aux\_$ids_aux\.txt\n"; 
			}
			
			$app_repo_size_aux += 11;
			$app_repo_size_aux = $app_repo_size_aux;
			
			if($app_repo_size < $app_repo_size_aux){
				($app_repo_size) = $app_repo_size_aux;
			}
			
			$app_repo_size_aux = 0;
			
			
			$application_new[$cont_app_new]=$applications[$i];
			$cont_app_new++;
		}
	}
	
	($slaveProcessors) = ($x_dimensions * $y_dimensions) - $localMastersCont;
	($maxClusterTasks) = $maxTasksSlave * ((($x_dimensions * $y_dimensions) - $localMastersCont)/ $localMastersCont);
	
	$totalProcessors= $slaveProcessors+$localMastersCont;
	
	open( C_FILE, ">./$projectName/build/ids_master.h" );
	
	print C_FILE "#ifndef __ids_master_h__\n";	
	print C_FILE "#define __ids_master_h__\n";
	print C_FILE "/*--------------------------------------------------------------------\n";
	print C_FILE " * struct ClusterInfo\n";
	print C_FILE " *\n";
	print C_FILE " * DESCRIPTION:\n";
	print C_FILE " *    Store the clusters information\n";
	print C_FILE " *\n";
	print C_FILE " *--------------------------------------------------------------------*/\n";
	print C_FILE "typedef struct {\n";
	print C_FILE "\tint master_x;\n";
	print C_FILE "\tint master_y;\n";
	print C_FILE "\tint leftbottom_x;\n";
	print C_FILE "\tint leftbottom_y;\n";
	print C_FILE "\tint topright_x;\n";
	print C_FILE "\tint topright_y;\n";
	print C_FILE "\tint free_resources;\n";
	print C_FILE "} ClusterInfo;\n";
	print C_FILE "\n";	
	#print C_FILE "#define TOTAL_PROCESSORS\t\t".$totalProcessors."\t/* Number of processors available in the platform */\n";
	print C_FILE "#define MAX_PROCESSORS\t\t".$slaveProcessors."\t/* Number of slave processors available in the platform */\n";
	print C_FILE "#define MAX_LOCAL_TASKS\t\t".$maxTasksSlave."\t/* Number of task which can be allocated simultaneously in one processor */\n";
	print C_FILE "#define MAX_CLUSTER_TASKS\t\t".$maxClusterTasks."\t/* Number of task which can be allocated simultaneously in one processor */\n";
	print C_FILE "#define MAX_GLOBAL_TASKS\tMAX_LOCAL_TASKS * MAX_PROCESSORS\t/* Number of task which can be allocated simultaneously in the platform */\n";
	print C_FILE "#define XDIMENSION\t\t".$x_dimensions."\n";
	print C_FILE "#define YDIMENSION\t\t".$y_dimensions."\n";
	print C_FILE "#define XCLUSTER\t\t".$x_cluster."\n";
	print C_FILE "#define YCLUSTER\t\t".$y_cluster."\n";
	#print C_FILE "#define MASTERADDRESS\t\t0x".$x_master_h.$y_master_h."\n";
	print C_FILE "#define CLUSTER_NUMBER\t\t".$localMastersCont."\n";
	print C_FILE "#define APP_NUMBER\t\t".$numberAPPs."\n";
	print C_FILE "#define TASK_NUMBER\t\t".$taskNumber."\n";
	print C_FILE "#define MAX_APP_SIZE\t\t".$max_app_size."\n";
	print C_FILE "#define APP_REPO_SIZE\t\t".$app_repo_size."\n";
	print C_FILE "\n";
	for($g=0; $g<$cont_app_new; $g++){
		print C_FILE "#define $application_new[$g] ".$g."\n";
	}
	
	print C_FILE "unsigned int energySlavesAcc[XDIMENSION][YDIMENSION];\n";
	
	print C_FILE "unsigned int energySlavesAcc_discretizado[XDIMENSION][YDIMENSION];\n";
	
	print C_FILE "unsigned int energyLocalClusterAcc;\n";
	
	print C_FILE "unsigned int energyClustersAcc[CLUSTER_NUMBER];\n";

	print C_FILE "\n//Application id relation\n";	
	print C_FILE " int appstype[".$numberAPPs."] = {";

	for($i=0; $i<$numberAPPs; $i++){
			
		for($g=0; $g<=$cont_app_new; $g++){
			if($applications[$i] eq $application_new[$g]){
			print C_FILE "$application_new[$g],";
			last;
			}
		}
	}
	print C_FILE "};\n\n";
	

	print C_FILE " int proc_available = ".$maxClusterTasks.";\n";
	
	print C_FILE " int task_location[APP_NUMBER][MAX_APP_SIZE] = { ";	
	for($i=0; $i<$numberAPPs; $i++){
		print C_FILE "{";
		for($j=0; $j<$max_app_size; $j++){
			print C_FILE "-1, ";
		}
		print C_FILE "}, ";
	}
	print C_FILE "};\n";
	
	print C_FILE " int task_terminated[APP_NUMBER][MAX_APP_SIZE] = { ";	
	for($i=0; $i<$numberAPPs; $i++){
		print C_FILE "{";
		for($j=0; $j<$max_app_size; $j++){
			print C_FILE "-1, ";
		}
		print C_FILE "}, ";
	}
	print C_FILE "};\n\n";	

	print C_FILE "char proc_free_pages[XDIMENSION][YDIMENSION] = {";	
	for($i=1; $i<$x_dimensions; $i++){
		print C_FILE "{";
		for($j=1; $j<$y_dimensions; $j++){
			print C_FILE "MAX_LOCAL_TASKS, ";	
		}
		print C_FILE "MAX_LOCAL_TASKS}, ";	
	}
	print C_FILE "{";
	for($j=1; $j<$y_dimensions; $j++){
		print C_FILE "MAX_LOCAL_TASKS, ";
	}
	print C_FILE "MAX_LOCAL_TASKS}};\n";
	
	print C_FILE " int applications_terminated[APP_NUMBER] = {";
	for($i=1; $i<$numberAPPs; $i++){
		print C_FILE "-1, ";
	}
	print C_FILE "-1};\n";

	#print C_FILE " int clusters_ocupation[CLUSTER_NUMBER] = {";
	#for($i=1; $i<($localMastersCont); $i++){
	#	print C_FILE "0, ";
	#}
	#print C_FILE "0};\n";
	
	 print C_FILE " int proc_load_total[XDIMENSION][YDIMENSION] = {";	
	 for($i=1; $i<$x_dimensions; $i++){
		 print C_FILE "{";
		 for($j=1; $j<$y_dimensions; $j++){
			 print C_FILE "0, ";	
		 }
		 print C_FILE "0}, ";	
	 }
	 print C_FILE "{";
	 for($j=1; $j<$y_dimensions; $j++){
		 print C_FILE "0, ";
	 }
	 print C_FILE "0}};\n";
	
# # 	print C_FILE " int global_inst_aux[TOTAL_PROCESSORS] = {";	
	# for($i=0; $i<$totalProcessors; $i++){
			# print C_FILE "0, ";	
		# }
		# print C_FILE "};\n";	
	
# # 	
	# print C_FILE " int global_inst_per_cluster[CLUSTER_NUMBER] = {";
	# for($i=1; $i<($localMastersCont); $i++){
		# print C_FILE "0, ";
	# }
	# print C_FILE "0};\n";	
	
# # 	print C_FILE " int global_inst_dev_per_cluster[CLUSTER_NUMBER] = {";
	# for($i=1; $i<($localMastersCont); $i++){
		# print C_FILE "0, ";
	# }
	# print C_FILE "0};\n";

	print C_FILE " int clusters_load[CLUSTER_NUMBER] = {";
	for($i=1; $i<($localMastersCont); $i++){
		print C_FILE "0, ";
	}
	print C_FILE "0};\n";


	print C_FILE "ClusterInfo cluster_info[CLUSTER_NUMBER] = {\n";

	
	for($i=0; $i<($size_clusters); $i++){
		print C_FILE "\t{".$clusters[$i][4].",".$clusters[$i][5].",".$clusters[$i][0].",".$clusters[$i][1].",".$clusters[$i][2].",".$clusters[$i][3].",".$maxClusterTasks."},\n";
	}

	print C_FILE "};\n\n";
	print C_FILE "#endif\n";	

	close(C_FILE);
}

#################################################################################################
################################## Generates application IDs files ##############################
#################################################################################################

sub generate_app_id_files{
	
	for($i=0; $i<$numberAPPs; $i++){
		
		open( C_FILE, ">./$projectName/build/ids_$applications[$i]\.h" );
		for($j=0; $j<$size_apps[$i]; $j++){
			$name_aux = $applications_Tasks[$i][$j];
			$name_aux =~ s/\.c//ig;
			print C_FILE "#define $name_aux\t\t$applications_Tasks_id[$i][$j][0]\n";
		}
		
		close(C_FILE);
	}	
}

#################################################################################################
################################## Generates wave.do ############################################
#################################################################################################

sub generate_wave_do{
	
	open( C_FILE, ">./$projectName/wave.do" );

if ($procDescription eq "rtl"){
		print C_FILE "onerror {resume}\n"; 
		print C_FILE "quietly WaveActivateNextPane {} 0\n";
		print C_FILE "add wave /test_bench/hemps/clock\n";
		
		print C_FILE "add wave  -divider repository\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/ack_app\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/req_app\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/control_hemps_addr\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/control_hemps_data\n";
		print C_FILE "add wave  -divider Slaves\n";
		
		for($i=0; $i< ($x_dimensions*$y_dimensions); $i++){
			
				$x = 0; 
				$y = 0;
				
				$addr = $i;
				while ($addr - $x_dimensions >= 0){
					$addr -= $x_dimensions;
					$y = $y + 1;
				}
				$x = $addr;
				
				$is_cluster_x = $x;
				$is_cluster_y = $y;
				
				while($is_cluster_x > 0){
					$is_cluster_x = $is_cluster_x - $x_cluster;
				}
				while($is_cluster_y > 0){
					$is_cluster_y = $is_cluster_y - $y_cluster;
				}
				
				$pe_name = "slav/slave";
				
				if ($i == $masterAddress){
					$pe_name = "mas/master";
				} elsif ($is_cluster_x == 0 && $is_cluster_y == 0){
					$pe_name = "loc/slave";
				}
				
				#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/router/address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/clock\n";
				if ($pe_name eq "slave"){
					#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/".$pe_name."$i/clock_hold\n";
					#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/".$pe_name."$i/clock_aux\n";
				} elsif($pe_name eq "mas/master"){
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/ack_app\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/req_app\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/address\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/data_read\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/cpu_repo_access\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/repo_FSM\n";
					
				}
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/tx\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/credit_i\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/data_out\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/rx\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/credit_o\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/data_in\n";
				
				
				
				
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/operation\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/set_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/set_address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/set_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/set_size_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/set_op\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/start\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/size_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/config_data\n";
				

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/ARB\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/prio\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/timer\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/write_enable\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/read_enable\n";

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/DMNI_Send\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/send_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/mem_data_read\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/send_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/send_address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/send_size_2\n";	

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/DMNI_Receive\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/recv_address\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/mem_data_write\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/recv_size\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/mem_byte_we\n";	
				
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/intr\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/intr_count\n";			
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/SR\n";	
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/payload_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/read_av\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/slot_available\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/first\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/last\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/add_buffer\n";
				

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/mem_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/is_header\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/send_active\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/u3_dmni/receive_active\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/current_page\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/cpu_mem_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/plasma/write_enable\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/rx(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/credit_o(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/data_in(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/rx(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/credit_o(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/data_in(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/rx(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/credit_o(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/data_in(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/rx(3)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/credit_o(3)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/HeMPS/proc($i)/".$pe_name."/PE_PLASMA/data_in(3)\n";
					
			
		}

		
		print C_FILE "TreeUpdate [SetDefaultTree]\n";
		print C_FILE "WaveRestoreCursors {{Cursor 1} {1627970253 ps} 0}\n";
		print C_FILE "configure wave -namecolwidth 190\n";
		print C_FILE "configure wave -valuecolwidth 100\n";
		print C_FILE "configure wave -justifyvalue left\n";
		print C_FILE "configure wave -signalnamewidth 1\n";
		print C_FILE "configure wave -snapdistance 10\n";
		print C_FILE "configure wave -datasetprefix 0\n";
		print C_FILE "configure wave -rowmargin 4\n";
		print C_FILE "configure wave -childrowmargin 2\n";
		print C_FILE "configure wave -gridoffset 0\n";
		print C_FILE "configure wave -gridperiod 1\n";
		print C_FILE "configure wave -griddelta 40\n";
		print C_FILE "configure wave -timeline 0\n";	
		print C_FILE "configure wave -timelineunits ps\n";
		print C_FILE "update\n";
		print C_FILE "WaveRestoreZoom {0 ps} {3198211064 ps}\n";

	}
	else
	{
	
		print C_FILE "onerror {resume}\n"; 
		print C_FILE "quietly WaveActivateNextPane {} 0\n";
		print C_FILE "add wave /test_bench/hemps/clock\n";
	
		print C_FILE "add wave  -divider repository\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/ack_app(0)\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/req_app(0)\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/address(0)\n";
		print C_FILE "add wave  -radix hexadecimal /test_bench/data_read(0)\n";
		print C_FILE "add wave  -divider Slaves\n";
	
		for($i=0; $i< ($x_dimensions*$y_dimensions); $i++){
		
				$x = 0; 
				$y = 0;
			
				$addr = $i;
				while ($addr - $x_dimensions >= 0){
					$addr -= $x_dimensions;
					$y = $y + 1;
				}
				$x = $addr;
			
				$is_cluster_x = $x;
				$is_cluster_y = $y;
			
				while($is_cluster_x > 0){
					$is_cluster_x = $is_cluster_x - $x_cluster;
				}
				while($is_cluster_y > 0){
					$is_cluster_y = $is_cluster_y - $y_cluster;
				}
			
				$pe_name = "slave";
			
				if ($i == $masterAddress){
					$pe_name = "master";
				} elsif ($is_cluster_x == 0 && $is_cluster_y == 0){
					$pe_name = "local";
				}
			
				#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/router/address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/clock\n";
				if ($pe_name eq "slave"){
					#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/clock_hold\n";
					#print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/clock_aux\n";
				} elsif($pe_name eq "master"){
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/ack_app\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/req_app\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/address\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/data_read\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/cpu_repo_acess\n";
					print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} /test_bench/hemps/".$pe_name."$i/repo_FSM\n";
				
				}
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/tx_ni\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_i_ni\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {ni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_out_ni\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/rx_ni\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_o_ni\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_in_ni\n";
			
			
			
			
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/operation\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/set_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/set_address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/set_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/set_size_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/set_op\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/start\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/size_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {config $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/config_data\n";
			

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/ARB\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/prio\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/timer\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/write_enable\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {arb $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/read_enable\n";

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/DMNI_Send\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/send_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/mem_data_read\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/send_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/send_address_2\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {send $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/send_size_2\n";	

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/DMNI_Receive\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/recv_address\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/mem_data_write\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/recv_size\n";		
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/mem_byte_we\n";	
			
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/intr\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/intr_count\n";			
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/SR\n";	
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/payload_size\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/read_av\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/slot_available\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/first\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/last\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -group {receive NoC $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/add_buffer\n";
			

				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/mem_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/is_header\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/send_active\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {dmni $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/dmni/receive_active\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/current_page\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/cpu_mem_address\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/write_enable\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/pending_service\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {proc $x$y} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/irq_status\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/rx(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_o(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input LESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_in(0)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/rx(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_o(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input OESTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_in(1)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/rx(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_o(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input NORTE} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_in(2)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/rx(3)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/credit_o(3)\n";
				print C_FILE "add wave  -group {".$pe_name." $x$y - ".$i."} -group {router $x$y input SUL} -radix hexadecimal /test_bench/hemps/".$pe_name."$i/data_in(3)\n";
				
		
		}

	
		print C_FILE "TreeUpdate [SetDefaultTree]\n";
		print C_FILE "WaveRestoreCursors {{Cursor 1} {1627970253 ps} 0}\n";
		print C_FILE "configure wave -namecolwidth 190\n";
		print C_FILE "configure wave -valuecolwidth 100\n";
		print C_FILE "configure wave -justifyvalue left\n";
		print C_FILE "configure wave -signalnamewidth 1\n";
		print C_FILE "configure wave -snapdistance 10\n";
		print C_FILE "configure wave -datasetprefix 0\n";
		print C_FILE "configure wave -rowmargin 4\n";
		print C_FILE "configure wave -childrowmargin 2\n";
		print C_FILE "configure wave -gridoffset 0\n";
		print C_FILE "configure wave -gridperiod 1\n";
		print C_FILE "configure wave -griddelta 40\n";
		print C_FILE "configure wave -timeline 0\n";	
		print C_FILE "configure wave -timelineunits ps\n";
		print C_FILE "update\n";
		print C_FILE "WaveRestoreZoom {0 ps} {3198211064 ps}\n";	
	}
	close(C_FILE);
	
	
}

#################################################################################################
################################## Generates hemps_param.h ######################################
#################################################################################################

sub generate_hemps_param{
	open( C_FILE, ">./$projectName/hemps_param.h");
	print C_FILE "// Parametrizable Values";
	$aux=$pageSize*1024;
	print C_FILE "\n#define PAGESIZE\t\t\t".$aux."\n";	
	close(C_FILE);
}

#################################################################################################
################################## Generates sim.do #############################################
#################################################################################################

sub generate_sim_do{
	open( C_FILE, ">./$projectName/sim.do" );
	
	print C_FILE "vsim -novopt -t ps +notimingchecks work.test_bench\n"; 
	print C_FILE "\n";
	print C_FILE "do wave.do\n";
	print C_FILE "onerror {resume}\n";
	print C_FILE "radix hex\n";
	print C_FILE "set NumericStdNoWarnings 1\n";
	print C_FILE "set StdArithNoWarnings 1\n";
	print C_FILE "\n";
 	if($procDescription eq "rtl"){
        print C_FILE "when -label end_of_simulation { hemps/proc($masterAddress)/mas/master/PE_PLASMA/plasma/end_sim_reg == x\"00000000\" } {echo \"End of simulation\" ; quit ;}\n";
 	} else {
		print C_FILE "when -label end_of_simulation { hemps/master$masterAddress/end_sim_reg == x\"00000000\" } {echo \"End of simulation\" ; quit ;}\n";
 	}
 	
	close(C_FILE);

}

#################################################################################################
################################## Generates makefile hardware ##################################
#################################################################################################

sub generate_makefile_hardware{
	
	open( C_FILE, ">./$projectName/makefile" );
	
	print C_FILE "LIB=work\n";
	print C_FILE "\n";
	print C_FILE "#this environment variable must point to the hemps path, where the hardware, software and tools folders are located\n";
	print C_FILE "BASE_PATH=\$(HEMPS_PATH)\n";
	print C_FILE "HW_PATH=hardware\n";
	print C_FILE "\n";
	print C_FILE "#VHDL files\n";
	print C_FILE "PKG_SRC=HeMPS_defaults.vhd\n";
	print C_FILE "PKG_DIR=\$(HW_PATH)\n";
	print C_FILE "PKG_PATH=\$(addprefix \$(PKG_DIR)/,\$(PKG_SRC))\n";
	print C_FILE "\n";
	print C_FILE "SCENARIO_SRC=HeMPS_PKG repository\n";
	print C_FILE "SCENARIO_DIR=./\n";
	print C_FILE "SCENARIO_PATH=\$(addprefix \$(SCENARIO_DIR)/,\$(SCENARIO_SRC))\n";
	print C_FILE "\n";
	print C_FILE "MPACK_SRC=mlite_pack.vhd UartFile.vhd\n";
	print C_FILE "MPACK_DIR=\$(HW_PATH)/plasma/rtl\n";
	print C_FILE "MPACK_PATH=\$(addprefix \$(MPACK_DIR)/,\$(MPACK_SRC))\n";
	print C_FILE "\n";
	print C_FILE "MLITE_SRC=alu.vhd bus_mux.vhd control.vhd mem_ctrl.vhd mult.vhd pc_next.vhd pipeline.vhd reg_bank.vhd shifter.vhd mlite_cpu.vhd\n";
	print C_FILE "MLITE_DIR=\$(HW_PATH)/plasma/rtl\n";
	print C_FILE "MLITE_PATH=\$(addprefix \$(MLITE_DIR)/,\$(MLITE_SRC))\n";
	print C_FILE "\n";
	print C_FILE "DMNI_SRC=dmni.vhd\n";
	print C_FILE "DMNI_DIR=\$(HW_PATH)/dmni/rtl\n";
	print C_FILE "DMNI_PATH=\$(addprefix \$(DMNI_DIR)/,\$(DMNI_SRC))\n";
	print C_FILE "\n";
	print C_FILE "ROUTER_SRC=Hermes_buffer.vhd Hermes_crossbar.vhd Hermes_switchcontrol.vhd RouterCC.vhd\n";
	print C_FILE "ROUTER_DIR=\$(HW_PATH)/router/rtl\n";
	print C_FILE "ROUTER_PATH=\$(addprefix \$(ROUTER_DIR)/,\$(ROUTER_SRC))\n";
	print C_FILE "\n";
	print C_FILE "PLASMA_RAM_SRC=ram_master ram_plasma\n";
	print C_FILE "PLASMA_RAM_DIR=\$(SCENARIO_DIR)/plasma_ram/rtl\n";
	print C_FILE "PLASMA_RAM_PATH=\$(addprefix \$(PLASMA_RAM_DIR)/,\$(PLASMA_RAM_SRC))\n";
	print C_FILE "\n";
	print C_FILE "PLASMA_SRC=access_repository.vhd plasma.vhd\n";
	print C_FILE "PLASMA_DIR=\$(HW_PATH)/plasma/rtl\n";
	print C_FILE "PLASMA_PATH=\$(addprefix \$(PLASMA_DIR)/,\$(PLASMA_SRC))\n";
	print C_FILE "\n";
	print C_FILE "TOP_SRC=processing_element.vhd HeMPS.vhd test_bench.vhd\n";
	print C_FILE "TOP_DIR=\$(HW_PATH)\n";
	print C_FILE "TOP_PATH=\$(addprefix \$(TOP_DIR)/,\$(TOP_SRC))\n";
	print C_FILE "\n";
	print C_FILE "#SystemC files\n";
	print C_FILE "SC_NOC_DIR=\$(SCENARIO_DIR)/hardware/router/sc\n";
	print C_FILE "SC_MLITE_DIR=\$(HW_PATH)/plasma/sc\n";
	print C_FILE "SC_RAM_DIR=\$(SCENARIO_DIR)/plasma_ram/sc\n";
	print C_FILE "SC_PLASMA_DIR=\$(HW_PATH)/plasma/sc\n";
	print C_FILE "SC_TESTBENCH_DIR=\$(HW_PATH)/sc\n";
	print C_FILE "SC_DMNI_DIR=\$(HW_PATH)/dmni/sc\n";
	print C_FILE "SC_ACCESS_REPO_DIR=\$(HW_PATH)/plasma/sc\n";
	print C_FILE "\n";
	print C_FILE "SC_NOC_SRC=queue $switchcontrol_cpp router_cc \n";
	print C_FILE "SC_MLITE_SRC=mlite_cpu.cpp\n";
	print C_FILE "SC_RAM_SRC=ram_master ram_plasma\n";
	print C_FILE "SC_PLASMA_SRC=plasma.cpp\n";
	print C_FILE "SC_TESTBENCH_SRC=hemps.cpp test_bench.cpp\n";
	print C_FILE "SC_DMNI_SRC=dmni.cpp\n";
	print C_FILE "SC_ACCESS_REPO_SRC=\n\n";
	print C_FILE "\n";
	print C_FILE "SC_NOC_PATH=\$(addprefix \$(SC_NOC_DIR)/,\$(SC_NOC_SRC))\n";
	print C_FILE "SC_MLITE_PATH=\$(addprefix \$(SC_MLITE_DIR)/,\$(SC_MLITE_SRC))\n";
	print C_FILE "SC_RAM_PATH=\$(addprefix \$(SC_RAM_DIR)/,\$(SC_RAM_SRC))\n";
	print C_FILE "SC_PLASMA_PATH=\$(addprefix \$(SC_PLASMA_DIR)/,\$(SC_PLASMA_SRC))\n";
	print C_FILE "SC_TESTBENCH_PATH=\$(addprefix \$(SC_TESTBENCH_DIR)/,\$(SC_TESTBENCH_SRC))\n";
	print C_FILE "SC_DMNI_PATH=\$(addprefix \$(SC_DMNI_DIR)/,\$(SC_DMNI_SRC))\n";
	print C_FILE "SC_ACCESS_REPO_PATH=\$(addprefix \$(SC_ACCESS_REPO_DIR)/,\$(SC_ACCESS_REPO_SRC))\n";
	print C_FILE "\n";
	print C_FILE "#compilers definitions\n";
	print C_FILE "INC=-Iplasma_ram/sc/ -I./  -I\$(SCENARIO_DIR)hardware/router/sc/ -I\$(SCENARIO_DIR)build/\n";
	print C_FILE "VHD_C=\@vcom\n";
	print C_FILE "GEN=g++ -I./ -o HeMPS *.o -L. -Linc/. -lsystemc\n";
	print C_FILE "\n";


	if (($procDescription eq "rtl") or ($procDescription eq "iss")){
			print C_FILE "#modelsim gcc compiler\n";
			print C_FILE "SC_C=\@sccom -work \$(LIB) -g\n";
			print C_FILE "#systemc g++ compiler\n";
			print C_FILE "#SC_C=g++ -c -g -Wall -O2 -fpermissive -p\n";
	}
	else{
		if ($procDescription eq "sc"){
			print C_FILE "#modelsim gcc compiler\n";
			print C_FILE "#SC_C=\@sccom -work \$(LIB) -g\n";
			print C_FILE "#systemc g++ compiler\n";
			print C_FILE "SC_C=g++ -c -g -Wall -O2 -fpermissive\n";
		}
		else{
			print C_FILE "#modelsim gcc compiler\n";
			print C_FILE "SC_C=\@sccom -work \$(LIB) -fpermissive -g\n";
			print C_FILE "#systemc g++ compiler\n";
			print C_FILE "#SC_C=g++ -c -g -Wall -O2\n";
		}
	}

	print C_FILE "\n";
	print C_FILE "\n";
	print C_FILE "default:\n";
	print C_FILE "	\@echo \"Makefile for the hemps in systemc\"\n";
	print C_FILE "	\@echo \"---------------------------------------\"\n";
	print C_FILE "	\@echo \"Make options:\"\n";
	print C_FILE "	\@echo \"   default: Echo these instructions\"\n";
	print C_FILE "	\@echo \"       lib: Generate work dir and map its library\"\n";
	print C_FILE "	\@echo \"       vhd: Compile vhd HeMPS description files\"\n";
	print C_FILE "	\@echo \"       iss: Compile vhd and SystemC HeMPS description files\"\n";
	print C_FILE "	\@echo \"       all: Compile sytemc and vhd files\"\n";
	print C_FILE "	\@echo \"     clean: Remove all compiled and generated files\"\n";
	print C_FILE "	\@echo\n";
	print C_FILE "\n";
	print C_FILE "iss: lib \$(SCENARIO_PATH) \$(PKG_PATH) \$(MPACK_PATH) \$(SC_MLITE_PATH) \$(DMNI_PATH) \$(ROUTER_PATH) \$(SC_RAM_PATH) \$(MBLITE_STD_PATH) \$(MBLITE_CORE_PATH) \$(SC_MBLITE_RAM_PATH) \$(MBLITE_PATH) \$(PLASMA_PATH) \$(TOP_PATH)\n";
	print C_FILE "	\@sccom -link\n";
	print C_FILE "\t\n";
	print C_FILE "\n";
	print C_FILE "scmod: lib \$(SC_NOC_PATH) \$(SC_MLITE_PATH) \$(SC_RAM_PATH) \$(SC_ACCESS_REPO_PATH) \$(SC_DMNI_PATH) \$(SC_PLASMA_PATH) \$(SC_TESTBENCH_PATH)\n";
	print C_FILE "	\@sccom -link\n";
	print C_FILE "\t\n";
	print C_FILE "\n";
	print C_FILE "sc: \$(SC_NOC_PATH) \$(SC_MLITE_PATH) \$(SC_RAM_PATH) \$(SC_ACCESS_REPO_PATH) \$(SC_DMNI_PATH) \$(SC_PLASMA_PATH) \$(SC_TESTBENCH_PATH)\n";
	print C_FILE "	\$(GEN)\n";
	print C_FILE "\n";
	print C_FILE "vhd: lib \$(SCENARIO_PATH) \$(PKG_PATH) \$(MPACK_PATH) \$(MLITE_PATH) \$(DMNI_PATH) \$(ROUTER_PATH) \$(PLASMA_RAM_PATH) \$(MBLITE_STD_PATH) \$(MBLITE_CORE_PATH) \$(MBLITE_RAM_PATH) \$(MBLITE_PATH) \$(PLASMA_PATH) \$(TOP_PATH)\n";
	print C_FILE "\t\n";
	print C_FILE "\$(SCENARIO_PATH):\n";
	print C_FILE "	\$(VHD_C) -work \$(LIB) \$(\@).vhd\n";
	print C_FILE "\t\n";
	print C_FILE "\$(PLASMA_RAM_PATH):\n";
	print C_FILE "	\$(VHD_C) -work \$(LIB) \$(\@).vhd\n";
	print C_FILE "\t\n";
	print C_FILE "\$(SC_NOC_PATH):\n";
	print C_FILE "	\$(SC_C) \$(\@).cpp  \$(INC)\n";
	print C_FILE "\t\n";
	print C_FILE "\$(SC_RAM_PATH):\n";
	print C_FILE "	\$(SC_C) \$(\@).cpp  \$(INC)\n";
	print C_FILE "\t\n";
	print C_FILE "\%.vhd:\n";
	print C_FILE "	\$(VHD_C) -work \$(LIB) \$(BASE_PATH)/\$*.vhd\n";
	print C_FILE "	\n";
	print C_FILE "\%.cpp:\n";
	print C_FILE "	\$(SC_C) \$(BASE_PATH)/\$*.cpp  \$(INC)\n";
	print C_FILE "	\n";
	print C_FILE "sim:\n";
	print C_FILE "	do sim.do\n";
	print C_FILE "	\n";
	print C_FILE "lib:\n";
	print C_FILE "	\@vlib \$(LIB)\n";
	print C_FILE "	\@vmap \$(LIB) \$(LIB)\n";
	print C_FILE "	\n";
	print C_FILE "clean:\n";
	print C_FILE "	\@rm -r -f \$(LIB)\n";
	print C_FILE "	\@rm -f transcript\n";
	print C_FILE "	\@rm -f modelsim.ini\n";
	print C_FILE "	\@rm -f vsim.wlf\n";
	print C_FILE "	\@rm -f *~\n";
	print C_FILE "	\@rm -f *.o\n";
	print C_FILE "	\@rm -f *.exe\n";
	print C_FILE "	\@rm -f HeMPS\n";
	print C_FILE "	\n";

	if ($procDescription eq "rtl"){
		print C_FILE "all: vhd\n";
	}
	elsif ($procDescription eq "sc"){
		print C_FILE "all: sc\n";
	}
	elsif ($procDescription eq "scmod"){
		print C_FILE "all: scmod\n";
	}
	elsif ($procDescription eq "iss"){
		print C_FILE "all: iss\n";
	}
	print C_FILE "	\n";


	close(C_FILE);

}

#################################################################################################
################################## Generates makefile software ##################################
#################################################################################################

sub generate_makefile_software{
	
	$pageSize_bytes = $pageSize *1024-1;
	$memorySize_bytes = $memorySize *1024-1;
	$kernelSize_bytes = $kernelSize *1024-1;
	$all="all: ";
	
	open( C_FILE, ">./$projectName/build/makefile" );
		
		
print C_FILE "
#this environment variable must point to the hemps path, where the hardware, software and tools folders are located

#Definition of Plasma toolchain
CFLAGS     = -Os -Wall -fms-extensions -c -s -std=c99 -G 0
CFLAGS_APP = -Os -Wall -fms-extensions -c -s -std=c99 -G 0
GCC_MIPS   = mips-elf-gcc \$(CFLAGS)
GCC_MIPS_APP   = mips-elf-gcc \$(CFLAGS_APP)
AS_MIPS    = mips-elf-as
LD_MIPS    = mips-elf-ld
DUMP_MIPS  = mips-elf-objdump
COPY_MIPS = mips-elf-objcopy -I elf32-bigmips -O binary
					
#Definition of MB-Lite toolchain
MB         = mb-gcc
AS         = mb-as
LD         = mb-ld
MB_OBJCOPY = mb-objcopy
MB_OBJDUMP = mb-objdump
XILFLAGS   =-mxl-soft-div -msoft-float -mxl-barrel-shift -mno-xl-soft-mul
CXXFLAGS   =-g -std=c99 -pedantic -Wall -O2
LNKFLAGS   =-Wl,-defsym -Wl,_STACK_SIZE=0x3000 -Wl,-defsym -Wl,_HEAP_SIZE=0x0000
LNKFLAGS2  =-Wl,-defsym -Wl,_STACK_SIZE=0x2000 -Wl,-defsym -Wl,_HEAP_SIZE=0x0000
MB_GCC     = \$(MB) \$(XILFLAGS) \$(CXXFLAGS) \$(LNKFLAGS2) \$(LIBFLAGS) \$(INCFLAGS) \$(CCFLAGS)

#TOOLS
BIN2MEM       = bin2mem
RAM_GENERATOR = ram_generator

INCLUDE       = \$(HEMPS_PATH)/software/include

#TASKS
";
	$cont_app_new2=0;
	$application_new2[0]=-1;													
	for($i=0; $i<$numberAPPs; $i++){
		$application_new2[$i]=-1;													

	}
	for($i=0; $i<$numberAPPs; $i++){
		$cont_aux=0;
		for($g=0; $g<=$cont_app_new2; $g++){
			if($applications[$i] eq $application_new2[$g]){
				$cont_aux=1;
			}
		}
		if($cont_aux == 0){
			$application_new2[$cont_app_new2]=$applications[$i];
		


		for($j=0; $j<$size_apps[$i]; $j++){


			$id_aux = ($cont_app_new2<<8) | $applications_Tasks_id[$i][$j][0];
			#sets task path
			print C_FILE "TASK";
			print C_FILE $id_aux;
			print C_FILE "_PATH = ../applications/$applications[$i]/$applications_Tasks[$i][$j]\n";
		
			# sets task include files
			print C_FILE "TASK";
			print C_FILE $id_aux;
			print C_FILE "_INCLUDE = ids_$application_new2[$cont_app_new2].h\n";
			
			# sets task source name
			$name_aux = $applications_Tasks[$i][$j];
			$name_aux =~ s/\.c//ig;
			print C_FILE "TASK";
			print C_FILE $id_aux;
			print C_FILE "_NAME = $name_aux\n";		
			
			# sets task ID
			print C_FILE "TASK";
			print C_FILE $id_aux;
			print C_FILE "_ID = $id_aux\n";	
					
			# sets task make target
			print C_FILE "TASK";
			print C_FILE $id_aux;
			print C_FILE "_TARGET = \$("."TASK".$id_aux."_NAME)_\$("."TASK".$id_aux."_ID)\n\n";		
		}
		$cont_app_new2++;

	}
	}
	
	print C_FILE "#tasks boot code for Plasma processor
BOOT_TASK_SRC     = \$(HEMPS_PATH)/software/include/bootTask.asm
BOOT_TASK         = bootTask

#kernel master source files
BOOT_MASTER_SRC   = \$(HEMPS_PATH)/software/kernel/master/boot.S
BOOT_MASTER       = boot_master
KERNEL_MASTER_SRC = \$(HEMPS_PATH)/software/kernel/master/kernel_master.c
KERNEL_MASTER     = kernel_master

#kernel slave plasma source files
BOOT_PLASMA_SRC   = \$(HEMPS_PATH)/software/kernel/slave/boot.S
BOOT_PLASMA       = boot_plasma
KERNEL_PLASMA_SRC = \$(HEMPS_PATH)/software/kernel/slave/kernel_slave.c
KERNEL_PLASMA     = kernel_plasma\n\n";

	#Task boot make target
	print C_FILE "bootTask:
\t\$(AS_MIPS) --defsym sp_addr=$pageSize_bytes -o \$(BOOT_TASK).o \$(BOOT_TASK_SRC)\n\n";
	$all = $all."bootTask ";
				
	#Kernel master make target
	print C_FILE "kernel_master:
\t\$(AS_MIPS) --defsym sp_addr=$memorySize_bytes -o \$(BOOT_MASTER).o \$(BOOT_MASTER_SRC)
\t\$(GCC_MIPS) -DHOP_NUMBER=$HOP_NUMBER_DEFINE -D$MPSOC_mapping -o \$(KERNEL_MASTER).o \$(KERNEL_MASTER_SRC) --include ids_master.h
\t\$(LD_MIPS) -Ttext 0 -eentry -Map \$(KERNEL_MASTER).map -s -N -o \$(KERNEL_MASTER).bin \$(BOOT_MASTER).o \$(KERNEL_MASTER).o
\t\$(LD_MIPS) -Ttext 0 -eentry -Map \$(KERNEL_MASTER)_debug.map -o \$(KERNEL_MASTER)_debug.bin  \$(BOOT_MASTER).o \$(KERNEL_MASTER).o
\t\$(DUMP_MIPS) -S \$(KERNEL_MASTER)_debug.bin > \$(KERNEL_MASTER).lst
\t\$(COPY_MIPS) \$(KERNEL_MASTER).bin \$(KERNEL_MASTER).dump
\thexdump -v -e '1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" \"\\n\"' \$(KERNEL_MASTER).dump > \$(KERNEL_MASTER).txt\n\n";
	$all = $all."kernel_master ";

	#Kernel slave make target - Plasma
	print C_FILE "kernel_plasma:
\t\$(AS_MIPS) --defsym sp_addr=$kernelSize_bytes -o \$(BOOT_PLASMA).o \$(BOOT_PLASMA_SRC)
\t\$(GCC_MIPS) -o \$(KERNEL_PLASMA).o \$(KERNEL_PLASMA_SRC) --include ids_slave.h -D PLASMA
\t\$(LD_MIPS) -Ttext 0 -eentry -Map \$(KERNEL_PLASMA).map -s -N -o \$(KERNEL_PLASMA).bin  \$(BOOT_PLASMA).o \$(KERNEL_PLASMA).o
\t\$(LD_MIPS) -Ttext 0 -eentry -Map \$(KERNEL_PLASMA)_debug.map -o \$(KERNEL_PLASMA)_debug.bin  \$(BOOT_PLASMA).o \$(KERNEL_PLASMA).o
\t\$(DUMP_MIPS) -S \$(KERNEL_PLASMA)_debug.bin > \$(KERNEL_PLASMA).lst
\t\$(COPY_MIPS) \$(KERNEL_PLASMA).bin \$(KERNEL_PLASMA).dump
\thexdump -v -e '1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" \"\\n\"' \$(KERNEL_PLASMA).dump > \$(KERNEL_PLASMA).txt\n\n";
	$all = $all."kernel_plasma ";

	#Generate the tasks make targets - tasks in processors
	$cont_app_new1=0;
	$application_new1[0]=-1;													
	for($i=0; $i<$numberAPPs; $i++){
		$application_new1[$i]=-1;													

	}
	for($i=0; $i<$numberAPPs; $i++){
		$cont_aux=0;
		for($g=0; $g<=$cont_app_new1; $g++){
			if($applications[$i] eq $application_new1[$g]){
				$cont_aux=1;
				last;
			}
		}
		if($cont_aux == 0){
			$application_new1[$cont_app_new1]=$applications[$i];
			
			for($j=0; $j<$size_apps[$i]; $j++){
				
			$id_aux = ($cont_app_new1<<8) | $applications_Tasks_id[$i][$j][0];
			
			$name_aux = $applications_Tasks[$i][$j];
			$name_aux =~ s/\.c//ig;
			$all = $all."$name_aux\_$id_aux ";

			$task_num_target = "\$(TASK"."$id_aux"."_TARGET)";
			$task_num_path = "\$(TASK"."$id_aux"."_PATH)";
			$task_num_include = "\$(TASK"."$id_aux"."_INCLUDE)";
			
			print C_FILE "$name_aux\_$id_aux:\n";
			print C_FILE "\t\$(GCC_MIPS_APP) $task_num_path -o $task_num_target.o --include $task_num_include -D PLASMA -I \$(INCLUDE)\n";				
			print C_FILE "\t\$(LD_MIPS) -Ttext 0 -eentry -Map $task_num_target.map -s -N -o $task_num_target.bin \$(BOOT_TASK).o $task_num_target.o\n";
			print C_FILE "\t\$(LD_MIPS) -Ttext 0 -eentry -Map $task_num_target\_debug.map -o $task_num_target\_debug.bin \$(BOOT_TASK).o $task_num_target.o\n";
			print C_FILE "\t\$(DUMP_MIPS) -S $task_num_target\_debug.bin > $task_num_target.lst\n";
			print C_FILE "\t\$(COPY_MIPS) $task_num_target.bin $task_num_target.dump\n";
			print C_FILE "\thexdump -v -e '1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" 1/1 \"\%02x\" \"\\n\"' $task_num_target.dump > $task_num_target.txt\n";
		}
			$cont_app_new1++;
	
		}
	}
	
	print C_FILE "\nram_gen: ram_master ram_plasma\n\n";
	print C_FILE "ram_master:\n";
	print C_FILE "\t\$(RAM_GENERATOR) $memorySize -rtl kernel_master.txt > ram_master.vhd\n";
	print C_FILE "\tcp ram_master.vhd ../plasma_ram/rtl\n";
	print C_FILE "\t\$(RAM_GENERATOR) $memorySize -h kernel_master.txt > ram_master.h\n";
	print C_FILE "\tcp -rf \$(HEMPS_PATH)/hardware/sc_ram/ram_master.cpp ../plasma_ram/sc\n";	
	print C_FILE "\tcp ram_master.h ../plasma_ram/sc\n\n";

	print C_FILE "ram_plasma:\n";
	print C_FILE "\t\$(RAM_GENERATOR) $memorySize -rtl kernel_plasma.txt > ram_plasma.vhd\n";
	print C_FILE "\tcp ram_plasma.vhd ../plasma_ram/rtl\n";
	print C_FILE "\t\$(RAM_GENERATOR) $memorySize -h kernel_plasma.txt > ram_plasma.h\n";
	print C_FILE "\tcp -rf \$(HEMPS_PATH)/hardware/sc_ram/ram_plasma.cpp ../plasma_ram/sc\n";
	print C_FILE "\tcp ram_plasma.h ../plasma_ram/sc\n\n";				

	$all = $all."ram_gen";
	
	print C_FILE "clean:
\trm -rf *.bin
\trm -rf *.txt
\trm -rf *.mem
\trm -rf *.dump
\trm -rf *.lst
\trm -rf *.o
\trm -rf *.map
\trm -rf ram*.h
\trm -rf *.vhd
\trm -rf *.elf\n\n";

	print C_FILE $all;
	
	close(C_FILE);
	
	system("cd ./$projectName/build;make all > /dev/null ;cd -"); #2> /dev/null

}

#################################################################################################
################################## Generates HeMPS_PKG ##########################################
#################################################################################################

sub generate_Hemps_PKG{
	
	open( C_FILE_H, ">./$projectName/HeMPS_PKG.h" );
	open( C_FILE_VHD, ">./$projectName/HeMPS_PKG.vhd" );
		
	$kernelTypesNum = "$kernelTypesNum";
	$kernelTypesNum =~ s/\, \}\;/\,\}\;/ig;

	print C_FILE_VHD "\n";
	print C_FILE_VHD "--------------------------------------------------------------------------\n";
	print C_FILE_VHD "-- package com tipos basicos\n";
	print C_FILE_VHD "--------------------------------------------------------------------------\n";
	print C_FILE_VHD "library IEEE;\n";
	print C_FILE_VHD "use IEEE.Std_Logic_1164.all;\n";
	print C_FILE_VHD "use IEEE.std_logic_unsigned.all;\n";
	print C_FILE_VHD "use IEEE.std_logic_arith.all;\n";
	print C_FILE_VHD "\n";
	print C_FILE_VHD "package HeMPS_PKG is\n";
	print C_FILE_VHD "\n";
	print C_FILE_VHD "--------------------------------------------------------\n";
	print C_FILE_VHD "-- HEMPS CONSTANTS\n";
	print C_FILE_VHD "--------------------------------------------------------\n";
	print C_FILE_VHD "\t-- paging definitions\n";
	print C_FILE_VHD "\tconstant PAGE_SIZE_H_INDEX\t\t: integer := ".$page_size_h_index.";\n";
	print C_FILE_VHD "\tconstant PAGE_NUMBER_H_INDEX\t: integer := ".$page_number_h_index.";\n";
	print C_FILE_VHD "\n";
	print C_FILE_VHD "\t-- Hemps top definitions\n";
	print C_FILE_VHD "\tconstant NUMBER_PROCESSORS_X\t: integer := ".$x_dimensions."; \n";
	print C_FILE_VHD "\tconstant NUMBER_PROCESSORS_Y\t: integer := ".$y_dimensions."; \n";
	print C_FILE_VHD "\n";
	print C_FILE_VHD "\tconstant TAM_BUFFER\t\t: integer := ".$NoC_buffer_size.";\n";
	print C_FILE_VHD "\n";	
	print C_FILE_VHD "\tconstant MASTER_ADDRESS\t\t\t: integer := ".$masterAddress.";\n";
	print C_FILE_VHD "\tconstant NUMBER_PROCESSORS\t\t: integer := NUMBER_PROCESSORS_Y*NUMBER_PROCESSORS_X;\n";
	print C_FILE_VHD "\n";
	print C_FILE_VHD "\tsubtype core_str is string(1 to 6);\n";
	print C_FILE_VHD "\tsubtype kernel_str is string(1 to 3);\n";
	print C_FILE_VHD "\ttype core_type_type is array(0 to NUMBER_PROCESSORS-1) of core_str;\n"; 
	print C_FILE_VHD "\tconstant core_type : core_type_type := (";
	
	for($x=0; $x<$x_dimensions; $x++){
		for($y=0; $y<$y_dimensions; $y++){
			print C_FILE_VHD "\"plasma\"";
			if(($y != ($y_dimensions-1)) or ($x != ($x_dimensions-1))){
				print C_FILE_VHD ",";
			}
		}
	}
	print C_FILE_VHD ");\n";
	
	print C_FILE_VHD "\ttype kernel_type_type is array(0 to NUMBER_PROCESSORS-1) of kernel_str;\n";
	
	$kernelTypes =~ s/\,$//ig;
	
	print C_FILE_VHD "\tconstant kernel_type : kernel_type_type := (".$kernelTypes.");\n";
	print C_FILE_VHD "end HeMPS_PKG;";

	
	print C_FILE_H "#ifndef _HeMPS_PKG\n";
	print C_FILE_H "#define _HeMPS_PKG\n\n";
	print C_FILE_H "#define N_PE_X ".$x_dimensions."\n";
	print C_FILE_H "#define N_PE_Y ".$y_dimensions."\n";
	print C_FILE_H "#define N_PE N_PE_Y*N_PE_X\n";
	print C_FILE_H "#define MASTER ".$masterAddress."\n\n";
	print C_FILE_H "const int kernel_type[N_PE] = {".$kernelTypesNum."};\n\n";
	print C_FILE_H "#endif";

	close(C_FILE_H);
	close(C_FILE_VHD);

}

#################################################################################################
################################## PARAMETERS MEMORY ############################################
#################################################################################################

sub parameters_memory{


	opendir(DIR, "./$projectName/build");
	(@aux)=readdir(DIR);
	@aux = sort @aux;
	closedir(DIR);
	
	$size=@aux;
	$max_size_task=0;
	$max_size_kernel=0;
	
	for($i=0; $i<$size; $i++){
		if(($aux[$i] =~ /.bin/) && ($aux[$i] !~ /kernel/)){
			$sizes_men= `mips-elf-size -t ./$projectName/build/$aux[$i]`;
			$sizes_men =~ s/\s+/ /ig;

			@size_max_task = split(/\s/,$sizes_men);
			
			if($max_size_task < $size_max_task[16]){
				($max_size_task) = $size_max_task[16];
			}
		}

		if(($aux[$i] =~ /.bin/) && ($aux[$i] =~ /kernel/)){
			$sizes_men= `mips-elf-size -t ./$projectName/build/$aux[$i]`;
			$sizes_men =~ s/\s+/ /ig;

			@size_max_task = split(/\s/,$sizes_men);
			
			if($max_size_kernel < $size_max_task[16]){
				($max_size_kernel) = $size_max_task[16];
			}
		}
		
	}
		
	use POSIX;
	$pageSize = 2 ** floor((log($max_size_task*2)/log(2))+1)/1024;
	$kernelSize = 2 ** floor((log($max_size_kernel*1.5)/log(2))+1)/1024;
	
	# Calculates Kernel Pages
	if($kernelSize % $pageSize == 0){
			$kernelPages = $kernelSize / $pageSize;
	}
	else{
		
		$kernelPages = floor($kernelSize / $pageSize + 1);
	}
	
	# Defines Maximum Tasks/slave
	$maxTasksSlave = $pagesPerPe;
	
	$memorySize = $pageSize * ($kernelPages + $pagesPerPe);

	if($memorySize <= 64){
		$memorySize = 64;
	}elsif($memorySize <= 128){
		$memorySize = 128;
	}elsif($memorySize <= 256){
		$memorySize = 256;
	}elsif($memorySize <= 512){
		$memorySize = 512;
	}elsif($memorySize <= 1024){
		$memorySize = 1024;
	}
	
	# Gets Page Size H Index
	$page_size_h_index = log($pageSize*1024)/log(2) -1;	
	
	# Gets Page Size H Index
	$page_number_h_index = log($memorySize/ $pageSize)/log(2) + $page_size_h_index;
	
}

#################################################################################################
################################## PARAMETERS MEMORY PER MEMORY SIZE ############################
#################################################################################################

sub parameters_memory_per_memory_size{

	
	# Calculates Kernel Pages
	if($kernelSize % $pageSize == 0){
			$kernelPages = $kernelSize / $pageSize;
	}
	else{
		$kernelPages = floor($kernelSize / $pageSize + 1);
	}
	
	# Defines Maximum Tasks/slave
	$maxTasksSlave = $memorySize / $pageSize - $kernelPages;
	
	
	# Gets Page Size H Index
	$page_size_h_index = log($pageSize*1024)/log(2) -1;	
	
	# Gets Page Size H Index
	$page_number_h_index = log($memorySize/ $pageSize)/log(2) + $page_size_h_index;
	
}

#################################################################################################
################################## PARAMETERS MEMORY FAKE #######################################
#################################################################################################

sub parameters_memory_fake{

	$pageSize = 32;
	$memorySize = 128;
	
	# Calculates Kernel Pages
	if($kernelSize % $pageSize == 0){
			$kernelPages = $kernelSize / $pageSize;
	}
	else{
		$kernelPages = floor($kernelSize / $pageSize + 1);
	}
	
	# Defines Maximum Tasks/slave
	$maxTasksSlave = $memorySize / $pageSize - $kernelPages;
	
	
	# Gets Page Size H Index
	$page_size_h_index = log($pageSize*1024)/log(2) -1;	
	
	# Gets Page Size H Index
	$page_number_h_index = log($memorySize/ $pageSize)/log(2) + $page_size_h_index;
	
}

#################################################################################################
################################### INITIAL TASKS ###############################################
#################################################################################################

sub initial_tasks {

	for($i=0; $i<$numberAPPs; $i++){
		$initCount=0;

		for($j=0; $j<$size_apps[$i]; $j++) {
			$initTasks[$i][$j][0]=-1;
		}

		open( C_FILE, "<./$projectName/applications/$applications[$i]/$applications[$i].cfg" );
		my @c_lines = <C_FILE>;
		close(C_FILE);

		$initial_ok = 0;
		$initial_reading = 0;
		$tagInitial = "<initialTasks>";
		foreach $c_line (@c_lines) {	# tarefas iniciais
			chomp $c_line;
			if ($c_line eq "<dependences>") {
				last;
			}
			if ($initial_reading == 1) {
				for($j=0; $j<$size_apps[$i]; $j++){
					if($c_line =~ /</ig){
						$initial_ok = 1;
						$initial_reading = 0;
					}
					elsif (($initial_ok eq 0) && ($c_line.".c" eq $applications_Tasks[$i][$j])) {
						$initTasks[$i][$j][0]=1;
					}
				}
			}

			if ($c_line eq $tagInitial) {
				$initial_reading = 1;
			}
		}
	}
}
#################################################################################################
################################## QUICKSORT ####################################################
#################################################################################################

sub quicksort {
    my @lista = @_;
    my (@menores, @iguais, @maiores);
 
    return @lista if @lista < 2;
    foreach (@lista) {
        if ($_ < $lista[0]) {
            push @menores, $_;
        }
        elsif ($_ == $lista[0]) {
            push @iguais, $_;
        }
        else {
            push @maiores, $_;
        }
    }
    return quicksort(@menores), @iguais, quicksort(@maiores);
}

#################################################################################################
################################## READ APPLICATIONS INFO #######################################
#################################################################################################

sub read_applications_info {

	$numberAPPs = @applications;

	@result = quicksort(@StartTimeApp);

	
	for($i=0; $i<$numberAPPs; $i++){									# ordena as aplicacoes em ordem de tempo de insersao no MPSoC

		for($j=0; $j<$numberAPPs; $j++){
			if(($StartTimeApp[$i] eq $result[$j])){
				($applications_new[$j])=$applications[$i];
				($StartTimeApp_new[$j])=$StartTimeApp[$i];
				$result[$j]=-1;
				last;
			}
		}
	}
	(@applications)=@applications_new;
	(@StartTimeApp)=@StartTimeApp_new;
		
	if($path_applications ne ""){
		$path_applications =~ s/\s//ig;
		$path_applications =~ s/\/$//ig;
		$path_applications = $path_applications."/";
		$max_app_size=0;
		$appID=0;
		$taskID=0;
		$taskNumber=0;
		

		for($i=0; $i<$numberAPPs; $i++){
			system("mkdir ./$projectName/applications/$applications[$i] 2> /dev/null");
			if(-d $path_applications.$applications[$i]){
				system("cp -rf $path_applications$applications[$i]/*.c   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $path_applications$applications[$i]/*.h   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $path_applications$applications[$i]/*.cfg ./$projectName/applications/$applications[$i] 2> /dev/null");
			}
			elsif(-d $applications[$i]){
				system("cp -rf $applications[$i]/*.c   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $applications[$i]/*.h   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $applications[$i]/*.cfg ./$projectName/applications/$applications[$i] 2> /dev/null");
			}
			else{
				system("cp -if(-d $path_applications.$applications[$i]){rf \$HEMPS_PATH/applications/$applications[$i]/*.c   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf \$HEMPS_PATH/applications/$applications[$i]/*.h   ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf \$HEMPS_PATH/applications/$applications[$i]/*.cfg ./$projectName/applications/$applications[$i] 2> /dev/null");
			}

			opendir(DIR, "./$projectName/applications/$applications[$i]");
			(@aux)=readdir(DIR);
			@aux = sort @aux;
			closedir(DIR);

			$size_aux = @aux; 
			$cont_aux=0;
			$id=0;
						
			for ($j=0; $j<$size_aux; $j++) {	
					
				if ($aux[$j] =~ /[a-z]/ig and $aux[$j] =~ /\.c$/ig) {		# só le osREAD APPLICATIONS INFO arquivos .c	
					
					$applications_Tasks[$i][$cont_aux]= $aux[$j];
					$applications_Tasks_id[$i][$cont_aux][0]= $id;			# insere o ID da tarefa
					$cont_aux++;
					$id++;
					$taskNumber++;
				}
			}
			($size_apps[$i])= $cont_aux;

			if ($max_app_size == 0 or $max_app_size < $cont_aux) {
				($max_app_size) = $cont_aux;
			}
			$appID++;
		}
		
		for ($i=0; $i<$numberAPPs; $i++) {
			($name_aux) = $applications[$i];
			$name_aux =~ s/\.c//ig;
			$name_aux2 = $name_aux.".cfg"; 
			
			open( TXT_FILE, "<$path_applications$applications[$i]/$name_aux2" ) or die("Could not open file $path_applications$applications[$i]/$name_aux2");
			@txt_lines_aux = <TXT_FILE>;
			$size_txt = @txt_lines_aux;
			close(TXT_FILE);

			for ($j=0; $j<$size_apps[$i]; $j++) {
					$name_task= $applications_Tasks[$i][$j];
					$name_task =~ s/\.c//ig;

					for($t=0; $t<$size_txt; $t++){

						$txt_lines_aux[$t] =~ s/\n//ig;
						if(($txt_lines_aux[$t] eq $name_task) && ($txt_lines_aux[$t-1] eq "<task>")){
							$txt_lines_aux[$t+2] =~ s/\n//ig;

							$load_Tasks[$i][$j]= $txt_lines_aux[$t+2]/100;
							$cont=0;
							$cont2=0;
							$txt_lines_aux[$t+4+$cont] =~ s/\n//ig;
							while($txt_lines_aux[$t+4+$cont] ne "<end task>"){
								for($g=0; $g<$size_apps[$i]; $g++){
									($name_aux3) = $applications_Tasks[$i][$g];
									$name_aux3 =~ s/\.c//ig;
									if($txt_lines_aux[$t+4+$cont] eq $name_aux3){
										$aux = $txt_lines_aux[$t+4+$cont+1];
										$depTasks_txt[$i][$j][$cont2] = $applications_Tasks_id[$i][$g][0];
										$aux =~ s/\n//ig;
										$depTasks_txt_load[$i][$j][$cont2][0] = $aux;
										$cont=$cont+2;

										$cont2++;

										last;
									}
								}
								$txt_lines_aux[$t+4+$cont] =~ s/\n//ig;
							}
						}
					}
					
				}
			}
	}
	else{
		$max_app_size = 0;
		$appID        = 0;
		$taskID   	  = 0;

		for($i=0; $i<$numberAPPs; $i++){
			system("mkdir ./$projectName/applications/$applications[$i] 2> /dev/null");
			
			if (-d $applications[$i]) {
				system("cp -rf $applications[$i]/*.c ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $applications[$i]/*.h ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf $applications[$i]/*.cfg ./$projectName/applications/$applications[$i] 2> /dev/null");		
			} 
			else {	
				system("cp -rf \$HEMPS_PATH/applications/$applications[$i]/*.c ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf \$HEMPS_PATH/applications/$applications[$i]/*.h ./$projectName/applications/$applications[$i] 2> /dev/null");
				system("cp -rf \$HEMPS_PATH/applications/$applications[$i]/*.cfg ./$projectName/applications/$applications[$i] 2> /dev/null");
			}
			
			opendir(DIR, "./$projectName/applications/$applications[$i]");			
			(@aux)=readdir(DIR);
			@aux = sort @aux;
			closedir(DIR);

			$size_aux = @aux; 

			$cont_aux=0;
			$id=0;
			for($j=0; $j<$size_aux; $j++){
				if($aux[$j] =~ /[a-z]/ig and $aux[$j] =~ /\.c$/ig){				# só le os arquivos .c

					$applications_Tasks[$i][$cont_aux]= $aux[$j];
					$applications_Tasks_id[$i][$cont_aux][0]= $id;				# insere o ID da tarefa
					
					$aux[$j]=NULL;
					$cont_aux++;
					$id++;
					$taskNumber++;
				}
			}
			($size_apps[$i])= $cont_aux;
			
			if($max_app_size == 0 or $max_app_size < $cont_aux){
				($max_app_size) = $cont_aux;
			}

			$appID++;
		}
	}
}

#################################################################################################
################################## CREATE CLUSTERS ##############################################
#################################################################################################

sub create_clusters{
	
	my $cluster_grid_x = $x_dimensions / $x_cluster;
	my $cluster_grid_y = $y_dimensions / $y_cluster;	
	
	my $cont = 0;
	$size_clusters = 0;
	
	$localMastersCont = ($x_dimensions * $y_dimensions) / ($x_cluster * $y_cluster);
	
	for($y=0; $y<$cluster_grid_y; $y++){
		for($x=0; $x<$cluster_grid_x; $x++){
		
			$clusters[$cont][0] = $x * $x_cluster;				# LEFTBOTTOM X
			$clusters[$cont][1] = $y * $y_cluster;				# LEFTBOTTOM Y
			$clusters[$cont][2] = (($x+1) * $x_cluster)-1;		# TOPRIGHT X
			$clusters[$cont][3] = (($y+1) * $y_cluster)-1;		# TOPRIGHT y
			
			if($mastersLocation =~ /LB/i){						# LB
				$clusters[$cont][4] = $x * $x_cluster;			# MASTER X
				$clusters[$cont][5] = $y * $y_cluster;			# MASTER Y
			}
			
			elsif($mastersLocation =~ /RB/i){					# RB
				$clusters[$cont][4] = (($x+1) * $x_cluster)-1;	# MASTER X
				$clusters[$cont][5] = $y * $y_cluster;			# MASTER Y
			}
			
			elsif($mastersLocation =~ /LT/i){					# LT
				$clusters[$cont][4] = $x * $x_cluster;			# MASTER X
				$clusters[$cont][5] = (($y+1) * $y_cluster)-1;	# MASTER Y
			}
			
			elsif($mastersLocation =~ /RT/i){					# RT
				$clusters[$cont][4] = (($x+1) * $x_cluster)-1;	# MASTER X
				$clusters[$cont][5] = (($y+1) * $y_cluster)-1;	# MASTER Y		
			}
			else {
				print "\nERROR: INVALID MASTER LOCATION\n\n";
				exit;
			}
			
			$cont++;
			$size_clusters++;
		}
	}
}

#################################################################################################
################################## SET PROCESSORS TYPE ##########################################
#################################################################################################

sub set_processors_type{
	
	$kernelTypesNum = "";
	$kernelTypes = "";
	
	for($i=0; $i<$size_clusters; $i++){

		if($i == $masterCluster){
			$processors[$clusters[$i][4]][$clusters[$i][5]] = "GMP";

			$x_master = $clusters[$i][4];
			$y_master = $clusters[$i][5];

			$x_master_h= sprintf("%x", $x_master);
			$y_master_h= sprintf("%x", $y_master);
			$masterAddress = $y_master * $x_dimensions + $x_master;
		}
		
		else {
			$processors[$clusters[$i][4]][$clusters[$i][5]] = "LMP";
		}
	}
	
	for($x=0; $x<$x_dimensions; $x++){
		for($y=0; $y<$y_dimensions; $y++){
			if($processors[$x][$y] eq "GMP"){

				$kernelTypesNum = $kernelTypesNum . "2, ";
				$kernelTypes = $kernelTypes . "\"mas\",";
			}
			elsif($processors[$x][$y] eq "LMP"){
				$kernelTypesNum = $kernelTypesNum. "1, ";
				$kernelTypes = $kernelTypes. "\"loc\",";
			}
			else{
				$kernelTypesNum = $kernelTypesNum. "0, ";
				$kernelTypes = $kernelTypes. "\"sla\",";
			}
		}
	}
}

#################################################################################################
################################## CREATE PROJECT ###############################################
#################################################################################################

sub create_project{
	
	system("mkdir $projectName 2> /dev/null");
	system("mkdir $projectName/plasma_ram 2> /dev/null");
	system("mkdir $projectName/plasma_ram/sc 2> /dev/null");
	system("mkdir $projectName/plasma_ram/rtl 2> /dev/null");
	system("mkdir $projectName/build 2> /dev/null");
	system("mkdir $projectName/debug 2> /dev/null");
	system("mkdir $projectName/log 2> /dev/null");
	system("mkdir $projectName/applications 2> /dev/null");
	

}

#################################################################################################
################################## Generates platform.cfg and services.cfg ######################
######################################### to the debugger software ##############################
#################################################################################################
sub generate_debugger_files{

	
	open( C_FILE, ">./$projectName/debug/platform.cfg" );
		print C_FILE "router_addressing XY\n";
		print C_FILE "channel_number 1\n";
		print C_FILE "mpsoc_x $x_dimensions\n";
		print C_FILE "mpsoc_y $y_dimensions\n";
		print C_FILE "cluster_x $x_cluster\n";
		print C_FILE "cluster_y $y_cluster\n";
		print C_FILE "manager_position_x 0\n";
		print C_FILE "manager_position_y 0\n";
		print C_FILE "global_manager_cluster 0\n";
		print C_FILE "flit_size 32\n";
		print C_FILE "clock_period_ns 10\n";
		print C_FILE "BEGIN_task_name_relation\n";
	
	
		for($i=0; $i<$numberAPPs; $i++){
			
			for($j=0; $j<$size_apps[$i]; $j++){
				$name_aux = $applications_Tasks[$i][$j];
				$name_aux =~ s/\.c//ig;
				$id_temp = $i<<8 | $applications_Tasks_id[$i][$j][0];
				print C_FILE "$name_aux $id_temp\n";
			}
		}	
		print C_FILE "END_task_name_relation\n";

	close(C_FILE);

	open( C_FILE, ">./$projectName/debug/services.cfg" );
		print C_FILE "MESSAGE_REQUEST 10\n";
                    print C_FILE "MESSAGE_DELIVERY 20\n";
                    print C_FILE "TASK_ALLOCATION 40\n";
                    print C_FILE "TASK_ALLOCATED 50\n";
                    print C_FILE "TASK_REQUEST 60\n";
                    print C_FILE "TASK_TERMINATED 70\n";
                    print C_FILE "TASK_DEALLOCATED 80\n";
                    print C_FILE "LOAN_PROCESSOR_RELEASE 90\n";
                    print C_FILE "DEBUG_MESSAGE 100\n";
                    print C_FILE "LOCATION_REQUEST 120\n";
                    print C_FILE "NEW_TASK 130\n";
                    print C_FILE "APP_TERMINATED 140\n";
                    print C_FILE "NEW_APP 150\n";
                    print C_FILE "INITIALIZE_CLUSTER 160\n";
                    print C_FILE "INITIALIZE_SLAVE 170\n";
                    print C_FILE "TASK_TERMINATED_OTHER_CLUSTER 180\n";
                    print C_FILE "LOAN_PROCESSOR_REQUEST 190\n";
                    print C_FILE "LOAN_PROCESSOR_DELIVERY 200\n";
            		print C_FILE "TASK_MIGRATION 210\n";
					print C_FILE "MIGRATION_CODE 220\n";
					print C_FILE "MIGRATION_TCB 221\n";
					print C_FILE "MIGRATION_TASK_LOCATION 222\n";
					print C_FILE "MIGRATION_MSG_REQUEST 223\n";
					print C_FILE "MIGRATION_STACK 224\n";
					print C_FILE "MIGRATION_DATA_BSS 225\n";
					print C_FILE "UPDATE_TASK_LOCATION 230\n";
					print C_FILE "TASK_MIGRATED 235\n";
            		print C_FILE "ENERGY_SLAVE 240\n";
					print C_FILE "ENERGY_CLUSTER 250\n";
            
                    print C_FILE "\n";
                    print C_FILE "\$TASK_ALLOCATION_SERVICE 40 221\n";
                    print C_FILE "\$TASK_TERMINATED_SERVICE 70 221";
		
	close(C_FILE);

	#system("mkdir ../hardware/router/sc/debug/ 2> error.txt");

}

#################################################################################################
################################## READ HMP FILE CONFIGURATION ##################################
#################################################################################################

sub read_hmp_file{

	open( HMP_FILE, "<$_[0]" ) or die("Could not open file $_[0].");
	my @hmp_lines_aux = <HMP_FILE>;
	close(HMP_FILE);
	my $size_hmp = @hmp_lines_aux;
	$j=0;
	$cont_app=0;
	$cont_app_old=$cont_app;
	$first_app=0;
	$pagesPerPe=0;
	$cont_static=0;
	$start_static=0;
	
	for($i=0;$i<$size_hmp;$i++){											# tira todas as linhas em branco
		$hmp_lines_aux[$i] =~ s/\n//ig; 									# retira "nova linha"
		$hmp_lines_aux[$i] =~ s/\s+/ /ig; 									# substitui multiplos espaços por apenas um
		$hmp_lines_aux[$i] =~ s/^\s+//ig;

		if($hmp_lines_aux[$i] ne ''){
			($hmp_lines[$j])= $hmp_lines_aux[$i];
			$j++;
		}
	}
	my $size_hmp = @hmp_lines;

	for($i=0;$i<$size_hmp;$i++){											# le linha a linha do arquivo HMP
		($hmp_line) = $hmp_lines[$i];
		if($hmp_line =~ /\[.*\]/ || $start_static != 0){					# linhas com "[]"
			
			if($hmp_line =~ /project name/i){								# le o nome do projeto
				($projectName_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}

			if($hmp_line =~ /tasks per pe/i){								# le o numero de paginas por PE
				($pagesPerPe_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /memory size/i){								# le o tamanho da memória de cada PE
				($memorySize_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}			
			if($hmp_line =~ /page size/i){									# le o tamanho da página
				($pageSize_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /processor description/i){						# le a descrição do processador
				($procDescription_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			if($hmp_line =~ /noc buffer size/ig){						# le o tamanho do buffer
				($NoC_buffer_size) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}			
			if($hmp_line =~ /noc routing algorithm/ig){						# le o algoritmo de roteamento
				($NoC_routing_algorithm) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			if($hmp_line =~ /mapping/ig){						# le o algoritmo de mapeamento
				($MPSOC_mapping) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /dimensions/i){									# le a dimensao do MPSoC
				($x_dimensions_aux) = $hmp_lines[$i+1];
				($y_dimensions_aux) = $hmp_lines[$i+2];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /cluster size/i){								# le o tamanho do cluster
				($x_cluster_aux) = $hmp_lines[$i+1];
				($y_cluster_aux) = $hmp_lines[$i+2];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /masters location/i){							# le a localizacao dos mestres (LB, RB, LT, RT);
				($mastersLocation_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			
			if($hmp_line =~ /master cluster/i){								# le em qual cluster ficara o mestre global
				$start_static = 0;
				($masterCluster_aux) = $hmp_lines[$i+1];
				next;
			}

			if(($hmp_line =~ /application/i && $hmp_line !~ /end/i) || ($hmp_line =~ /start time/i) || ($hmp_line =~ /static/i) || ($start_static ne 0)){	# le as aplicações
			
				if($hmp_line =~ /application/i || $hmp_line =~ /end/i || $hmp_line =~ /start time/i) {
					$start_static = 0;
				}
				if(($hmp_line =~ /static/i || $start_static ne 0)){							
					if($start_static > 1){
						$start_static--;
					}
					else{
						($static_app[$cont_app][$cont_static]) = $hmp_lines[$i+1];
						$cont_static++;
						($static_app[$cont_app][$cont_static]) = (($hmp_lines[$i+2]<<8)+$hmp_lines[$i+3]);
						$cont_static++;
						($static_app[$cont_app][$cont_static]) = -1;
						$start_static=3;
					}
				}
				else{
					if($hmp_line =~ /start time/i){
						$start_static = 0;
						($auxTime) = $hmp_lines[$i+1];
						if($auxTime =~ /fs/){									# femtosecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime / 1000000000000;						
						}
						elsif($auxTime =~ /ps/){								# picosecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime / 1000000000;
						}
						elsif($auxTime =~ /ns/){								# nanosecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime / 1000000;
						}
						elsif($auxTime =~ /us/){								# microsecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime / 1000;
						}
						elsif($auxTime =~ /ms/){								# millisecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
						}
						elsif($auxTime =~ /cs/){								# centisecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime * 10;
						}
						elsif($auxTime =~ /ds/){								# decisecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime * 100;
						}
						elsif($auxTime =~ /s/){								    # second
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime * 1000;
						}
						else{													# Default millisecond
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
						}
						
						($StartTimeApp[$cont_app]) = $auxTime;

					}
					else{
						$start_static = 0;
						if($first_app == 0){
							($applications[$cont_app]) = $hmp_lines[$i+1];
							($StartTimeApp[$cont_app]) = 0;
							$first_app=1;
						}
						else{
							if($cont_app_old == $cont_app){
								$cont_app++;
							}
							($cont_app_old) = $cont_app;

							($applications[$cont_app]) = $hmp_lines[$i+1];
							($StartTimeApp[$cont_app]) = 0;
							($static_app[$cont_app][0]) = -1;

						}
					}
					next;
				}
			}
		}
	}

	use Math::Complex;

	$HOP_NUMBER_DEFINE = sqrt($x_cluster_aux*$y_cluster_aux)/2;

	use POSIX;
	$HOP_NUMBER_DEFINE = floor($HOP_NUMBER_DEFINE);

	#print "gui gui gui $HOP_NUMBER_DEFINE\n\n\n";

	return $projectName_aux, $pagesPerPe_aux, $memorySize_aux, $pageSize_aux, $procDescription_aux,
	       $x_dimensions_aux, $y_dimensions_aux, $x_cluster_aux, $y_cluster_aux, $mastersLocation_aux,
		   $masterCluster_aux;
}

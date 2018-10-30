#!/usr/bin/perl


	if ($ARGV[0] ne "") {

		$project_name=shift;
		$page_size=shift;
		$memory_size=shift;		
		$dimensions1=shift;  
		$dimensions2=shift;
		$dimensions_cluster1=shift;
		$dimensions_cluster2=shift;  
		$master_location=shift;
		$global_master=shift;   
		$application=shift;
		$nro_applications=shift; 
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}
	
	#$config_file =~ s/\/$//ig;
	$app_flag = 0;
	$count_app = 0;
	$count_task = 0;
	$cont_rede = 0;
	$cont_aux = 0;
			
################################################################
#	$project_name = cenario9x9;
	$processor_description = sc;
	$processor_type = plasma;
	$path_app = applications;
################################################################




	for($i=0;$i<$dimensions1;$i++){
	
		for($j=0;$j<$dimensions2;$j++){
			if((($i == $master1) && ($j == $master2)) || (($i == $dimensions1-1) && ($j == 0)) || (($i == $dimensions1-1) && ($j == 1)) || (($i == $dimensions1-1) && ($j == 2))){
			
			print "$i $j \n";
			}
			else{
				$rede[$cont_rede][0] = $i;
				$rede[$cont_rede][1] = $j;
				$cont_rede = $cont_rede + 1;
			}
		}
	}

	for($i=0;$i<($dimensions1*$dimensions2)-4;$i++){
		$aux_array[$i] = $i;
		$aux_array[$i+($dimensions1*$dimensions2)-4] = $i;
	}
	
	
	
	@shuffled_array = shuffle(@aux_array);


	open( C_FILE, "<$config_file" );
	my @c_lines = <C_FILE>;
	close(C_FILE);
	
	#$config_file =~ s/\/Communication_config*//ig;
	#($path_app) = $config_file;
	
	foreach $c_line (@c_lines) {
		($aux_c) = $c_line;
					
		if($c_line =~ "#"){
			$aux_c =~ s/#//ig;
			$aux_c =~ s/\n//ig;
			$app_flag = 1;
			($applications[$count_app]) = $aux_c;
			$count_app = $count_app + 1;
			$count_task = 0;

		}
		
		else {
			$aux_c =~ s/\n//ig;
			($tasks[$count_app-1][$count_task]) = $aux_c;
			$count_task = $count_task + 1;
		
		}
	
	}
	


	open( C_FILE, ">$project_name.hmp" );	
		
	print C_FILE "[project name]\n$project_name\n";					
	print C_FILE "[page size]\n$page_size\n";					
	print C_FILE "[memory size]\n$memory_size\n";					
	print C_FILE "[processor description]\n$processor_description\n";					
	print C_FILE "[dimensions]\n$dimensions1\n$dimensions2\n";
	print C_FILE "[cluster size]\n$dimensions_cluster1\n$dimensions_cluster2\n";					
	print C_FILE "[masters location]\n$master_location\n";
	print C_FILE "[global master]\n$global_master\n";		
		
		
	$size_app=@applications;
	for($i=0;$i<$nro_applications;$i++){
		$size_task=$#{$tasks [$i]}+1;
		print C_FILE "[application]\n";
		print C_FILE "$application","_$i\n";
		print C_FILE "[start time]\n";
		print C_FILE "1 ms\n";
		print C_FILE "[end application]\n";

	}
			
			
	print C_FILE "[end]\n";
	close(C_FILE);



		
	sub shuffle {
    	my @a = splice @_;
    	for my $i (0 .. $#a) {
        	my $j = int rand @a;
        	@a[$i, $j] = @a[$j, $i];
    	}	
    	return @a;
	}

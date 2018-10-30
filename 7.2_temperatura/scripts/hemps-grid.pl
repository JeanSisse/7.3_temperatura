#!/usr/bin/perl
	use POSIX;
	
	if ($ARGV[0] ne "") {

		$path_regration = shift;
		$path = shift; #caminho do projeto
		$time=shift;   #numero de tarefas por processador
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}

		@colors=("white on_red","white on_green"); 
		
		$path =~ s/\/$//ig;
		@cs   = (<$path/*.hmp>);

		$errors=0;
		$count=0;		$time=shift;   #numero de tarefas por processador
		
		$length=0;
		
		foreach $aux (@cs) {
			#if (-d $aux) {
				if($time != 0){
					print "$aux\n";
					$aux =~ s/$path\///ig;
					$aux =~ s/\///ig;
					$aux =~ s/\.hmp//ig;
					

					$script = "hempstrunk; cp $aux.hmp /sim/; cd /sim/; perl  ~/hemps/trunk/scripts/hemps.pl $aux.hmp ~/hemps/trunk/applications/; cd /sim/$aux;make all;env >> env.txt; /usr/bin/time ./HeMPS -c $time 2>$aux.time; rm -rf build rep* *.o;cp /sim/$aux.hmp .;mkdir ~/hemps/trunk/regration/; mkdir ~/hemps/trunk/regration/$path_regration; cp -R /sim/$aux ~/hemps/trunk/regration/$path_regration/;rm -rf /sim/$aux.hmp /sim/$aux";
					system("echo '$script' > $path/run_$aux.sh; chmod +x $path/run_$aux.sh" );
					system("cd $path; qsub -q all.q -cwd run_$aux.sh" );

					#system("cd $path/;perl ../scripts/hemps.pl $aux.hmp /home/gcastilhos/hemps/trunk/applications/;cd $aux");
					#system("cd $path/$aux;make all");
					#system("cd $path/$aux;/usr/bin/time ./HeMPS -c $time 2>$aux.time");
				
				}
				else{
					$aux =~ s/$path//ig;
					$aux =~ s/\///ig;
					$aux =~ s/\.hmp//ig;
				}
				open( C_FILE, "<$path/$aux/output_master.txt" );
				my @c_lines = <C_FILE>;
				close(C_FILE);
				
				open( C_FILE_TIME, "<$path/$aux/$aux.time" );
				my @c_lines_times = <C_FILE_TIME>;
				close(C_FILE_TIME);
				
				$finish=0;
				foreach $c_line (@c_lines) {
					if($c_line =~ "FINISH"){
						$c_line =~ s/FINISH//ig;
						$c_line =~ s/\n//ig;
						$time_execution_clocks[$count]=$c_line;
						$finish=1;
					}
				}
				
				foreach $c_line_time (@c_lines_times) {
					if($c_line_time =~ "user"){
						@aux=split(/user/,$c_line_time);
						$time_execution[$count]=$aux[0];
					}
				}
				
				$list[$count][0]=$aux;
	
				if($finish == 0){
					$list[$count][1]=0;
					$errors=$errors+1;
					$count=$count+1;
				}
				else{
					$list[$count][1]=1;
					$count=$count+1;

				}
				
				$length_aux=length($aux);
				if($length < $length_aux){
					$length=$length_aux;
				}

			#}
			

		}
		
			print "$length \n\n\n\n";
	
					print "\n\nTESTCASES:\n";
			for($j=0;$j<$count;$j++){
				if($list[$j][1] == 1){
					print "$list[$j][0]";
					#$length_aux=ceil((($length+16)/length($list[$j][0])));
					
					for($i=0;$i<(($length+16)-length($list[$j][0]));$i++){
						print " ";

					}

					use Term::ANSIColor;
					print color $colors[1];
					print "PASS";
					print color 'reset';
					print "\t$time_execution_clocks[$j]";
					print "\t$time_execution[$j]\n";


				}
				else{
					print "$list[$j][0]";
					
					#$length_aux=ceil((($length+16)/length($list[$j][0])));
					for($i=0;$i<(($length+16)-length($list[$j][0]));$i++){
						print " ";

					}

					use Term::ANSIColor;
					print color $colors[0];
					print "FAIL";
					print color 'reset';
					#print "\t$time_execution_clocks[$j]";
					#print "\t$time_execution[$j]\n";
					print "\n";
					

				}
			}
			
		if($errors == 0){
			print "\n\nALL TESTS COMPLETED SUCCESSFULLY\n";
		}


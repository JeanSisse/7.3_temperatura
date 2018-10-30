#!/usr/bin/perl
	use POSIX;
	
	if ($ARGV[0] ne "") {

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
		$count=0;
		$length=0;
		
		foreach $aux (@cs) {
			#if (-d $aux) {
				if($time != 0){
					#print "$aux\n";
					$aux =~ s/$path\///ig;
					$aux =~ s/\///ig;
					$aux =~ s/\.hmp//ig;
					#system("cd $path/;perl ../scripts/hemps.pl $aux.hmp ../applications;cd $aux");
					#system("cd $path/$aux;make all");
					system("cd $path/$aux;/usr/bin/time ./HeMPS -c $time 2>$aux.time");
				}
				else{
					$aux =~ s/$path//ig;
					$aux =~ s/\///ig;
					$aux =~ s/\.hmp//ig;
				}

				$finish_flag = `tail -1 $path/$aux/output_master.txt 2> /dev/null | cut -d ' ' -f2 2> /dev/null`;
				$finish_time = `tail -1 $path/$aux/output_master.txt 2> /dev/null | cut -d ' ' -f1 2> /dev/null`;
				$current_time = `tail -1 $path/$aux/log_tasks.txt 2> /dev/null | cut -d ',' -f4 2> /dev/null`;
				
					$finish_flag =~ s/\n//ig;
					$finish_time =~ s/\n//ig;
					$current_time =~ s/\n//ig;

				open( C_FILE_TIME, "<$path/$aux/$aux.time" );
				my @c_lines_times = <C_FILE_TIME>;
				close(C_FILE_TIME);
				
				$finish=0;
				if($finish_flag eq "FINISH"){

					$time_execution_clocks[$count]=int($finish_time)/100000;
					$list[$count][1]=1;
					$errors=$errors+1;
				}
				else{
					$list[$count][1]=0;

				}
				

				$time_execution[$count]=int($current_time)/100000;

				
				$list[$count][0]=$aux;

				$count=$count+1;

				$length_aux=length($aux);
				if($length < $length_aux){
					$length=$length_aux;
				}

			#}
			

		}
		
					print "\n\nTESTCASES:";
					for($i=0;$i<(($length+16)-length($list[$j][0]));$i++){
						print " ";

					}
					print "Finish Time\tCurrent Time\n";

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
					print "\t\t$time_execution[$j]\n";


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
					print "\t$time_execution_clocks[$j]";
					print "\t\t$time_execution[$j]\n";
					

				}
			}
			
		if($errors == 0){
			print "\n\nALL TESTS COMPLETED SUCCESSFULLY\n";
		}


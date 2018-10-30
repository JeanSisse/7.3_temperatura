#!/usr/bin/perl
# hexadec.pl

$task=0;

	if ($ARGV[0] ne "") {
		$path_aux = shift; #caminho do projeto ou HMP
		$task=shift;   #numero de tarefas por processador
		$x_dimensions=shift; 
		$y_dimensions=shift;
		$x_cluster=shift; 
		$y_cluster=shift;
		$clusteres=shift; #numeto de clusters
	}
	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}
	@colors=("white on_red","white on_green","black on_red","black on_blue","black on_magenta","white on_red","black on_cyan",
		 "black on_green","black on_yellow","white on_magenta","white on_cyan","white on_yellow","white on_black",
		 "black on_white","white on_blue","green on_red","green on_blue","green on_white","green on_black","red on_blue",
		 "red on_green","green on_yellow","red on_magenta","red on_cyan","red on_yellow","red on_black","red on_white",	
		 "yellow on_green","yellow on_blue","yellow on_cyan","blue on_white","yellow on_black",
		 "blue on_green","blue on_yellow","yellow on_magenta","blue on_cyan"); 
		
	$path_aux =~ s/\/$//ig;
	@cs_p   = (<$path_aux/*.hmp>);

	$errors=0;
	$count=0;
	$length=0;
	
	foreach $auxx (@cs_p) {

		if($task == 0){
			($task,$x_dimensions, $y_dimensions, $x_cluster, $y_cluster) = read_hmp_file($auxx);
#			print "$task";
		}	

#	print "$path \n\n";
#	print "$auxx \n\n";
	
#		@colors=("white on_red","white on_green"); 
		$nc=($x_dimensions*$y_dimensions)/($x_cluster*$y_cluster);


		$auxx =~ s/$path_aux\///ig;
#		print "$auxx \n";
		$auxx =~ s/\///ig;
#		print "$auxx \n";
		$auxx =~ s/\.hmp//ig;
#		print "$auxx \n";
		system("cd $auxx");


		@cs_s   = `grep -r TASK_TERMINATED $path_aux/$auxx/log/*`;
		$size_cc = @cs_s;
		$counta = 0;
		$count_terminated = 0;
#		print "TAM $size_cc \n";
		for($i=0;$i<$size_cc;$i++){
	
			$cs_s[$i] =~ s/$path_aux\/$auxx\/log\///ig;	
					
			@teste = split(/:/,$cs_s[$i]);
	
			$teste[0] =~ s/.txt//ig;	
			$teste[0] =~ s/log//ig;
	
			@teste1 = split(/\t/,$teste[1]);
	
			$teste1[3] =~ s/\n//ig;
		
			$terminated[$i][0]=$teste[0];
			$terminated[$i][1]=$teste1[1];
			$terminated[$i][2]=$teste1[2];
			$terminated[$i][3]=$teste1[3];
#			print "$terminated[$i][0]\t";
#			print "$terminated[$i][1]\t";
#			print "$terminated[$i][2]\t";
#			print "$terminated[$i][3]\t\n";
			if(($teste[0] == $terminated[$i-1][0]) or ($i == 0)){
				$counta = $counta + 1;
			}
			else{
				if($count_terminated < $counta){
					$count_terminated = $counta;
				}
				$counta = 1;
			}
			if($count_terminated < $counta){
					$count_terminated = $counta;
			}
			

		}

		$size_t=$size_cc;
#		print "$size_t \n";
		for($i=0;$i<$size_t;$i++){
#			print "$terminated[$i][0]\n";
			if($terminated[$i][0]>=$x_dimensions*$nc){
				$ca=2;
				if($terminated[$i][0]<60){
					if($terminated[$i][0]<52){
						if($terminated[$i][0]<44){
							if($terminated[$i][0]<36){
								$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
							}else{
								if($terminated[$i][0]>39){
									$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
								}else{
									$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
								}
							}
						}else{
							if($terminated[$i][0]>47){
								$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
							}else{
								$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
							}
						}
					}else{
						if($terminated[$i][0]>55){
							$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
						}else{
							$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
						}
					}
				}else{
					$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
				}
			}else{
				$ca=0;
				if($terminated[$i][0]<28){
					if($terminated[$i][0]<20){
						if($terminated[$i][0]<12){
							if($terminated[$i][0]<4){
								$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
							}else{
								if($terminated[$i][0]>7){
									$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
								}else{
									$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
								}
							}
						}else{
							if($terminated[$i][0]>15){
								$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
							}else{
								$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
							}
						}
					}else{
						if($terminated[$i][0]>23){
								$tasks_c[$count][$ca]=$tasks_c[$count][$ca]+1;
							}else{
								$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
							}
					}
				}else{
					$tasks_c[$count][$ca+1]=$tasks_c[$count][$ca+1]+1;
				}
			}			
			
		}

#print "----------------------------\n";
		open( C_FILE, "<$path_aux/$auxx/output_master.txt" );
		my @c_lines = <C_FILE>;
		close(C_FILE);
		
		open( C_FILE, "<$path_aux/$auxx/log_energy.txt" );
		my @c_lines_instructions = <C_FILE>;
		close(C_FILE);
		
		$finish=0;
		foreach $c_line (@c_lines) {
			if($c_line =~ "FINISH"){
				$c_line =~ s/FINISH//ig;
				$c_line =~ s/\n//ig;
				$time_execution_clocks[$count]=$c_line;
				$finish=1;
#				print "$c_line \t\t";
			}
		}
#		print "\n\n";
		$tmp=0;
		$count_t=0;
		foreach $c_line_instructions (@c_lines_instructions) {
			$tmp=$tmp+1;
			if($tmp>$x_dimensions*$y_dimensions){
				if($c_line_instructions =~ "TOTAL"){
#					print "----------------------- \n";
#					print "$c_line_instructions \n";
					$c_line_instructions =~ s/TOTAL//ig;
					$instructions_pe[$count_t]=$c_line_instructions;
					$count_t=$count_t+1;
#					print "$c_line_instructions \n";
#				 	print "----------------------- \n";
				}
			}
		}
		

		for($i=0;$i<$x_dimensions;$i++){
			if($i*$x_dimensions>=$x_dimensions*$nc){
				$ca=2;
			}else{
				$ca=0;
			}
			for($j=$i*$y_dimensions;$j<($i+1)*$y_dimensions;$j++){
				if($j<$i*$y_dimensions+$nc){
					$instructions_c[$count][$ca]=$instructions_c[$count][$ca]+$instructions_pe[$j];
				}else{
					$instructions_c[$count][$ca+1]=$instructions_c[$count][$ca+1]+$instructions_pe[$j];
				}
			}
		}
#		print "CENARIO $auxx";
#		print "Numero de clusters $nc \n";
#		print "Numero de processadores @task_pe \n";
#		print "$y_dimensions\n";
#		print "$x_dimensions\n";

		$list[$count][0]=$auxx;
	
		if($finish == 0){
			$list[$count][1]=0;
			$errors=$errors+1;
			$count=$count+1;
		}
		else{
			$list[$count][1]=1;
			$count=$count+1;

		}
				
		$length_aux=length($auxx);
		if($length < $length_auxx){
			$length=$length_auxx;
		}

	}

#			print "---------->CENARIOS : $length \n\n\n";
			print "\n\t\t\t\t\t\t\t\t INSTRUCOES\t\t\t\t\t\t\tTAREFAS";
			print "\nTESTCASES:\t\tSTATUS\tTEMPO\t\tCLUSTER 0\tCLUSTER 1\tCLUSTER 2\tCLUSTER 3\tC 0\tC 1\tC 2\tC 3\n";
			for($j=0;$j<$count;$j++){
				if($list[$j][1] == 1){
					print "$list[$j][0]";
					#$length_aux=ceil((($length+16)/length($list[$j][0])));
					
					for($i=0;$i<(($length+16)-length($list[$j][0]));$i++){
						print " ";

					}
					print "\t";
					use Term::ANSIColor;
					print color $colors[1];
					print "PASS";
					print color 'reset';
					if($time_execution_clocks[$j]>9999999){
						print "\t$time_execution_clocks[$j]";
					}else{
						print "\t$time_execution_clocks[$j]\t";
					}
					for ($i=0;$i<$nc;$i++){
						print "\t$instructions_c[$j][$i] ";
					}
					for ($i=0;$i<$nc;$i++){
						print "\t $tasks_c[$j][$i]";
					}
					print "\n";

				}
				else{
					print "$list[$j][0]";
					
					#$length_aux=ceil((($length+16)/length($list[$j][0])));
					for($i=0;$i<(($length+16)-length($list[$j][0]));$i++){
						print " ";

					}
					print "\t";
					use Term::ANSIColor;
					print color $colors[0];
					print "FAIL";
					print color 'reset';
					for ($i=0;$i<$nc;$i++){
                                                print "\t $tasks_c[$j][$i]";
                                        }
					#print "\t$time_execution_clocks[$j]";
					#print "\t$time_execution[$j]\n";
					print "\n";
					

				}
			}








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
		if($hmp_line =~ /\[.*\]/ || $start_static != 0){							# linhas com "[]"
			

			if($hmp_line =~ /pages per pe/i){								# le o numero de paginas por PE
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
			
			if($hmp_line =~ /processor description/i){							# le a descrição do processador
				($procDescription_aux) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}
			if($hmp_line =~ /noc buffer size/ig){								# le o tamanho do buffer
				($NoC_buffer_size) = $hmp_lines[$i+1];
				$start_static = 0;
				next;
			}			
			if($hmp_line =~ /noc routing algorithm/ig){							# le o algoritmo de roteamento
				($NoC_routing_algorithm) = $hmp_lines[$i+1];
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
			
			if($hmp_line =~ /masters location/i){								# le a localizacao dos mestres (LB, RB, LT, RT);
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
						elsif($auxTime =~ /s/){								    	# second
							$auxTime =~ s/[a-z]//ig;
							$auxTime =~ s/\s//ig;
							$auxTime = $auxTime * 1000;
						}
						else{											# Default millisecond
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

	return $pagesPerPe_aux,$x_dimensions_aux, $y_dimensions_aux, $x_cluster_aux, $y_cluster_aux;
}


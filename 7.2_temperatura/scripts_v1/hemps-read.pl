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
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}
	
	if($task == 0){
		($path,$task,$x_dimensions, $y_dimensions, $x_cluster, $y_cluster) = read_hmp_file($path_aux);
		print "$task \n";
	}	
	
	@colors=("black on_red","black on_blue","black on_magenta","white on_red","black on_cyan","black on_white","white on_blue",
		 "black on_green","black on_yellow","white on_magenta","white on_green","white on_cyan","white on_yellow","white on_black",
		 
		 "green on_red","green on_blue","green on_white","green on_black","red on_blue",
		 "red on_green","green on_yellow","red on_magenta","red on_cyan","red on_yellow","red on_black","red on_white",	
		 
		 "yellow on_green","yellow on_blue","yellow on_cyan","blue on_white","yellow on_black",
		 "blue on_green","blue on_yellow","yellow on_magenta","blue on_cyan",);


for($i=0;$i<$x_dimensions;$i++){
	for($j=0;$j<$y_dimensions;$j++){
		$master[$i][$j]=0;
	}
}
for($i=0;$i<$x_dimensions;$i=$i+$x_cluster){
	for($j=0;$j<$y_dimensions;$j=$j+$y_cluster){
		$master[$i][$j]=1;
	}
}

	
	$path =~ s/\/$//ig;
	@cs   = `grep -r TASK_TERMINATED $path/log/*`;
	$size_c = @cs;
	$count = 0;
	$count_terminated = 0;
	print "$size_c tarefas terminadas  \n";


for($i=0;$i<$size_c;$i++){
	
	$cs[$i] =~ s/$path\/log\///ig;	
					
	@teste = split(/:/,$cs[$i]);
	
	$teste[0] =~ s/.txt//ig;	
	$teste[0] =~ s/log//ig;
	
	@teste1 = split(/\t/,$teste[1]);
	
	$teste1[3] =~ s/\n//ig;
		
	$terminated[$i][0]=$teste[0];
	$terminated[$i][1]=$teste1[1];
	$terminated[$i][2]=$teste1[2];
	$terminated[$i][3]=$teste1[3];
	
	if(($teste[0] == $terminated[$i-1][0]) or ($i == 0)){
		$count = $count + 1;
	}
	else{
		if($count_terminated < $count){
			$count_terminated = $count;
		}
		$count = 1;
	}
	if($count_terminated < $count){
			$count_terminated = $count;
	}

}
	$path=$path_aux;
	$path =~ s/\/$//ig;
	@cs   = `grep -r TASK_ALLOCATION $path/log/*`;
	$size_c = @cs;
	$count = 0;
	$count_allocation = 0;
	print "$size_c tarefas alocadas \n\n";


for($i=0;$i<$size_c;$i++){
	
	$cs[$i] =~ s/$path\/log\///ig;	
					
	@teste = split(/:/,$cs[$i]);
	
	$teste[0] =~ s/.txt//ig;	
	$teste[0] =~ s/log//ig;
	
	@teste1 = split(/\t/,$teste[1]);
	
	$teste1[3] =~ s/\n//ig;
		
	$allocation[$i][0]=$teste[0];
	$allocation[$i][1]=$teste1[1];
	$allocation[$i][2]=$teste1[2];
	$allocation[$i][3]=$teste1[3];
	

	if(($teste[0] == $allocation[$i-1][0]) or ($i == 0)){
		$count = $count + 1;
	}
	else{
		if($count_allocation < $count){
			$count_allocation = $count;
		}
		$count = 1;
	}
	if($count_allocation < $count){
		$count_allocation = $count;
	}

}
	

$count_total = $count_allocation + $count_terminated;
$total_proc = $x_dimensions * $y_dimensions;


for($i=$y_dimensions;$i>0;$i--){
	$aux=($i-1)*$x_dimensions;

	for($j=0;$j<$x_dimensions;$j++){
		
		$aux2= $i-1;
		$aux3= sprintf("%x", $aux2);
		$aux4= sprintf("%x", $j);

		if($master[$aux4][$aux3] == 1 and ($aux4 == 0 and $aux3 == 0)){
			$imprimir[$aux] = $imprimir[$aux]."+-----------------------\n";	
			$imprimir[$aux] = $imprimir[$aux]."|";
			$imprimir[$aux] = $imprimir[$aux]."  $aux ";
			$imprimir[$aux] = $imprimir[$aux]."$aux4";
			$imprimir[$aux] = $imprimir[$aux]."x";
			$imprimir[$aux] = $imprimir[$aux]."$aux3";
			$imprimir[$aux] = $imprimir[$aux]." Global Master";	
			$imprimir[$aux] = $imprimir[$aux]."\t";
			$imprimir[$aux] = $imprimir[$aux]."\n";
		}
		else {		
			if($master[$aux4][$aux3] == 1){
				$imprimir[$aux] = $imprimir[$aux]."+-----------------------\n";	
				$imprimir[$aux] = $imprimir[$aux]."|";
				$imprimir[$aux] = $imprimir[$aux]."  $aux ";
				$imprimir[$aux] = $imprimir[$aux]."$aux4";
				$imprimir[$aux] = $imprimir[$aux]."x";
				$imprimir[$aux] = $imprimir[$aux]."$aux3";
				$imprimir[$aux] = $imprimir[$aux]." Local Master";	
				$imprimir[$aux] = $imprimir[$aux]."\t";
				$imprimir[$aux] = $imprimir[$aux]."\n";
			}
			else {
				$imprimir[$aux] = $imprimir[$aux]."+-----------------------\n";	
				$imprimir[$aux] = $imprimir[$aux]."|";
				$imprimir[$aux] = $imprimir[$aux]."  $aux ";
				$imprimir[$aux] = $imprimir[$aux]."$aux4";
				$imprimir[$aux] = $imprimir[$aux]."x";
				$imprimir[$aux] = $imprimir[$aux]."$aux3";	
				$imprimir[$aux] = $imprimir[$aux]." Slave";		
				$imprimir[$aux] = $imprimir[$aux]."\t\t";
				$imprimir[$aux] = $imprimir[$aux]."\n";
			}
		}
		
		$cont_aux=0;

		$size= @allocation;
		for($k=0;$k<$size;$k++){
			if($allocation[$k][0] == $aux){
				$imprimir[$aux] = $imprimir[$aux]."|\t";
				$imprimir[$aux] = $imprimir[$aux]."$allocation[$k][1]  $allocation[$k][2]  A $allocation[$k][3]\t";
				$imprimir[$aux] = $imprimir[$aux]."\n";				
				$cont_aux= $cont_aux + 1;
			}
		}
		
		$size= @terminated;
		for($k=0;$k<$size;$k++){
			if($terminated[$k][0] == $aux ){
				$imprimir[$aux] = $imprimir[$aux]."|\t";
				$imprimir[$aux] = $imprimir[$aux]."$terminated[$k][1]  $terminated[$k][2]  T $terminated[$k][3]\t";
				$imprimir[$aux] = $imprimir[$aux]."\n";				
				$cont_aux= $cont_aux + 1;
			}
		}
		
		while($cont_aux != $count_total){

			$imprimir[$aux] = $imprimir[$aux]."|\t\t\t\n";
			$cont_aux= $cont_aux + 1;
		}
		

	#	$imprimir[$aux] = $imprimir[$aux]." +----------------------+\n";	
		
		
		
		
	#	print "$imprimir[$aux]\n";
		$aux= $aux+1;
		
		
	}	

}


	for($i=$y_dimensions;$i>0;$i--){
		$aux=($i-1)*$x_dimensions;
		for($j=0;$j<$x_dimensions;$j++){
			@teste= split(/\n/,$imprimir[$aux]);
			$size = @teste;
			
				for($k=0;$k<$size;$k++){
					$print_final[$k] = $print_final[$k].":$teste[$k]";
				}
			#print "$aux\t";
			$aux= $aux+1;
		}
			for($k=0;$k<$size;$k++){
				
				if(($print_final[$k] =~ /A/)or ($print_final[$k] =~ /T/)){
					@toto = split(/:/,$print_final[$k]);
					$size_toto = @toto;
					
					for($t=0;$t<$size_toto;$t++){
						if($toto[$t] =~ /A/ or $toto[$t] =~ /T/ ){
							$toto[$t] =~ s/://ig;
							$toto[$t] =~ s/\|//ig;
							@xuxu = split(/ /,$toto[$t]);
							$xuxu[0] =~ s/\|\t//ig;
							
							print "|";
														
							use Term::ANSIColor;
							print color $colors[$xuxu[0]];
							print "$toto[$t]";
							print color 'reset';
						}
							else{
								$toto[$t] =~ s/://ig;	
								print "$toto[$t]";
							}
					}
					print "|\n";
				}
				else{
					if($k != 0){
						$print_final[$k] =~ s/://ig;	
						print "$print_final[$k]|\n";
					}
					else {
						$print_final[$k] =~ s/://ig;	
						print "$print_final[$k]+\n";
					}
				}
				$print_final[$k]="";
			}
	}
	for($j=0;$j<$x_dimensions;$j++){
		print "+-----------------------";	
	
	}
		print "+\n";	



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

	return $projectName_aux,$pagesPerPe_aux,$x_dimensions_aux, $y_dimensions_aux, $x_cluster_aux, $y_cluster_aux;
}

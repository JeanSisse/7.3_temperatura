#!/usr/bin/perl


	if ($ARGV[0] ne "") {

		$path = shift; #caminho do projeto
		$task=shift;   #numero de tarefas por processador
		$dimensions1=shift; 
		$dimensions2=shift;
		$app = shift;
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}

	$path =~ s/\/$//ig;
	@cs   = (<$path/log/log*.txt>);
	$size_c = @cs;
	$media=0;
	$max= 0;

for($i=0;$i<25000;$i++){
$aux[0][$i]=-1;
$aux[1][$i]=-1;
}
	foreach $c_file (@cs) {
		open( C_FILE, "<$c_file" );
		my @c_lines = <C_FILE>;
		close(C_FILE);

		@aux5=split(/log/,$c_file);
		@aux6=split(/.txt/,$aux5[2]);
		

		foreach $c_line (@c_lines) {
		
				($aux_c) = $c_line;
					
				if($c_line =~ "TASK_ALLOCATION"){
					@teste = split(/\t/,$c_line);

					$teste[2] =~ s/\n//ig;					
					$teste[1] =~ s/\n//ig;
					if($max < $teste[1]){
					$max= $teste[1];
					}
					
					$aux[0][$teste[1]] = $teste[2];
				}
				
				if($c_line =~ "TASK_TERMINATED" or $c_line =~ "Task_Terminated"){

					@teste = split(/\t/,$c_line);
					$teste[2] =~ s/\n//ig;
					$teste[1] =~ s/\n//ig;
					
					$aux_c =~ s/\n//ig;
				#print "$aux_c\n";
					if((($dimensions1-1) == $aux6[0]) || (($dimensions1-1)+$dimensions1 == $aux6[0]) || (($dimensions1-1)+$dimensions1*2 == $aux6[0])){
					$aux[1][$teste[1]] = $teste[2];
					}
					else{
						$aux[1][$teste[1]] = $teste[2];
					}

				}
			}


		}

	$path =~ s/\\//ig;
		
		$cont_task=1;
		$cont_task1=0;
		$cont_app = 0;
		$min=0;
		$max1=0;
			
		open( C_FILE, ">$path.txt" );	
			for($i=0;$i<=$max;$i++){
				if($aux[0][$i] != -1){
				print C_FILE "$i\t";
				
				
				print C_FILE "$aux[0][$i]\t";				
				print C_FILE "$aux[1][$i]\t";				
				#$cont=$aux[1][$i]-$aux[0][$i];
				print C_FILE "\n";
				##if($cont == 0){
				##	}
				##else{
				##	$media = $media + $cont;
				$cont_task1=$cont_task1+1;
				#}
				
				if($cont_task <= $app){
					if($min > $aux[0][$i] or $min == 0){
						$min = $aux[0][$i];
					}				
					if($max1 < $aux[1][$i] or $max1 == 0){
						$max1 = $aux[1][$i];
					}
					
					$cont_task=$cont_task+1;

				}
				else{
					$app_rep[$cont_app][0]=$min;
					$app_rep[$cont_app][1]=$max1;
					$min=0;
					$max1=0;
					$cont_app = $cont_app + 1;

					$cont_task=1;
					if($min > $aux[0][$i] or $min == 0){
						$min = $aux[0][$i];
					}				
					if($max1 < $aux[1][$i] or $max1 == 0){
						$max1 = $aux[1][$i];
					}
					$cont_task=$cont_task+1;


				}
			}
		}
			$app_rep[$cont_app][0]=$min;
			$app_rep[$cont_app][1]=$max1;

		

			print C_FILE "Total de tarefas = \t$cont_task1\n\n";
			
			print C_FILE "Aplicação - \tInicio\t Fim\n";
			for($i=0;$i<=$cont_app;$i=$i+1){
				print C_FILE "$i\t\t";				
				print C_FILE "$app_rep[$i][0]\t";				
				print C_FILE "$app_rep[$i][1]\n";				
			}

			$cont=$aux[1][5]-$aux[0][0];
			$media = $media + $cont;
			$cont_task=$cont_task+1;

			for($i=6;$i<(($dimensions1*$dimensions2)*$task)-3;$i=$i+6){
				$cont=$aux[1][$i+5]-$aux[0][$i];
				if($cont == 0){
					}
				else{
					$media = $media + $cont;
					$cont_task=$cont_task+1;

			}
			}
			$media = ($media/$cont_task);
				##print C_FILE "Tempo_medio_tarefa\t$media\n";
		close(C_FILE);

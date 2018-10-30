#!/usr/bin/perl
# hexadec.pl

if ($ARGV[0] ne "") {

	$max_power 		= shift; # max power 
	$n_processor	= shift; # n. processor
	$n_inercia		= shift; # tamanho da inercia térmica 
	$temp_inicial	= shift; # temperatura inicial
	$x				= shift; # x
	$y				= shift; # y

}

else {
	print "ERRO, falta de argumento\n";
	exit;
}

$path_pre_modelo = "pre_modelo";

for($i=0;$i<$n_processor;$i++){

	open( FILE_PRE_MODELO, ">./$path_pre_modelo/p$i.txt");

	for($j=0;$j<$n_processor;$j++){
		print FILE_PRE_MODELO "p$j\t";
	}
	print FILE_PRE_MODELO "\n";

	for($j=0;$j<$n_processor;$j++){
		if($j == $i){
			print FILE_PRE_MODELO "$max_power\t";
		}
		else{
			print FILE_PRE_MODELO "0\t";
		}
	}
	print FILE_PRE_MODELO "\n";

	for($t=1;$t<$n_inercia;$t++){
		for($j=0;$j<$n_processor;$j++){
			print FILE_PRE_MODELO "0\t";
		}
		print FILE_PRE_MODELO "\n";
	}
}

for($i=0;$i<$n_processor;$i++){

	system("./hotspot -c hotspot.config -f hemps_3x3.flp -p ./$path_pre_modelo/p$i.txt -o ./$path_pre_modelo/pre_$i.txt");

}


for($i=0;$i<$n_processor;$i++){

	open( FILE_PRE_MODELO, "<./$path_pre_modelo/pre_$i.txt" ) or die("Could not open file $_[0].");
	my @pre_lines_aux = <FILE_PRE_MODELO>;
	close(FILE_PRE_MODELO);
	$size_pre_modelo = @pre_lines_aux;
	open( FILE_COE_MODELO, ">./$path_pre_modelo/coeficientes_$i.txt");

    use POSIX;
	$y_atual = floor(($i)/$x);
	$x_atual = $i - ($y_atual)*$x;
	
	print "x_atual $x_atual y_atual $y_atual \n";

	for($j=1;$j<$size_pre_modelo;$j++){
		
		$pre_lines_aux[$j]=~ s/\n//ig; 
		@power_pre_lines_aux = split(/\t/,$pre_lines_aux[$j]);
		
		@vetor_coeficiente = (0,0,0,0,0,0,0,0);
		
		for($t=0;$t<$n_processor;$t++){
			
			$y_aux = floor(($t)/$x);
			$x_aux = $t - ($y_aux)*$x;
				
			
			if($j == 1){
				$power_pre_modelo[$i][$j-1][$t] = $power_pre_lines_aux[$t] - $temp_inicial;
			}
			else{
				$power_pre_modelo[$i][$j-1][$t] = $power_pre_lines_aux[$t] - $power_pre_lines_anterior[$j-2][$t];

			}
			$power_pre_lines_anterior[$j-1][$t] = $power_pre_lines_aux[$t];
			

			if(($y_aux == $y_atual-1) and ($x_aux == $x_atual-1)){						#  6  7  8
				$vetor_coeficiente[0] = $power_pre_modelo[$i][$j-1][$t];				#  3  4  5	
			}																			# |0| 1  2
			
			
			if(($y_aux == $y_atual-1) and ($x_aux == $x_atual)){						#  6  7  8
				$vetor_coeficiente[1] = $power_pre_modelo[$i][$j-1][$t];				#  3  4  5	
			}																			#  0 |1| 2
			
			
			if(($y_aux == $y_atual-1) and ($x_aux == $x_atual+1)){						#  6  7  8
				$vetor_coeficiente[2] = $power_pre_modelo[$i][$j-1][$t];				#  3  4  5	
			}																			#  0  1 |2|
			

			if(($y_aux == $y_atual) and ($x_aux == $x_atual-1)){						#  6  7  8
				$vetor_coeficiente[3] = $power_pre_modelo[$i][$j-1][$t];				# |3| 4  5	
			}																			#  0  1  2
			
			
			if(($y_aux == $y_atual) and ($x_aux == $x_atual)){							#  6  7  8
				$vetor_coeficiente[4] = $power_pre_modelo[$i][$j-1][$t];				#  3 |4| 5	
			}																			#  0  1  2
			
			
			if(($y_aux == $y_atual) and ($x_aux == $x_atual+1)){						#  6  7  8
				$vetor_coeficiente[5] = $power_pre_modelo[$i][$j-1][$t];     		  	#  3  4 |5|
			}                                                                           #  0  1  2


			if(($y_aux == $y_atual+1) and ($x_aux == $x_atual-1)){						# |6| 7  8
				$vetor_coeficiente[6] = $power_pre_modelo[$i][$j-1][$t];       			#  3  4  5
			}                                                                           #  0  1  2
		
		
			if(($y_aux == $y_atual+1) and ($x_aux == $x_atual)){						#  6 |7| 8
				$vetor_coeficiente[7] = $power_pre_modelo[$i][$j-1][$t];       			#  3  4  5
			}                                                                           #  0  1  2


			if(($y_aux == $y_atual+1) and ($x_aux == $x_atual+1)){						#  6  7 |8|
				$vetor_coeficiente[8] = $power_pre_modelo[$i][$j-1][$t];       			#  3  4  5
			}                                                                           #  0  1  2		
		}
		
			for($h=0;$h<$n_processor;$h++){
			
				printf FILE_COE_MODELO "%.64f\t", $vetor_coeficiente[$h];
				$vetor_coeficiente[$h]=0;

			}
			printf FILE_COE_MODELO "\n";

	}
	close (FILE_COE_MODELO);
}






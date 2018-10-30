#!/usr/bin/perl
# hexadec.pl

if ($ARGV[0] ne "") {

	$max_power 			= shift; # max power 
	$n_processor		= shift; # n. processor
	#$n_inercia			= shift; # tamanho da inercia térmica 
	$temp_inicial		= shift; # temperatura inicial
	$arquivo_entrada	= shift; # arquivo de entrada
	$x					= shift; # x
	$y					= shift; # y
}

else {
	print "ERRO, falta de argumento\n";
	exit;
}

$path_pre_modelo = "pre_modelo";


open( FILE_ENTRADA, "<$arquivo_entrada" ) or die("Could not open file $_[0].");
my @entrada_lines_aux = <FILE_ENTRADA>;
close(FILE_ENTRADA);
$size_entrada = @entrada_lines_aux;


	

open( FILE_PRE_MODELO, "<$path_pre_modelo\/coeficientes_4.txt" ) or die("Could not open file $_[0].");
my @entrada_pre_modelo = <FILE_PRE_MODELO>;
close(FILE_PRE_MODELO);
$size_pre_modelo = @entrada_lines_aux;

	for($i=0;$i<($size_entrada+$size_pre_modelo);$i++){
		for($j=0;$j<$n_processor;$j++){
			$temp_modelo[$i][$j]=0;
		}
	}

	for($i=0;$i<($size_pre_modelo);$i++){
		$entrada_pre_modelo[$i]=~ s/\n//ig;
		@aux = split(/\t/,$entrada_pre_modelo[$i]);
		
		for($j=0;$j<9;$j++){
			$power_pre_modelo[$i][$j]=$aux[$j];
			print "$power_pre_modelo[$i][$j] gui \n"; 
		}
	}
	
	



open( FILE_MODELO, ">saida_modelo.txt");

for($i=1;$i<$size_entrada;$i++){

		$entrada_lines_aux[$i]=~ s/\n//ig;
		@power_entrada_lines = split(/\t/,$entrada_lines_aux[$i]);
		#print "@power_entrada_lines\n";

		for($g=0;$g<$n_processor;$g++){

			if($power_entrada_lines[$g] ne 0 ){
				use POSIX;
				$y_atual = floor(($g)/$x);
				$x_atual = $g - ($y_atual)*$x;
				
				for($j=1;$j<$size_pre_modelo;$j++){
					for($t=0;$t<$n_processor;$t++){
						
						$y_aux = floor(($t)/$x);
						$x_aux = $t - ($y_aux)*$x;
						print "$y_atual $y_aux $x_atual $x_aux\n";
						
						if(($y_aux == $y_atual-1) and ($x_aux == $x_atual-1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][0]) + $temp_modelo[($j-1)+($i-1)][$t];
																									#  6  7  8	
						}																			#  3  4  5
																									# |0| 1  2
						
						
						if(($y_aux == $y_atual-1) and ($x_aux == $x_atual)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][1]) + $temp_modelo[($j-1)+($i-1)][$t];
						}																			#  6  7  8
						                                                                            #  3  4  5
						                                                                            #  0 |1| 2
						                                                                            
						                                                                            
						if(($y_aux == $y_atual-1) and ($x_aux == $x_atual+1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][2]) + $temp_modelo[($j-1)+($i-1)][$t];
						}																			#  6  7  8
						                                                                            #  3  4  5	
                                                                                                    #  0  1 |2|
                                                                                                    
                                                                                                    
						if(($y_aux == $y_atual) and ($x_aux == $x_atual-1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][3]) + $temp_modelo[($j-1)+($i-1)][$t];
						}																			#  6  7  8
						                                                                            # |3| 4  5
						                                                                            #  0  1  2
						                                                                            
						                                                                            
						if(($y_aux == $y_atual) and ($x_aux == $x_atual)){							
														
							print "match $teste $temp_modelo[($j-2)+($i-1)][$t] $temp_modelo[($j-1)+($i-1)][$t]\n";
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][4]) + $temp_modelo[($j-1)+($i-1)][$t];
							
						}																			#  6  7  8
						                                                                            #  3 |4| 5
						                                                                            #  0  1  2
						                                                                            
						                                                                            
						if(($y_aux == $y_atual) and ($x_aux == $x_atual+1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][5]) + $temp_modelo[($j-1)+($i-1)][$t];
						}                                                                           #  6  7  8
                                                                                                    #  3  4 |5|
                                                                                                    #  0  1  2
                                                                                                    
                                                                                                    
						if(($y_aux == $y_atual+1) and ($x_aux == $x_atual-1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][6]) + $temp_modelo[($j-1)+($i-1)][$t];
						}                                                                           # |6| 7  8
					                                                                                #  3  4  5
					                                                                                #  0  1  2
					                                                                                
					                                                                                
						if(($y_aux == $y_atual+1) and ($x_aux == $x_atual)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][7]) + $temp_modelo[($j-1)+($i-1)][$t];
						}                                                                           #  6 |7| 8
                                                                                                    #  3  4  5
						                                                                            #  0  1  2
						                                                                            
						                                                                            
						if(($y_aux == $y_atual+1) and ($x_aux == $x_atual+1)){						
							$temp_modelo[($j-1)+($i-1)][$t] = (($power_entrada_lines[$g]/$max_power) * $power_pre_modelo[$j-1][8]) + $temp_modelo[($j-1)+($i-1)][$t];
						}                                                                           #  6  7 |8|
		                                                                                            #  3  4  5
						                                                                            #  0  1  2
						
					}
				}
				
				
			}
			
		
		for (my $k= 0; $k < $n_processor; $k++){
		
			if($i == 1){	
				$temperatura_final[$i-1][$k] = $temp_inicial + $temp_modelo[$i-1][$k];
			}
			else{
				$temperatura_final[$i-1][$k] = $temperatura_final[$i-2][$k] + $temp_modelo[$i-1][$k];

			}
		
		}
						
		}
}

for (my $j= 0; $j < $size_entrada-1; $j++)
{
        for (my $k= 0; $k < $n_processor; $k++)
        {
			print "$temperatura_final[$j][$k]\t";
        }
		print "\n";

}

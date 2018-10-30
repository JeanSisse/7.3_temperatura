	if ($ARGV[0] ne "") {

		$x= shift;
		$y= shift;
		$x_cluster = shift;
		$y_cluster= shift;
		$path = shift;
		
	}

	else {
	  print "ERROR\n";
	  exit;
	}

read_file("$path/log_tasks_full.txt");



sub read_file{

	open( FILE, "<$_[0]" ) or die("Could not open file $_[0].");
	my @file_lines_aux = <FILE>;
	close(FILE);
	my $size_file = @file_lines_aux;
	
    use POSIX;
    
	$total_slices=ceil(($size_file)/($x*$y-(($x*$y)/($x_cluster*$y_cluster))));
	
	print "$size_file";
		
	$total_pe=$size_file/$total_slices;	
	
	for($i=0;$i<=$total_slices;$i++){
		for($j=0;$j<=$y;$j++){
			for($t=0;$t<=$x;$t++){
				$matrix_number_instrucoes[$t][$j]=0;
				$matrix_number_instrucoes_instantanea[$i][$t][$j]=-1;
			}
		}
	}

	
	$aux_maior=0;
	$aux_number=0;

	for($i=1;$i<$total_slices;$i++){
		for($j=0;$j<$total_pe;$j++){
			
			$file_lines_aux[$j+$total_pe*$i] =~ s/\n//ig;

			@file_split_aux = split(/ /,$file_lines_aux[$j+$total_pe*$i]);
	
			$Energy_Arithmetic	= 26.05; # pJ@100MHz
			$Energy_Load_Store	= 44.49; # pJ
			$Energy_Logical		= 22.69; # pJ
			$Energy_Move		= 21.10; # pJ
			$Energy_Shift		= 21.76; # pJ
			$Energy_Jump		= 20.30; # pJ	
			$Energy_Branch		= 31.24; # pJ	
			$Energy_Nop			= 14.68; # pJ	
			$Energy_Mult_Div	= 22.67; # pJ
			$Energy_Other		= 26.05; # pJ

			$aux_posicao=$file_split_aux[0];
			$aux_y = 0xFF & $aux_posicao;
			$aux_x = $aux_posicao >> 8;
			$aux_number[$aux_x][$aux_y]=$matrix_number_instrucoes[$aux_x][$aux_y];
			$matrix_number_instrucoes[$aux_x][$aux_y]=$aux_number[$aux_x][$aux_y]+abs($matrix_number_instrucoes[$aux_x][$aux_y]-($file_split_aux[1]*$Energy_Logical+$file_split_aux[2]*$Energy_Jump+$file_split_aux[3]*$Energy_Branch+$file_split_aux[4]*$Energy_Move+$file_split_aux[5]*$Energy_Other+$file_split_aux[6]*$Energy_Arithmetic+$file_split_aux[7]*$Energy_Load_Store+$file_split_aux[8]*$Energy_Shift+$file_split_aux[9]*$Energy_Nop+$file_split_aux[10]*$Energy_Mult_Div)*0.000001);
			if($aux_x == 1 and $aux_y == 1){
			print "$matrix_number_instrucoes[1][1] $aux_number[1][1]\n";
		}
			$matrix_number_instrucoes_instantanea[$i][$aux_x][$aux_y]=($file_split_aux[1]*$Energy_Logical+$file_split_aux[2]*$Energy_Jump+$file_split_aux[3]*$Energy_Branch+$file_split_aux[4]*$Energy_Move+$file_split_aux[5]*$Energy_Other+$file_split_aux[6]*$Energy_Arithmetic+$file_split_aux[7]*$Energy_Load_Store+$file_split_aux[8]*$Energy_Shift+$file_split_aux[9]*$Energy_Nop+$file_split_aux[10]*$Energy_Mult_Div)*0.00000001;

			$matrix_ticks[$j+$total_pe*$i]=$file_split_aux[3];
		}
	}
	

	mkdir("$path/logs_instrucoes");
	#system("cp $path/../makefile $path/logs_instrucoes;cp $path/../plot.py $path/logs_instrucoes ");	


	open( C_FILE2, ">$path/logs_instrucoes/instrucoes_global.txt" );

	print C_FILE2 "0 PARTIAL\n";

		for($j=$y-1;$j>=0;$j--){
			for($t=0;$t<$x;$t++){
				print C_FILE2 "0\t";
			}
			print C_FILE2 "\n";


		}		
		print C_FILE2 "\n";

	
	for($i=1;$i<$total_slices;$i++){
	
	open( C_FILE, ">$path/logs_instrucoes/instrucoes_global_$i.dat" );
	
	print C_FILE "$x";
	print C_FILE "x";
	print C_FILE "$y\n";

	print C_FILE2 "$i PARTIAL\n";

		for($j=$y-1;$j>=0;$j--){
			for($t=0;$t<$x;$t++){
				if($matrix_number_instrucoes[$t][$j] != -1){
					print C_FILE "$matrix_number_instrucoes[$t][$j]\t";
					print C_FILE2 "$matrix_number_instrucoes[$t][$j]\t";

				}
				else{
					print C_FILE "0\t";
					print C_FILE2 "0\t";

				}
			}
			print C_FILE "\n";
			print C_FILE2 "\n";


		}		
		close( C_FILE );
		print C_FILE2 "\n";
	
	}
		close( C_FILE2);


	open( C_FILE1, ">$path/logs_instrucoes/instrucoes_instantanea.txt" );

	print C_FILE1 "0 PARTIAL\n";

		for($j=$y-1;$j>=0;$j--){
			for($t=0;$t<$x;$t++){
				print C_FILE1 "0\t";
			}
			print C_FILE1 "\n";


		}		
		print C_FILE1 "\n";
	



	for($i=1;$i<$total_slices;$i++){
	
	open( C_FILE, ">$path/logs_instrucoes/instrucoes_instantanea_$i.dat" );
	
	print C_FILE "$x";
	print C_FILE "x";
	print C_FILE "$y\n";

	print C_FILE1 "$i PARTIAL\n";


		for($j=$y-1;$j>=0;$j--){
			for($t=0;$t<$x;$t++){
				if($matrix_number_instrucoes_instantanea[$i][$t][$j] != -1){
					print C_FILE "$matrix_number_instrucoes_instantanea[$i][$t][$j]\t";
					print C_FILE1 "$matrix_number_instrucoes_instantanea[$i][$t][$j]\t";
				}
				else{
					print C_FILE "0\t";
					print C_FILE1 "0\t";
				}
			}
			print C_FILE "\n";
			print C_FILE1 "\n";

		}		
		close( C_FILE );
		print C_FILE1 "\n";


	
	}
		close( C_FILE1 );

}

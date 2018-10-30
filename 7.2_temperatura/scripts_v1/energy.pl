#!/usr/bin/perl

	if ($ARGV[0] ne "") {

		$time_input = shift;
		$path = shift;
		
	}

	else {
	  print "ERROR\n";
	  exit;
	}
	$periodo		= 10;
	$time			= $time_input*$periodo;
	

	$Energy_Arithmetic	= 26.05; # pJ@100MHz
	$Energy_Load_Store	= 44.49; # pJ
	$Energy_Logical		= 22.69; # pJ
	$Energy_Move		= 21.10; # pJ
	$Energy_Shift		= 21.76; # pJ
	$Energy_Jump		= 20.30; # pJ	
	$Energy_Branch		= 31.24; # pJ	
	$Energy_Nop		    = 14.68; # pJ	
	$Energy_Mult_Div	= 22.67; # pJ
	$Energy_Other		= 26.05; # pJ
	
	$n_Ports_3=3;	
	$n_Ports_4=4;	
	$n_Ports_5=5;


	#100MHz
	$Power_avg_buffer_without_traffic = 30.24;	
	$Power_avg_buffer_injection_full = 219.06;	

	$Power_avg_crossbar_without_traffic = 0.31;	
	$Power_avg_crossbar_injection_full = 40.76;	

	$Power_avg_control_logic_without_traffic = 27.08;	
	$Power_avg_control_logic_injection_full = 80.20;

	#10MHz
	$Power_avg_buffer_without_traffic_hold = 4.64;	
	$Power_avg_crossbar_without_traffic_hold = 0.313;	
	$Power_avg_control_logic_without_traffic_hold = 3.543;	



	$Power_avg_Arithmetic		=  2.705;  # power per instruction @ 100 MHz
	$Power_avg_Load_Store		=  2.151;
	$Power_avg_Logical			=  2.269;
	$Power_avg_Move				=  2.264;
	$Power_avg_Shift			=  2.175;
	$Power_avg_Jump				=  1.851;	
	$Power_avg_Branch			=  3.114;	
	$Power_avg_Nop				=  1.467;	
	$Power_avg_Mult_Div			=  1.703;
	$Power_avg_Other			=  0;
	
	$Power_Router_ativo_3	= $n_Ports_3*1000; # nW@100MHz
	$Power_Router_ativo_4	= $n_Ports_4*30.37*1000; # nW
	$Power_Router_ativo_5	= $n_Ports_5*79.27*1000; # nW	
	
	#$Power_Router_inativo_3	= 111.01*1000; # nW@10MHz
	#$Power_Router_inativo_4	= 138.98*1000; # nW
	#$Power_Router_inativo_5	= 166.96*1000; # nW	

	$Power_Router_inativo_3	= $n_Ports_3*1000; # nW@100MHz
	$Power_Router_inativo_4	= $n_Ports_4*30.37*1000; # nW
	$Power_Router_inativo_5	= $n_Ports_5*79.27*1000; # nW	
	
	$Energy_Wire_Flit = 4.21248; # pJ
	$Ac_Wire_flit = 0.4;



read_file($path);

	print "\n\n\tMATRIX INST CPU\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_inst_cpu[$j][$i]);
		}
		print "\n";
	}
		print "\n";
		
		print "\n\n\tMATRIX ENERGY CPU (pJ)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_cpu[$j][$i]);
		}
		print "\n";
	}
		print "\n";

	print "\n\n\tMATRIX ENERGY CPU IDLE (pJ)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_energy_Cpu_idle[$j][$i]);
		}
		print "\n";
	}
		print "\n";
		
		
	print "\n\n\tMATRIX AVG POWER CPU (mW)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_Avg_Power_Cpu[$j][$i]);
		}
		print "\n";
	}
		print "\n";



	print "\n\n\tMATRIX ENERGY ROUTER ATIVO(pJ)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_energy_router_ativo[$j][$i]);
		}
		print "\n";
	}
		print "\n";

	print "\n\n\tMATRIX ENERGY ROUTER INATIVO(pJ)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%12.2f ",$matrix_energy_router_inativo[$j][$i]);
		}
		print "\n";
	}
		print "\n";

	print "\n\n\tMATRIX POWER ROUTER (mW)\n";
	for($i=$y-1;$i>=0;$i--){
		for($j=0;$j<$x;$j++){
			printf ("%8.4f ",$matrix_power_Router[$j][$i]);
		}
		print "\n";
	}
		print "\n";



	print "\n\n\tMATRIX ENERGY WIRE (nJ)\n";
	for($i=$y*2-2;$i>=0;$i--){
		for($j=0;$j<$x*2-1;$j++){
			if ($matrix_wire[$j][$i]==-1){
			     print "    R    ";
			 }
			else {
				if ($matrix_wire[$j][$i]==-2){
			     print "         ";
				}	
				else{
					printf ("%-8.2f ",$matrix_wire[$j][$i]);
				}
			}

		}
		print "\n";
	}
		print "\n";		

sub read_file{

	open( FILE, "<$_[0]" ) or die("Could not open file $_[0].");
	my @file_lines_aux = <FILE>;
	close(FILE);
	my $size_file = @file_lines_aux;
	
	$x=$file_lines_aux[0];
	$y=$file_lines_aux[1];

	for($i=0;$i<$y;$i++){
		for($j=0;$j<$x;$j++){
			$matrix_cpu[$j][$i]=-1;
			$matrix[$j][$i]=-1;
		}
	}
	
	for($i=0;$i<$y*2-1;$i++){
		for($j=0;$j<$x*2-1;$j+=2){
			$matrix_wire[$j][$i]=-1;
			$matrix_wire[$j+1][$i]=-2;
		}
	}

	$x_aux=0;
	$y_aux=0;

	for($i=2;$i<$x*$y+2;$i++){
	
		@file_split_aux = split(/\s/,$file_lines_aux[$i]);
		
		$numero_pck= $file_split_aux[27];
		$total_flits= $file_split_aux[24];

		@file_split_aux = split(/\s/,$file_lines_aux[$i]);
				
			
		$x_aux=(($i-2)%($x));
		if($x_aux == 0){
			$y_aux=(($i-2)/$y);
		}
		
		#TOTAL DE FLIPS NO ROTEADOR
		
			#$time_ativo	=  $numero_pck*5+$total_flits*$periodo;			
			$time_ativo	=  $total_flits;
			$time_inativo = $time - $time_ativo;
			
			print "$x_aux $y_aux $time_ativo $time_inativo $total_flits $numero_pck \n";
			
		if($x_aux == 0 or $x_aux == ($x-1)){
			if($y_aux == 0 or $y_aux == ($y-1)){
				#$matrix_energy_router_ativo[$x_aux][$y_aux]=($time_ativo*( ($n_Ports_3-1) * $Power_avg_buffer_without_traffic + $Power_avg_buffer_injection_full + $Power_avg_crossbar_injection_full + $Power_avg_control_logic_injection_full)*$periodo)/1000;
				$matrix_energy_router_ativo[$x_aux][$y_aux]=$total_flits;
				
				$matrix_energy_router_inativo[$x_aux][$y_aux]=(($time_inativo)*( ($n_Ports_3) * $Power_avg_buffer_without_traffic_hold + $Power_avg_crossbar_without_traffic_hold + $Power_avg_control_logic_without_traffic_hold)*$periodo)/1000;
			}
			else{
				#$matrix_energy_router_ativo[$x_aux][$y_aux]=($time_ativo*( ($n_Ports_4-1) * $Power_avg_buffer_without_traffic + $Power_avg_buffer_injection_full + $Power_avg_crossbar_injection_full + $Power_avg_control_logic_injection_full)*$periodo)/1000;
				$matrix_energy_router_ativo[$x_aux][$y_aux]=$total_flits;				
				$matrix_energy_router_inativo[$x_aux][$y_aux]=(($time_inativo)*( ($n_Ports_4) * $Power_avg_buffer_without_traffic_hold + $Power_avg_crossbar_without_traffic_hold + $Power_avg_control_logic_without_traffic_hold)*$periodo)/1000;
			}
		}
		else {
			if($y_aux == 0 or $y_aux == ($y-1)){
				#$matrix_energy_router_ativo[$x_aux][$y_aux]=($time_ativo*( ($n_Ports_4-1) * $Power_avg_buffer_without_traffic + $Power_avg_buffer_injection_full + $Power_avg_crossbar_injection_full + $Power_avg_control_logic_injection_full)*$periodo)/1000;
				$matrix_energy_router_ativo[$x_aux][$y_aux]=$total_flits;				
				$matrix_energy_router_inativo[$x_aux][$y_aux]=(($time_inativo)*( ($n_Ports_4) * $Power_avg_buffer_without_traffic_hold + $Power_avg_crossbar_without_traffic_hold + $Power_avg_control_logic_without_traffic_hold)*$periodo)/1000;
			}
			else{
				#$matrix_energy_router_ativo[$x_aux][$y_aux]=($time_ativo*( ($n_Ports_5-1) * $Power_avg_buffer_without_traffic + $Power_avg_buffer_injection_full + $Power_avg_crossbar_injection_full + $Power_avg_control_logic_injection_full)*$periodo)/1000;
				$matrix_energy_router_ativo[$x_aux][$y_aux]=$total_flits;				
				$matrix_energy_router_inativo[$x_aux][$y_aux]=(($time_inativo)*( ($n_Ports_5) * $Power_avg_buffer_without_traffic_hold + $Power_avg_crossbar_without_traffic_hold + $Power_avg_control_logic_without_traffic_hold)*$periodo)/1000;
			}
		}
		
		#$matrix_power_Router[$x_aux][$y_aux]= ($matrix_energy_router_ativo[$x_aux][$y_aux] + $matrix_energy_router_inativo[$x_aux][$y_aux])/($time) ;
		$matrix_power_Router[$x_aux][$y_aux]= 1;
		


		@file_split_cpu = split(/\s/,$file_lines_aux[$i+($x*$y)]);

#print "$file_lines_aux[$i+($x*$y)]\n";
		
		#INSTRUCOES CPU
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[3]*$Energy_Arithmetic+$file_split_cpu[5]*$Energy_Load_Store;
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[7]*$Energy_Logical+$file_split_cpu[9]*$Energy_Move+$file_split_cpu[11]*$Energy_Shift+$matrix_cpu[$x_aux][$y_aux];
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[13]*$Energy_Jump+$file_split_cpu[15]*$Energy_Branch+$matrix_cpu[$x_aux][$y_aux];		
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[17]*$Energy_Nop+$file_split_cpu[19]*$Energy_Mult_Div+$matrix_cpu[$x_aux][$y_aux];
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[21]*$Energy_Other+$matrix_cpu[$x_aux][$y_aux];

		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[23]*$Energy_Arithmetic+$file_split_cpu[25]*$Energy_Load_Store+$matrix_cpu[$x_aux][$y_aux];
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[27]*$Energy_Logical+$file_split_cpu[29]*$Energy_Move+$file_split_cpu[31]*$Energy_Shift+$matrix_cpu[$x_aux][$y_aux];
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[33]*$Energy_Jump+$file_split_cpu[35]*$Energy_Branch+$matrix_cpu[$x_aux][$y_aux];		
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[37]*$Energy_Nop+$file_split_cpu[39]*$Energy_Mult_Div+$matrix_cpu[$x_aux][$y_aux];
		$matrix_cpu[$x_aux][$y_aux]=$file_split_cpu[41]*$Energy_Other+$matrix_cpu[$x_aux][$y_aux];
		
		



		
		#$cycles= $file_split_cpu[3] + $file_split_cpu[5]*1.94 + $file_split_cpu[7] + $file_split_cpu[9] + $file_split_cpu[11] + $file_split_cpu[13];
		#$cycles= $file_split_cpu[15] + $file_split_cpu[17] + $file_split_cpu[19] + $cycles;
		
		$cycles=$file_split_cpu[3]+$file_split_cpu[5]*1.98;
		$cycles=$file_split_cpu[7]+$file_split_cpu[9]+$file_split_cpu[11]+$cycles;
		$cycles=$file_split_cpu[13]+$file_split_cpu[15]+$cycles;		
		$cycles=$file_split_cpu[17]+$file_split_cpu[19]+$cycles;
		$cycles=$file_split_cpu[21]+$cycles;
        
		$cycles=$file_split_cpu[23]+$file_split_cpu[25]*1.98+$cycles;
		$cycles=$file_split_cpu[27]+$file_split_cpu[29]+$file_split_cpu[31]+$cycles;
		$cycles=$file_split_cpu[33]+$file_split_cpu[35]+$cycles;		
		$cycles=$file_split_cpu[37]+$file_split_cpu[39]+$cycles;
		$cycles=$file_split_cpu[41]+$cycles;
		
				
		
		#$cycles= $file_split_cpu[47];
		
		$inst= $file_split_cpu[3] + $file_split_cpu[5] + $file_split_cpu[7] + $file_split_cpu[9] + $file_split_cpu[11] + $file_split_cpu[13];
		$inst= $file_split_cpu[15] + $file_split_cpu[17] + $file_split_cpu[19] + $file_split_cpu[21] + $file_split_cpu[43] + $inst;
		
		$matrix_inst_cpu[$x_aux][$y_aux]=$inst;
		
		#$matrix_Avg_Power_Cpu[$x_aux][$y_aux] = ($matrix_cpu[$x_aux][$y_aux] /( $cycles * $periodo)) ;


		$matrix_energy_Cpu_idle[$x_aux][$y_aux] = ($time - $cycles * $periodo) * 0.246;
		
		print "moraes $time $cycles\n";
		
		#$matrix_Avg_Power_Cpu[$x_aux][$y_aux] = (($matrix_cpu[$x_aux][$y_aux] + $matrix_energy_Cpu_idle[$x_aux][$y_aux]) /$time) ;		
		$matrix_Avg_Power_Cpu[$x_aux][$y_aux] = (($matrix_cpu[$x_aux][$y_aux]) /$time_ativo) ;


		#SOMA DOS FIOS
		$x_aux1=(($i-2)%($x)*2);
		if($x_aux1 == 0){
			$y_aux1=(($i-2)/$y*2);
		}

		
		if($x_aux1-1 >= 0){
			if($matrix_wire[$x_aux1-1][$y_aux1] >= 0){
				$matrix_wire[$x_aux1-1][$y_aux1]=$file_split_aux[9]*$Energy_Wire_Flit*$Ac_Wire_flit+$matrix_wire[$x_aux1-1][$y_aux1];
			}
			else {$matrix_wire[$x_aux1-1][$y_aux1]=$file_split_aux[9]*$Energy_Wire_Flit*$Ac_Wire_flit;}
		}

		if($x_aux1+1 <= $x*2-1){
			if($matrix_wire[$x_aux1+1][$y_aux1] >= 0){
				$matrix_wire[$x_aux1+1][$y_aux1]=$file_split_aux[5]*$Energy_Wire_Flit*$Ac_Wire_flit+$matrix_wire[$x_aux1+1][$y_aux1];
			}
			else {$matrix_wire[$x_aux1+1][$y_aux1]=$file_split_aux[5]*$Energy_Wire_Flit*$Ac_Wire_flit;}

		}

		if($y_aux1-1 >= 0){
			if($matrix_wire[$x_aux1][$y_aux1-1] >= 0){ 
				$matrix_wire[$x_aux1][$y_aux1-1]=$file_split_aux[17]*$Energy_Wire_Flit*$Ac_Wire_flit+$matrix_wire[$x_aux1][$y_aux1-1];
			}
			else {$matrix_wire[$x_aux1][$y_aux1-1]=$file_split_aux[17]*$Energy_Wire_Flit*$Ac_Wire_flit;}
		}

		if($y_aux1+1 <= $y*2-1){
			if($matrix_wire[$x_aux1][$y_aux1+1] >= 0){ 
				$matrix_wire[$x_aux1][$y_aux1+1]=$file_split_aux[13]*$Energy_Wire_Flit*$Ac_Wire_flit+$matrix_wire[$x_aux1][$y_aux1+1];
			}
			else {$matrix_wire[$x_aux1][$y_aux1+1]=$file_split_aux[13]*$Energy_Wire_Flit*$Ac_Wire_flit;}
		}
		
	}
}

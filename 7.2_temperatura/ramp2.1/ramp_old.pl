use POSIX; 

	if ($ARGV[0] ne "") {

		$path_floorplan		= shift; #caminho do floorplan
		$path_temperature	= shift; #caminho da temperatura
		$path_power			= shift; #caminho do power
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}
	
	# DEFINES

	$TOTAL_EM_FITS 		= 1000;
	$TOTAL_SM_FITS 		= 1000;
	$TOTAL_TDDB_FITS	= 1000;
	$TOTAL_TC_FITS 		= 1000;
	$TOTAL_NBTI_FITS 	= 1000;

	$T_base 			= 331; # ARRUMAR #Qualification temperature. At this value, the total processor FIT value will be 4000. By changing this temperature, we can model processors with different reliability qualification costs (Higher implies more expensive)

	$EM_Ea_div_k  		= (0.9/(8.62e-5)); 	#EM activation energy [1]
	
	$SM_Ea_div_k 		= (0.9/(8.62e-5)); 	#/* SM activation energy [1]*/

	$SM_T_base			= 400;		#/* Stress free temperature or metal deposition temperature (assuming sputtering) [1]*/

	$TC_exponent		= 2.35;	#/* Coffin-Manson exponent [1]*/

	$NBTI_beta  		= 0.3;		#/* Beta in NBTI equation [2]*/

	$rel_freq 			= 0.1;

	$ambient_temp		= 318.15;	




	###############################################
	
	# LE O ARQUIVO DE FLOORPLAN E GERA O NUMERO TOTAL DE ESTRUTURAS
	open( FLP_FILE, "<$path_floorplan" ) or die("Could not open file $path_floorplan.");
	@flp_lines_aux = <FLP_FILE>;
	close(FLP_FILE);
	
	$size_flp = @flp_lines_aux;
	$j=0;

	for($i=0;$i<$size_flp;$i++){		
		$flp_lines_aux[$i] =~ s/^#.*//ig;			# substitui multiplos espaços por apenas um						
		$flp_lines_aux[$i] =~ s/\n//ig; 			# tira todas as linhas em branco								
		$flp_lines_aux[$i] =~ s/\s+/ /ig;			# retira "nova linha" 									
		$flp_lines_aux[$i] =~ s/^\s+//ig;			# substitui multiplos espaços por apenas um

		if($flp_lines_aux[$i] ne ''){
			($flp_lines[$j])= $flp_lines_aux[$i];
			@aux = split(/\s/,$flp_lines[$j]);
			
			$name[$j] = $aux[0];
			$width[$j] = $aux[1];
			$height[$j] = $aux[2];
			$j++;
		}
	}
	$size_flp = @flp_lines;
	

	$total_structures =  $size_flp;

	###############################################
	
	# LE O ARQUIVO DE TEMPERATURA
	open( TEMP_FILE, "<$path_temperature" ) or die("Could not open file $path_temperature.");
	@temp_lines_aux = <TEMP_FILE>;
	close(TEMP_FILE);
	
	$size_temp = @temp_lines_aux;

	for($i=1;$i<$size_temp;$i++){
		
		$temp_lines_aux[$i] =~ s/^#.*//ig;			# substitui multiplos espaços por apenas um						
		$temp_lines_aux[$i] =~ s/\n//ig; 			# tira todas as linhas em branco								
		$temp_lines_aux[$i] =~ s/\s+/ /ig;			# retira "nova linha" 									
		$temp_lines_aux[$i] =~ s/^\s+//ig;			# substitui multiplos espaços por apenas um

		@aux = split(/\s/,$temp_lines_aux[$i]);
		
		for($unitc=0; $unitc<$total_structures; $unitc++){
			$temperature[$i-1][$unitc] = $aux[$unitc] + 274.15;
		}
	}
	
	$size_temp--;
	
	###############################################
	
	###############################################
	
	# LE O ARQUIVO DE POWER
	open( POWER_FILE, "<$path_power" ) or die("Could not open file $path_power.");
	@power_lines_aux = <POWER_FILE>;
	close(POWER_FILE);
	
	$size_power = @power_lines_aux;

	for($i=1;$i<$size_power;$i++){	
		
		$power_lines_aux[$i] =~ s/^#.*//ig;			# substitui multiplos espaços por apenas um						
		$power_lines_aux[$i] =~ s/\n//ig; 			# tira todas as linhas em branco								
		$power_lines_aux[$i] =~ s/\s+/ /ig;			# retira "nova linha" 									
		$power_lines_aux[$i] =~ s/^\s+//ig;			# substitui multiplos espaços por apenas um
		
		@aux = split(/\s/,$power_lines_aux[$i]);
		
		for($unitc=0; $unitc<$total_structures; $unitc++){
			$power[$i-1][$unitc] = $aux[$unitc];
		}
	}
	
	$size_power--;
	
	###############################################
	
	# INITIALIZATION - init
	$total_fits 		= 0;	
	$total_struct_area 	= 0;
	$total_inst			= 0;	
	$EM_total			= 0;
	$SM_total			= 0;	
	$TDDB_total			= 0;	
	$TC_total			= 0;	
	$NBTI_total			= 0;	
	
	
	for($unitc=0; $unitc<$total_structures; $unitc++){
		
		$unit_area[$unitc] = $width[$unitc] * $height[$unitc];
		$total_struct_area += $unit_area[$unitc];
		
		$flits[$unitc] 			= 0;
		$ind_inst[$unitc]	 	= 0;
		$access_counter[$unitc] = 0; 
		$mean_temp[$unitc] = 318.15; 
		

	}
	#print "area $total_struct_area\n";
	
	###############################################

	# fitinit
	for($unitc=0; $unitc<$total_structures; $unitc++){
	
		# Base FITS for structure is proportional to the area occupied by the structure on the processor	
		$EM_base_fits[$unitc]	= $TOTAL_EM_FITS*($unit_area[$unitc]/$total_struct_area);
		$SM_base_fits[$unitc]	= $TOTAL_SM_FITS*($unit_area[$unitc]/$total_struct_area);
		$TDDB_base_fits[$unitc]	= $TOTAL_TDDB_FITS*($unit_area[$unitc]/$total_struct_area);
		$TC_base_fits[$unitc]	= $TOTAL_TC_FITS*($unit_area[$unitc]/$total_struct_area);
		$NBTI_base_fits[$unitc]	= $TOTAL_NBTI_FITS*($unit_area[$unitc]/$total_struct_area);
	
		#Initial FIT values are same as base FIT values
		$EM_fits[$unitc]	= $TOTAL_EM_FITS*($unit_area[$unitc]/$total_struct_area);
		$SM_fits[$unitc]	= $TOTAL_SM_FITS*($unit_area[$unitc]/$total_struct_area);
		$TDDB_fits[$unitc]	= $TOTAL_TDDB_FITS*($unit_area[$unitc]/$total_struct_area);
		$TC_fits[$unitc]	= $TOTAL_TC_FITS*($unit_area[$unitc]/$total_struct_area);
		$NBTI_fits[$unitc]	= $TOTAL_NBTI_FITS*($unit_area[$unitc]/$total_struct_area);
	
	}
	
	###############################################

	# runtime

	for($unitc=0; $unitc<$total_structures; $unitc++){		#### ARRUMAR!!!!!!!!!!!!!!!!
		$EM_base_activity[$unitc] = 1; 
	}
	
	
	for($idx_temp=0; $idx_temp < $size_temp; $idx_temp++){
	
		for($unitc=0; $unitc<$total_structures; $unitc++){
			$EM_act_ratio[$unitc] = $power[$idx_temp][$unitc]/$EM_base_activity[$unitc];

		}
	
		for($structures=0; $structures<$total_structures; $structures++){
			
			# Electromigration model
			
			$act_ratio 	= $EM_act_ratio[$structures];													# Activity ratio - between base and current sample
			$temp_diff 	= (1/$T_base) - (1/$temperature[$idx_temp][$structures]); 						# Temperature difference between base and current sample

			$rel_exp 	= $EM_Ea_div_k * $temp_diff; 													# Exponent in MTTF equation for Electron migration

			$fits_ratio = (pow($act_ratio,1.1) * pow(2.718,$rel_exp)/1) * pow((6/6),1.1);


			if ($access_counter[$structures] > 1){
			
				$EM_fits[$structures] =( $EM_fits[$structures] * ($access_counter[$structures]-1) + $fits_ratio * $EM_base_fits[$structures])/$access_counter[$structures];	# update running average of FITS
			
			}
			
			$EM_inst[$structures] = $fits_ratio * $EM_base_fits[$structures];	# Instantaneous values of FITS

	
			# Stress Migration model
			
			$temp_ratio = ($SM_T_base - $temperature[$idx_temp][$structures])/($SM_T_base - $T_base);
			$temp_diff 	= (1/$T_base) - (1/$temperature[$idx_temp][$structures]);
			$rel_exp 	= $SM_Ea_div_k * $temp_diff;
			$fits_ratio = pow($temp_ratio,2.5) * pow(2.718,$rel_exp);

			if ($access_counter[$structures] > 1){
			
				$SM_fits[$structures] =( $SM_fits[$structures] * ($access_counter[$structures]-1) + $fits_ratio * $SM_base_fits[$structures])/$access_counter[$structures];	# update running average of FITS
			
			}

			$SM_inst[$structures] = $fits_ratio * $SM_base_fits[$structures];	
			
			
			# Time-Dependent Dielectric Breakdown model
			
			
			$base_exp = pow(2.718,((0.759/((8.62e-5)*$T_base))-(66.8/((8.62e-5)*pow($T_base,2.0)))-9.7099));
			
			$new_exp = pow(2.718,((0.759/((8.62e-5)*($temperature[$idx_temp][$structures])))-(66.8/((8.62e-5)*pow(($temperature[$idx_temp][$structures]),2)))-9.7099));

			$TBDratio = (pow((((1.1*(pow($rel_freq,0.42206))))/(1.1)),(78 - 0.081*($temperature[$idx_temp][$structures]))))*(2*0.5)*(pow(10.0,((16 - 16 )/2)));  

			$fits_ratio = $TBDratio*($base_exp/$new_exp);
			
			
			if ($access_counter[$structures] > 1){

               	$TDDB_fits[$structures] =( $TDDB_fits[$structures]*($access_counter[$structures]-1) + $fits_ratio*$TDDB_base_fits[$structures])/$access_counter[$structures];
			} 

			$TDDB_inst[$structures] = $fits_ratio*$TDDB_base_fits[$structures];			

			
			# Thermal Cycling model
			
			if ($access_counter[$structures] > 1){
				   	
					$mean_temp[$structures] =($mean_temp[$structures]*($access_counter[$structures]-1) + $temperature[$idx_temp][$structures])/$access_counter[$structures];
			} 
			
			$TC_base_temp_diff = $T_base - $ambient_temp;	


			$TC_fits[$structures] = pow((($mean_temp[$structures]-$ambient_temp)/($TC_base_temp_diff)),$TC_exponent)*$TC_base_fits[$structures];

			$TC_inst[$structures] = $TC_fits[$structures];
			
			# Negative Bias Temperature Instability model

			
			$temp_ratio = $T_base/$temperature[$idx_temp][$structures];
			$temp_diff = (1.0/$T_base) - (1.0/$temperature[$idx_temp][$structures]);
			$rel_exp = 795.2*$temp_diff;

			$NBTI_basemttf = pow(((log(1.6368/(1.0+2.0*pow(2.7182818,(856.1067/$T_base)))) - log((1.6368/(1.0+2.0*pow(2.7182818,(856.1067/$T_base))))-0.01))*($T_base/(pow(2.7182818,(-795.2/$T_base))))),(1.0/$NBTI_beta));
			
			$NBTI_currentmttf = pow(((log(1.6368/(1.0+2.0*pow(2.7182818,(856.1067/$temperature[$idx_temp][$structures])))) - log((1.6368/(1.0+2.0*pow(2.7182818,(856.1067/$temperature[$idx_temp][$structures]))))-0.01))*($temperature[$idx_temp][$structures]/(pow(2.7182818,(-795.2/$temperature[$idx_temp][$structures]))))),(1.0/$NBTI_beta));

			$fits_ratio=$NBTI_basemttf/$NBTI_currentmttf;

			if ($access_counter[$structures] > 1){
				
                $NBTI_fits[$structures] =( $NBTI_fits[$structures]*($access_counter[$structures]-1) + $fits_ratio*$NBTI_base_fits[$structures])/$access_counter[$structures];
                
			}
			
			$NBTI_inst[$structures] = $fits_ratio*$NBTI_base_fits[$structures];
	
	
	
				
			##################################
			
			$fits[$structures] = $EM_fits[$structures] + $SM_fits[$structures] + $TDDB_fits[$structures] + $TC_fits[$structures] + $NBTI_fits[$structures];
			$ind_inst[$structures] = $EM_inst[$structures] + $SM_inst[$structures] + $TDDB_inst[$structures] + $TC_inst[$structures] + $NBTI_inst[$structures];
			$access_counter[$structures]++;	#Counter to manintain runnign average of FITS
			
			
			$total_fits 	= $total_fits + $fits[$structures];				# Computes Total average FIT value of processor
			$total_inst 	= $total_inst + $ind_inst[$structures];  		# Computes Total instantaneous FIT value of processor
			$EM_total 		= $EM_total + $EM_fits[$structures]; 			# Total average individual failure mech FIT value
			$SM_total 		= $SM_total + $SM_fits[$structures];
			$TDDB_total 	= $TDDB_total + $TDDB_fits[$structures];
			$TC_total 		= $TC_total + $TC_fits[$structures];
			$NBTI_total 	= $NBTI_total + $NBTI_fits[$structures];
			
		}
	}
	
		for($structures=0; $structures<$total_structures; $structures++){
		

			printf("%f\n",$EM_fits[$structures]);
			printf("%f\n",$SM_fits[$structures]);
			printf("%f\n",$TDDB_fits[$structures]);
			printf("%f\n",$TC_fits[$structures]);
			printf("%f\n",$NBTI_fits[$structures]);

		}
			
	
	#printf("Total Processor FIT value over entire application %f \n", $total_fits);
	
printf("Total Processor FIT value over entire application %f \n", $total_fits);
printf("Total Processor EM FIT value over entire application %f \n", $EM_total);
printf("Total Processor SM FIT value over entire application %f \n", $SM_total);
printf("Total Processor TDDB FIT value over entire application %f \n", $TDDB_total);
printf("Total Processor TC FIT value over entire application %f \n", $TC_total);
printf("Total Processor NBTI FIT value over entire application %f \n", $NBTI_total);	
	


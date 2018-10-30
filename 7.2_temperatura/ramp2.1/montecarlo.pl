use POSIX; 
use List::Util qw[min max];
use Config;
use constant RANDBITS => $Config{randbits};
#use constant RAND_MAX => 2**RANDBITS;

	if ($ARGV[0] ne "") {
		$path_fits			= shift; #caminho do fits
		$totalruns			= shift; #caminho do fits
		$structure_count	= shift;
	}

	else {
	  print "ERRO, falta de argumento\n";
	  exit;
	}
	
	# DEFINES

	$mttftotal = 0;
	$totallife=0;

	###############################################
	
	# LE O ARQUIVO DE FITS
	open( FITS_FILE, "<$path_fits" ) or die("Could not open file $path_fits.");
	@fits_lines_aux = <FITS_FILE>;
	close(FITS_FILE);
	
	$size_fits = @fits_lines_aux;
	for ($fail_count=0;$fail_count<5;$fail_count++){
		for ($x=0;$x<$structure_count;$x++){
				$fits_lines_aux[($structure_count*$fail_count)+$x] =~ s/\s+/ /ig;			# retira "nova linha" 									
                $fits[$fail_count][$x]=$fits_lines_aux[($structure_count*$fail_count)+$x];
		}
	}


	###############################################

#* The MTTF value of each structure due to each failure mechanism depends on its
#* FIT value. 1 FIT represents one failure in 10E9 operating hours. Therefore, a
#* FIT value of 3805.17503 gives an MTTF of 30 years. */
 
	for ($x=0;$x<$structure_count;$x++){
		for ($fail_count=0;$fail_count<5;$fail_count++){
			$expected_mttf[$fail_count][$x]=(10*11415.5251)/$fits[$fail_count][$x];
		}
	}



#/* Generating lognormal correction factor. This is used to normalize the MTTF of
# * the lognormal distribution.*/

	for ($runs =0; $runs < $totalruns; $runs++){
		$randomval = rand();


		if ((-1.52245 - log($randomval/4.58344)) < 0.0){
			$lifetime_lognorm = 0.0;
		}
		else{
			$lifetime_lognorm = pow(2.7182818,(-0.5 + sqrt(-1.52245 - log($randomval/4.58344)))) - pow(2.7182818,(-0.5));
			
			if ($runs ==0){
				$mttf_lognorm = $lifetime_lognorm;
			}

			if ($runs > 0){
				$mttf_lognorm = (($mttf_lognorm/($runs+1))*$runs)+(($lifetime_lognorm)/($runs+1));
			}	
		}
		
	}

	$lognorm_correc = 1.0/$mttf_lognorm; 


#/* Based on the  MTTF of each structure due to each failure mecahnism, a lambda
# * in the lognormal equation is generated for each structure and failure
# * mechanism. */

	for ($x=0;$x<$structure_count;$x++){
		for ($fail_count=0;$fail_count<5;$fail_count++){
			$lognorm_lambda[$fail_count][$x]=$expected_mttf[$fail_count][$x]/$mttf_lognorm;
		}
	}


#/* This is the main Monte-Carlo simulation loop.*/

	for ($runs =0; $runs < $totalruns; $runs++){
	
		#/* Random lifetimes are generated for each structure and failure mechanism based
		#* on the structure and failure mechanism's MTTF. */

		for ($x=0;$x<$structure_count;$x++){
			for ($fail_count=0;$fail_count<5;$fail_count++){
				$randomval = rand();
				
				if ((-1.52245 - log($randomval/4.58344)) < 0.0){
					$lognorm_lifetime[$fail_count][$x] = 0.0;
				}
				else{
					$lognorm_lifetime[$fail_count][$x] = $lognorm_lambda[$fail_count][$x]*(pow(2.7182818,(-0.5 + pow((-1.52245 - log($randomval/4.58344)),0.5))) - pow(2.7182818,(-0.5)))/0.92986;
				}
				
			}
		}
		
		#/* In order to calculate lifetime for a series-parallel failure system, we use
		#* the MIN-MAX method. Simply put, the lifetime of two structures in series is
		#* the minimum of the lifetime of the individual structures. Similarly, the
		#* lifetime of two structures in parallel is the maximum of the lifetime of the
		#* individual structures. */

		#/* Within each structure, the individual failure mechanisms act like a series
		#* failure system. That is, the first failure due to any mechanism will cause
		#* the entire structure to fail. 	structure_lifetime gives the lifetime of the
		#* structure due to all mechanisms.*/
		
		for ($x=0;$x<$structure_count;$x++){
	
			$structure_lifetime[$x]=min(min(min(min($lognorm_lifetime[0][$x],$lognorm_lifetime[1][$x]),$lognorm_lifetime[2][$x]),$lognorm_lifetime[3][$x]),$lognorm_lifetime[4][$x]);

		}
		
		
		#$temp0=max($structure_lifetime[0],$structure_lifetime[1]); 
		#$temp1=max($structure_lifetime[2],$structure_lifetime[3]); 
		#$temp2=min($structure_lifetime[4],$structure_lifetime[5]); 
		#$temp3=min($structure_lifetime[6],$structure_lifetime[7]);
		#$temp4=min($structure_lifetime[8],$structure_lifetime[9]);


		#$temp5=min($temp0,$temp1);
		#$temp6=min($temp2,$temp3);
		#$temp7=min($temp5,$temp6);

		#$totallife=min($temp4,$temp7);
				
		$totallife=$structure_lifetime[0];
		for ($x=1;$x<$structure_count;$x++){
	
			if($structure_lifetime[$x] < $totallife){
				$totallife = $structure_lifetime[$x];
			}
			
		}
		
		
		$mttftotal+=$totallife;			

	}

$finalmttf=$mttftotal/$totalruns; #/* The average across all iterations of the Monte-Carlo algorithm give the final MTTF of the processor. */ 


print "$finalmttf\n";













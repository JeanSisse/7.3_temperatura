	if ($ARGV[0] ne "") {

		$path = shift;
		
	}

	else {
	  print "ERROR\n";
	  exit;
	}



	
read_file("$path/power_global.txt");



sub read_file{

	open( FILE, "<$_[0]" ) or die("Could not open file $_[0].");
	my @file_lines_aux = <FILE>;
	close(FILE);
	my $size_file = @file_lines_aux;
	
    use POSIX;
	$aux=ceil($size_file/10);
	$count=0;
	mkdir("$path/ost");
	for($i=0;$i<=$aux;$i++){
		print "$i\n";
		open( C_FILE2, ">>$path/ost/$count.txt" );
		print  C_FILE2 "p0\tp1\tp2\tp3\tp4\tp5\tp6\tp7\tp8\tp9\tp10\tp11\tp12\tp13\tp14\tp15\tp16\tp17\tp18\tp19\tp20\tp21\tp22\tp23\tp24\tp25\tp26\tp27\tp28\tp29\tp30\tp31\tp32\tp33\tp34\tp35\n";
		close( C_FILE2);
		for($j=0;$j<10*($i+1);$j++){

			open( C_FILE2, ">>$path/ost/$count.txt" );
			print C_FILE2 "$file_lines_aux[$j]";
			close( C_FILE2);
		}
		system("cd $path/ost;cp ../h* .; cp ../g* .");
		system("cd $path/ost;./hotspot -c hotspot.config -f hemps.flp -p $count.txt -model_type grid -grid_steady_file grid_$count -o hot_sem_temperatura_$count.txt\n");
		system("cd $path/ost;./grid_thermal_map.pl hemps.flp grid_$count 32 32 > hot_sem_$count.svg");
		system("cd $path/ost; convert -font Helvetica svg:hot_sem_$count.svg hot_sem_$count.pdf");
		$count++;
	}
		#system("cd $path/ost;rm -rf hemps.flp grid_thermal_map.pl hotspot hotspot.config");

}

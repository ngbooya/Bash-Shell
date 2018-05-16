#! /usr/bin/perl 
use strict;
use warnings;
# Filename must be in the first parameter
my $fileName = $ARGV[0];

my $index = scalar(@ARGV);

my @array = ();
open(my $fileHandle, '<', $fileName) or die "could not open file '$fileName' $!\n";


chomp(@array = <$fileHandle>);

close $fileHandle;

	my @filteredArray = ();
	my $mainIndex = scalar(@array);
	

	# Marks the portion that doesn't need to be sorted
	my $fileSysFlag = 0;
	my $fileBeginSort = 0;

for(my $temp = 0; $temp < $mainIndex; $temp++){
	if($array[$temp] =~ "Filesystem"){
		$fileSysFlag = $temp;
		$fileBeginSort = $fileSysFlag + 1;
	}

}



for(my $j = 1; $j < $index; $j++){

	for(my $i = 0; $i < $mainIndex; $i++){
		if($array[$i] =~ m/[^0-9]$ARGV[$j]/g){
			splice @array, $i, 1;
			$i--;
			$mainIndex--;			
		}
		if($array[$i] =~ /18 entries were displayed./){
                        splice @array, $i, 1;
                        $i--;
                        $mainIndex--;
                }

		#if($array[$i] =~ "Filesystem"){
		#	$fileSysFlag = $i;
		#	$fileBeginSort = $fileSysFlag + 1;
		#}		
	}
		
}

push(@filteredArray, @array);

sub makeNum($){

	# shift passes argument to $num
	my $num = shift; 
	#return(($num =~ /(\d+)/)[0] || 0);
	return($num =~ /(\d+)/)[0];

}

my @sorted = sort{makeNum(($b =~ /(\d+%)/)[0] || 0) <=> makeNum( ($a =~ /(\d+%)/)[0] || 0)} 

# Pass in the capacity with then '%' sign; makeNum function will return the value without the '%' back into into sort; sort function will then sort the numbers.


#@filteredArray[7..$#filteredArray];
#my @mainArray = @filteredArray[0..6];

@filteredArray[$fileBeginSort..$#filteredArray];
my @mainArray = @filteredArray[0..$fileSysFlag];

push(@mainArray, @sorted);

my $counter2 = 0;
	foreach(@mainArray){$_ =~ s/\s+/,/g;}
	foreach(@mainArray){$_ =~ s/snap,reserve/snap reserve/g;}
	foreach(@mainArray){$_ =~ s/Mounted,on/Mounted on/g;} 	
	foreach(@mainArray){
		print "$mainArray[$counter2]\n";
		$counter2 = $counter2 + 1;
	}
my $writeHandle;
open($writeHandle, '>', 'usageOutput.csv' ) or die "could not write file 'test.csv' $!\n";
my $writeIndex = 0;
foreach(@mainArray){
	print $writeHandle "$mainArray[$writeIndex]\n";
	$writeIndex++;
}
close $writeHandle;

#Kevin Nguyen
# CWID: 891915134
########### RANDOM NUMBER GENERATOR WITH NAME LIST OPTION###################
#! /usr/bin/perl

use strict;
use warnings;

my $rand_num = 0;


############################ DEFAULT 32 STUDENTS ###########################
if(!defined($ARGV[0])){ #Assign value if not initialized
	$ARGV[0] = 32;
	$rand_num = int(rand($ARGV[0])) + 1;



	if(-e 'number_log.txt'){#Check if number_log.txt exist
		open(my $openHandle, '<', 'number_log.txt') or die "could not read file 'number_log.txt' $!\n"; 
			my @array32 = <$openHandle>;
			my $indexHold = scalar(@array32);
			if($indexHold == 32){
				print "#######################\n";
				print "# ALL NUMBERS CALLED! #\n";
				print "#######################\n";
				exit;
			}
	
			for(my $i = 0; $i < $indexHold; $i++){ #Check for repetitions of numbers
				while($rand_num == $array32[$i]){ # If random number matches a number in log file; Generate new number
					$rand_num = int(rand($ARGV[0]))+1;
					$i = -1; # Move index of the log file to the top line to continue to search
				}
			}
		close($openHandle);
	}

	print "$rand_num\n";	
	open(my $writeHandle, '>>', 'number_log.txt') or die "could not write file 'number_log.txt' $!\n";
		print $writeHandle "$rand_num\n";
	close($writeHandle);
	$ARGV[0] = undef;
	exit; 			
}
############################################################################
####################### PASS IN NAME FILE #######################################
if($ARGV[0] =~ /testnames.txt/){

	open(my $nameHandle, '<', 'testnames.txt') or die "could not read file 'testnames.txt' $!\n";
		my @nameArray = <$nameHandle>;
		my $nameIndex = scalar(@nameArray);
	close($nameHandle);
		my $rand_name = int(rand($nameIndex));
		my $rand_assign = int(rand($nameIndex)) + 1;

		
	if(-e 'names_log.txt'){ # CHECK FOR REPEITION
		open(my $nameCheck , '<', 'names_log.txt') or die "could not read file 'testnames.txt' $!\n";
		my @checkArray = <$nameCheck>;
		my $checkIndex = scalar(@checkArray);
		
		if($checkIndex/3 == $nameIndex){
			print "####################\n";
			print "# ALL NAMES CALLED #\n";
			print "####################\n";
			exit;
		}
		
		
		for(my $c = 1; $c < $checkIndex; $c+=3){
			while($nameArray[$rand_name] eq $checkArray[$c]){
				
				$rand_name = int(rand($nameIndex));
				$c = -2;					
			}
		}
		for(my $rand = 0; $rand < $checkIndex; $rand+=3){
			while($rand_assign == $checkArray[$rand]){
				$rand_assign = int(rand($nameIndex)) + 1;
				$rand = -3;
			}
		}	
		close($nameCheck);					
	}
	
	my $date = localtime();
	
################## CREATE LOG FILE FOR NAMES ###################################
		print "$rand_assign $nameArray[$rand_name]";
		open(my $logName, '>>', 'names_log.txt') or die "could not write file 'names_log.txt' $!\n";
			print $logName "$rand_assign\n$nameArray[$rand_name] $date\n";					
		close($logName);

}
##################################################################################
########################## PASS IN NUMBER AS ARGUMENT #############################
if($ARGV[0] =~ /[0-9]+/){
	$rand_num = int(rand($ARGV[0])) + 1;
	if(-e 'number_log.txt'){
		open(my $openHandle2, '<', 'number_log.txt') or die "could not read file 'number_log.txt' $!\n";
		my @arrayD = <$openHandle2>;
		my $indexD = scalar(@arrayD);
		if($indexD == $ARGV[0]){
			print "#######################\n";
			print "# ALL NUMBERS CALLED! #\n";	
			print "#######################\n";
			exit;
		}
		for(my $j = 0; $j < $indexD; $j++ ){ #CHECK FOR REPITITION
			while($rand_num == $arrayD[$j]){
				$rand_num = int(rand($ARGV[0])) + 1;
				$j = -1;
			}
		}
		close($openHandle2);
	
	}
	print "$rand_num\n";
	open(my $writeHandle2, '>>', 'number_log.txt') or die "could not write file 'number_log.txt' $!\n";
		print $writeHandle2 "$rand_num\n";
	close ($writeHandle2);	
}else{

	print "###INVALID PARAMETER###\n";
}
##############################################################################



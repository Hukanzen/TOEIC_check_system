#!/usr/bin/env perl
use strict;

my @ans_file=("Answer_1.txt","Answer_2.txt");
my @test_file=("test_1.txt","test_2.txt");

my @ans_0=&import_file($ans_file[0]);
my @ans_1=&import_file($ans_file[1]);
my @test_0=&import_file($test_file[0]);
my @test_1=&import_file($test_file[1]);

my $mon_num_0=&kaigyo($ans_0[0]);
my $mon_num_1=&kaigyo($ans_1[0]);

my $result_0=&scoring(\@ans_0,\@test_0);
my $result_1=&scoring(\@ans_1,\@test_1);

print "LISTENINGは問題数:".$mon_num_0."  "."正答数:".$result_0,"です。\n";
print "READINGは問題数:".$mon_num_1."  "."正答数:".$result_1,"です。\n";

sub import_file{
	my ($file)=shift;

	open(IN,$file) or die("error :$!");
	my @data=<IN>;

	close(IN);

	return @data;
}

sub kaigyo{
	my $string=shift;
	$string=~s/\n$//;

	return $string;
}


sub scoring{
	my($ans,$test)=@_;
	my $point=-1;
	
	my $i=0;
	foreach(@$ans){
		print "checking ".&kaigyo($_)."\n";
		if($i==0){
			$point=0;
			$i=-1;
			next;
		}

		my $an_ans=&kaigyo($_);
		
		my $j=0;
		foreach(@$test){
			if($j==0){
				$j=-1;
				next;
			}
			
			if($an_ans eq &kaigyo($_)){
				$point++;
			}
		}

	}

	return $point;
} 


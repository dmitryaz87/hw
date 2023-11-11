#!/usr/bin/perl
use strict;

#Поиск в упорядоченном массиве данных
print "Поиск числа в упорядоченном массиве. Вызовите снова скрипт и через пробел укажите искомое значение.\nМассив:\n";

my @unsorted = ( qw/ 1 2 3 4 4 5 5 6 7 / );

foreach my $i (@unsorted){
	print $i;
}

my $len = @unsorted;

my $k;

#искомое значение вводим с клавиатуры
my $key = shift;
	
my $left = 0;
my $right = $len - 1;
print "\nWe search key= $key\n";


while($left <= $right) {
	my $middle = int(($left + $right) / 2);
	if ($unsorted[$middle] == $key){
			print("Match\n");
			exit 1;
		} elsif ($unsorted[$middle] > $key){
			$right = $right - 1;
		} else {
			$left  = $left + 1;
		}
	
};
print ("\nNot match\n");
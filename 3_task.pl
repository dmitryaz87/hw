#!/usr/bin/perl
use strict;

my $datatime = "2016-04-11 20:59:03";

if ($datatime =~ /(\d\d\d\d)-(\d\d)-(\d\d)\s(\d\d):(\d\d):(\d\d)/) {   
    my $date = "$1-$2-$3";
    my $time = "$4:$5:$6";

	print $date."\n";
	print $time."\n";
}


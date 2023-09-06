#!/usr/local/perl
use Animal;
use Cat;
use strict;

my $myAnimal = Animal -> new();
$myAnimal -> name ('Charly');
$myAnimal -> kind ('Dog');
$myAnimal -> age (2);

$myAnimal -> showObject();
$myAnimal -> infoObject();

print "\nДалее дочерний класс\n";
my $myCat = Cat -> new();
$myCat -> name ('Pushistic');
$myCat -> kind ('Cat');
$myCat -> age (1);
$myCat -> species ('Cheshirsky');

$myCat -> showObject();
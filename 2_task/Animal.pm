#!/usr/local/perl
package Animal;
use strict;

sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = {};
    $self -> {NAME} = undef;
    $self -> {KIND} = undef; #dog, cat, bird, elefant, tiger
    $self -> {AGE} = undef;
    $self -> {SPEED} = undef;
    bless ($self, $class);
    return $self;
    
}

sub name {
    my $self = shift;
    if (@_){$self -> {NAME} = shift}
    return $self -> {NAME};
}

sub kind {
    my $self = shift;
    if (@_){$self -> {KIND} = shift}
    return $self -> {KIND};
}

sub age {
    my $self = shift;
    if (@_){$self -> {AGE} = shift}
    return $self -> {AGE};
}

sub showObject{
    my $self = shift;
    printf "Call of Parent Class. My Animal is name %s, kind of  %s, age  %d \n", $self -> name, $self -> kind, $self -> age;
    
}

sub infoObject{
    my $self = shift;
    my $val = $self -> kind;
    print "Кратко о вашем животном:\n";
    if ($val eq "Cat") {
        print "С точки зрения научной систематики, домашняя кошка — млекопитающее семейства кошачьих отряда хищных. Одни исследователи рассматривают домашнюю кошку как подвид дикой кошки, другие — как отдельный биологический вид.\n";
        } elsif ($val eq "Dog"){
            print "Собака (лат. Canis familiaris, или Canis lupus familiaris) — домашнее животное, одно из наиболее популярных (наряду с кошкой) животных-компаньонов\n";
        } else{
            printf "Вы уверены что %s- домашнее животное?\n", $self -> kind;
        }
    #switch ($val) {
    #    case ("dog") { 
    #    print "Собака (лат. Canis familiaris, или Canis lupus familiaris) — домашнее животное, одно из наиболее популярных (наряду с кошкой) животных-компаньонов\n";
    #    };
    #    case ("cat") { 
    #    print " домашнее животное, одно из наиболее популярных (наряду с собакой) животных-компаньонов \n";
    #    }
    #}
   
}
    
1;


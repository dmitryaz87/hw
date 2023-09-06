#!/usr/local/perl
package Cat;
use base Animal;
use strict;


sub species{
    my $self = shift;
    if(@_){
        $self->{SPECIES} = shift;
    }
    return $self->{SPECIES};
}

sub showObject{
    my $self = shift;
    
    printf "Hello, I am a %s and I am %s\n", $self -> kind, $self -> species;
    print "Сработало перекрытие\n";
    $self->SUPER::showObject;
}

1;
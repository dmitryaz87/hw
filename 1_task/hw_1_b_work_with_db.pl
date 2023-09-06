#!/usr/bin/perl
use strict;
use Switch;
use DBI;

my $option = shift;

my $dsn = "DBI:mysql:u2224759_default:localhost";
my $mysqluser = "u2224759_default";
my $pass = "7DOS14SZp3u9pwxw";


my $dbh  = DBI->connect($dsn,$mysqluser,$pass) or
die("Ошибка подключения к базе данных: $DBI::errstr\n");



print (qq/ Замечательная телефонная книжка 

all - показать все контакты
insert - создать (insert) контакт
delete - удалить (delete) контакт
update - изменить (update) контакт\n\n/); 


switch ($option) {
	case "all"	{ 
	    
	    print "Вы выбрали опцию показать все контакты, опция $option\n";
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
        $sth->finish();
	    
	}
	case "insert"	{ 
	    print "Вы выбрали опцию создать контакт, опция $option\n";
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
        
	    print "Укажите контакт, который нужно добавить в порядке id <Enter>, name <Enter>, number_phone <Enter>:\n";
	    chomp (my $id = <STDIN>);
	    chomp (my $name = <STDIN>);
	    chomp (my $number_phone = <STDIN>);
	    #print $id;
	    my $sql = "INSERT INTO people_contacts (`id`, `name`, `number`) VALUES (?,?,?)";
	    my $sth = $dbh->prepare($sql);
	    $sth->execute($id, $name, $number_phone) or die $DBI::errstr;
	    
	    print "\nСейчас БД содержит следующие значения:\n"; 
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
	    
	    $sth->finish();
	    
	}
	case "delete"	{ 
	    print "Вы выбрали опцию удалить контакт, опция $option\n"; 
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
        
	    print "Укажите id контакта, который нужно удалить\n";
	    chomp (my $id = <STDIN>);
	    #print $id;
	    my $sql = "DELETE FROM people_contacts WHERE id = ?";
	    my $sth = $dbh->prepare($sql);
	    $sth->execute($id) or die $DBI::errstr;
	    
	    print "\nСейчас БД содержит следующие значения:\n"; 
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
	    
	    $sth->finish();
	}
	case "update"	{ 
	    print "Вы выбрали опцию изменить контакт, опция $option\n";
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
        
	    print "Укажите id контакта, который нужно изменить\n";
	    chomp (my $id = <STDIN>);
	    print "Укажите новое имя контакта <ENTER>, новый номер <ENTER>:\n";
	    chomp (my $name = <STDIN>);
	    chomp (my $number_phone = <STDIN>);
	    my $sql = "UPDATE people_contacts SET name = ?, number = ? WHERE id = ?";
	    my $sth = $dbh->prepare($sql);
	    $sth->execute($name, $number_phone, $id) or die $DBI::errstr;
	    
	    print "\nСейчас БД содержит следующие значения:\n"; 
	    my $sql = 'SELECT * FROM people_contacts';
	    my $sth = $dbh->prepare($sql);
	    $sth->execute();
	    while(my @row = $sth->fetchrow_array()){
            printf("%s\t%s\t%s\n",$row[0],$row[1], $row[2]);
            }
	    
	    $sth->finish();
    }
}

print ("\n");

$dbh->disconnect();
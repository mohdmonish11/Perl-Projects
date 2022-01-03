#!/usr/bin/perl use 5.010;
use Moose;
use Data::Dumper;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task4";  #where the module is saved

use Playlist;

my $object = new Playlist();

while(1){
    # my $object =new Playlist();
    print"Press 1 create new playlist\nPress 2 to delete playlist\n";
    print"Press 3 add songs into the database\nPress 4 add songs to the playlist\n";
    print"Press 5 Delete songs to the playlist\nPress 6 fetch the playlist\n";
    print"Press 7 shuffle the Playlist\nPress 0 to exit\nChoose Wisely:";
    my $input=<STDIN>;
    if ($input == 1){
        passDataTocreatePlaylist();               
    }
    elsif($input == 2){
        PassDataTodeletePlaylist();
    }
    elsif($input == 3){
        PassDataToaddSongsToDatabase();
    }
    elsif($input == 4){
        PassDataToaddSongPlaylist();   
    }
    elsif($input == 5){
        PassDatatodeleteSongPlayList();
    }   
    elsif($input == 6){
        printFetchPlaylist();
    }
    elsif($input == 7){
        passDataToshufflePlaylist();
    }
    last if ($input == 0);
}

sub passDataTocreatePlaylist {
    print"Please Enter the name of Playlist: ";
    chomp(my $playlist_name = <STDIN>);
    print "Please Enter the name of user: ";
    chomp(my $created_by = <STDIN>);
    my $id = $object->createPlaylist($playlist_name, $created_by);
    print $id, "\n";
}

sub PassDataTodeletePlaylist {
    my $row = $object->selectAllItemsFromPlaylistNames();
    print Dumper $row;
    print"Enter the name to Delete the value from playlist: ";
    chomp(my $delete_input =<STDIN>);
    my $msg = $object->deletePlaylist($delete_input);
    print $msg,"\n";
}

sub PassDataToaddSongsToDatabase {
    while(1){
        print"Press 1 to entry and 0 for exit: ";
        my $user=<STDIN>;
        if ($user == 1){
            print"Enter the Song Name: ";
            chomp(my $song_name=<STDIN>);  
            print "Enter the Singer Name: ";
            chomp(my $singer_name =<STDIN>);
            my $id = $object->addSongsToDatabase($song_name, $singer_name);
            print "$id\n";
        }
        last if ($user == 0);
    }
    $object->{insert_query}->finish() if($object->{insert_query});
}

sub PassDataToaddSongPlaylist {
    print"List of Songs You have\n";
    my $row_song = $object->fetchAllSongsFromSongTable();
    print Dumper $row_song;
    print "List of Playlist Name you have\n";
    my $row_playlist = $object->selectAllItemsFromPlaylistNames();
    print Dumper $row_playlist;

    print"Enter the Playlist name for whom you wanna add songs: ";
    chomp(my $playlist_name = <STDIN>);
    print "Enter Serial Number of Song to add into Playlist: ";
    chomp(my $sno = <STDIN>);
    my $msg =$object->addSongPlaylist($playlist_name,$sno);
    print $msg,"\n";
}

sub PassDatatodeleteSongPlayList {
    print"Songs with appropriate Play List Name: \n";
    $object->fetchAllPlayListSongs();
    print"Enter the Play List Name from where you wanna delete the songs: ";
    chomp(my $playlist_name = <STDIN>);
    print"Enter the Song_Name You Wanna delete: ";
    chomp (my $song_name = <STDIN>);
    my $msg = $object->deleteSongPlayList($playlist_name, $song_name);
    print $msg, "\n";
}

sub printFetchPlaylist {
    my $row = $object-> fetchPlaylist();
    print Dumper $row;
    my %row= %$row;     #dererencing an hash
    print "Playlist Names:\n";
    for my $keys(keys %row){
        for my $subkeys(keys %{$row{$keys}}){
            print "\t\t",$row{$keys}{$subkeys},"\n";
        }
    }
}

sub passDataToshufflePlaylist {
    my $row_playlist = $object->selectAllItemsFromPlaylistNames();
    print Dumper $row_playlist;
    print"Enter the Playlist Name you Wanna Shuffle: ";
    chomp(my $input_playlist_name = <STDIN>);
    my $shuffled_data = $object->shufflePlaylist($input_playlist_name);
    print Dumper $shuffled_data;
}



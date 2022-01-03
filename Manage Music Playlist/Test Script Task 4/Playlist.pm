#!/usr/bin/perl use 5.010;

package Playlist;
use DBI;
use Moose;
use Data::Dumper;
use List::Util qw/shuffle/;

sub new{
    my $class = shift;
    my $connection = DBI->connect('DBI:mysql:musicplayer:localhost','root','') or die $DBI::errstr;
    my $self = {
        connection => $connection,
        insert_query => undef,
        select_query => undef, 
        update_query => undef,
        delete_query => undef,
    };
    return bless $self, $class;
}

sub selectAllItemsFromPlaylistNames{
    my $object = shift;
    my $select_statement = "SELECT * from play_list_names";
    $object->{select_query} = $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $row = $object->{select_query}->fetchall_hashref('Name_P');
    return $row;
}

sub createPlaylist{
    my $object = shift;
    my $insert_statement = "INSERT INTO play_list_names (Name_p, Created_by)Values(?,?)";
    my ($playlist_name, $created_by) = @_;
    my $row = $object->selectAllItemsFromPlaylistNames();
    if (exists($row->{$playlist_name})){
        print "Name Already Exist Try Another Name ";
    }
    else{
        if(!$object->{insert_query}){
            $object->{insert_query} = $object->{connection}->prepare($insert_statement);
        }
        $object->{insert_query}->execute($playlist_name, $created_by) or die $DBI::errstr;
        my $id = $object->{insert_query}->{mysql_insertid};
        $object->{insert_query}->finish() if($object->{insert_query});
        return $id;
    }
}


sub deletePlaylist{
    my $object= shift;
    my $delete_input= $_[0];
    my $delete_statement = "DELETE FROM play_list_names WHERE Name_P = ? LIMIT 1";
    my $delete_statement_for_song_table = "DELETE FROM play_list_songs WHERE Playlist_Name =?";
    my $row = $object->selectAllItemsFromPlaylistNames();
    if (exists($row->{$delete_input})){
        $object->{delete_query} =$object->{connection}->prepare($delete_statement);
        $object->{delete_query}->execute($delete_input) or die $DBI::errstr;
        $object->{delete_query} = $object->{connection}->prepare($delete_statement_for_song_table);
        $object->{delete_query}->execute($delete_input) or die $DBI::errstr;
        $object->{delete_query}->finish();
        return "Playlist Name is Deleted\n";
    }
    else{
        return "The Playlist Name is Invalid\n ";
    }
}


sub addSongsToDatabase{
    my $object = shift;
    my ($song_name, $singer_name) = @_;
    my $insert_statement = "INSERT INTO song(Song_Name, Singer_Name)Values(?,?)";
    if(!$object->{insert_query}){
        $object->{insert_query} = $object->{connection}->prepare($insert_statement);
    }
    $object->{insert_query}->execute($song_name, $singer_name) or die $DBI::errstr;
    my $id = $object->{insert_query}->{mysql_insertid};
    return $id;
}

sub fetchAllSongsFromSongTable{
    my $object= shift;
    my $select_song_statement ="SELECT * from song";
    $object->{select_query} = $object->{connection}->prepare($select_song_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $row = $object->{select_query}->fetchall_hashref('Sno');
    return $row;
}

sub addSongPlaylist{
    my $object= shift;
    my ($playlist_name, $sno)= @_;
    my $insert_statement = "INSERT INTO play_list_songs(Playlist_Name, SongName ,SingerName)Values(?,?,?)";
    my $playlistNameRow = $object->selectAllItemsFromPlaylistNames();
    my $row = $object->fetchAllSongsFromSongTable();

    if (exists($playlistNameRow->{$playlist_name})){        #Validating the inputs
        $object->{insert_query} = $object->{connection}->prepare($insert_statement);
        $object->{insert_query}->execute($playlist_name,$row->{$sno}{'Song_Name'},$row->{$sno}{'Singer_Name'}) or die $DBI::errstr;
        # print"Song Inserted to Appropriate Playlist\n";
        $object->{insert_query}->finish();
        my $id = $object->{insert_query}->{mysql_insertid};
        return $id;
    }
    else{
        return "Invalid Playlist Name and song Entered \n ";
    }
}

sub fetchAllPlayListSongs{
    my $object= shift;
    my $select_statement = "SELECT * from play_list_songs";
    $object->{select_query} =$object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    while(my @row = $object->{select_query}->fetchrow_array()){
        print $row[0],")   ",$row[1],"\t\t",$row[2],"\t", $row[3], "\n";
    }
}

sub deleteSongPlayList{
    my $object = shift;
    my ($playlist_name, $song_name) = @_;
    my $delete_statement = "DELETE from play_list_songs WHERE SongName =? and Playlist_Name =?";
    my $playlistNameRow = $object->selectAllItemsFromPlaylistNames();
    if (exists($playlistNameRow->{$playlist_name})){
        $object->{delete_query}= $object->{connection}->prepare($delete_statement);
        $object->{delete_query}->execute($song_name, $playlist_name) or die $DBI::errstr;
        $object->{delete_query}->finish();
        return "Data Deleted Sucessfully\n";
    }
    else{
        return "Invalid Name/Entry\n";
    }
    # how to check put two condition in delete statement // Can i use and statement in query
}


sub fetchPlaylist{
    my $object = shift;
    my $select_statement = "SELECT Name_P from play_list_names ";
    $object->{select_query}= $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $row = $object->{select_query}->fetchall_hashref('Name_P');
    $object->{select_query}->finish();
    return $row;
}


sub shufflePlaylist{
    my $object= shift;
    my %shuffled_data;
    my $input_playlist_name = $_[0];
    my $select_statement = "SELECT * from play_list_songs where Playlist_Name=?";
    $object->{select_query} = $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute($input_playlist_name) or die $DBI::errstr;
    my $playlist = $object->{select_query}->fetchall_hashref('Sno');
    $object->{select_query}->execute($input_playlist_name) or die $DBI::errstr;
    my $validator = $object->{select_query}->fetchall_hashref('Playlist_Name');     #checking for invalid input 
    if (exists($validator->{$input_playlist_name})){
        print "Previous Play List\n",Dumper($playlist);
        foreach my $key(shuffle keys %$playlist){ 
            $shuffled_data{$key}= $playlist->{$key};
        }
        $object->{select_query}->finish();
        return \%shuffled_data;
    }
    else{
        return "Playlist name is invalid \n";
    }
}

1;
#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task4";

BEGIN {
    use_ok("Playlist") or die "Unable to open $! ($@)"
};

# Note: 
# check the database before execution of Test Scipt/ Some hardcode values used from database in 
# stock add / stock delete / cart add / cart delete.

# subtest "CREATE PLAYLIST/ createPlaylist" => sub{
#     my $playlist_name = "90's ROCK";
#     my $created_by = "Brenda";
#     my $obj = new Playlist();
#     my $id = $obj->createPlaylist($playlist_name, $created_by);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "DELETE PLAYLIST/ deletePlaylist"=> sub{
#     #Before Execution Check this playlist name is present or not
#     my $playlist_name = "Summer";
#     my $obj = new Playlist();
#     my $test_output = $obj->deletePlaylist($playlist_name);
#     my $expected_output = "Playlist Name is Deleted\n";
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

# subtest "ADD SONGS/ addSongsToDatabase" => sub{
#     my $song_name = "BONGA CHACHA CHA";
#     my $singer_name = "INSTAGRAM";
#     my $obj = new Playlist();
#     my $id = $obj->addSongsToDatabase($song_name, $singer_name);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "ADD SONG TO PLAYLIST/ addSongPlaylist"=> sub{
#     my $playlist_name = "90's ROCK";
#     my $sno = 17;
#     my $obj = new Playlist();
#     my $id = $obj->addSongPlaylist($playlist_name, $sno);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "DELETE SONG FROM PLAYLIST/ deleteSongPlayList"=> sub{
#     #Before Execution Check this playlist name is present or not
#     my $playlist_name = "Romantic";
#     my $song_name = "Matargasti";
#     my $obj = new Playlist();
#     my $test_output = $obj->deleteSongPlayList($playlist_name, $song_name);
#     my $expected_output = "Data Deleted Sucessfully\n";
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

# subtest "FETCH THE PLAYLIST / fetchPlaylist"=> sub{
#     my $expected_output = {
#           'Old songs' => {
#                            'Name_P' => 'Old songs'
#                          },
#           '90\'s ROCK' => {
#                             'Name_P' => '90\'s ROCK'
#                           },
#           'New Song' => {
#                           'Name_P' => 'New Song'
#                         },
#           'Romantic' => {
#                           'Name_P' => 'Romantic'
#                         }
#         };
#     my $obj = new Playlist();
#     my $test_output = $obj->fetchPlaylist();
#     is_deeply($test_output, $expected_output, "TEST IS OKAY");
# };

done_testing();
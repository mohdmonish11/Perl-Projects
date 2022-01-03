#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
use Test::Deep;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task9";

BEGIN {
    use_ok("StudentMS") or die "Unable to open $! ($@)"
};

# Note: 
# check the database before execution of Test Scipt/ Some hardcode values used from database in 
# stock add / stock delete / cart add / cart delete.

# subtest "ADD NEW STUDENT/ addNewStudent" => sub{
#     my $student_name = "Krishna";
#     my $student_address = "Lakshmi Nagar New Delhi";
#     my $obj = new StudentMS();
#     my $id = $obj->addNewStudent($student_name, $student_address);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "FETCH DATA BY STUDENT ID/ selectFromStudentTable"=> sub{
#     my $expected_output = {
#           '153' => {
#                      'student_id' => 153,
#                      'Name' => 'Monish',
#                      'Address' => 'Bardarpur Delhi'
#                    }
#         };
#     my $student_id = 153;
#     my $obj = new StudentMS();
#     my $test_output = $obj->selectFromStudentTable($student_id);
#     is_deeply($test_output, $expected_output, "TEST IS OKAY");
# };

# subtest "ADD COURSES/ addCourses" => sub{
#     my $course_name= "MOBILE SOFTWARE";
#     my $course_fee= 5000;
#     my $description= "Basics structure, versions, OS, shutdown/restart";
#     my $obj = new StudentMS();
#     my $id = $obj->addCourses($course_name, $course_fee, $description);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };


# subtest "Enroll Courses to Student/ coursesEnrollByStudent" => sub{
#     my $course_id = 58;
#     my $student_id = 153;
#     my $fees_amount_paid = 2500;
#     my $fees_left_amount = 2500;
#     my $obj = new StudentMS();
#     my $id = $obj->coursesEnrollByStudent($course_id, $student_id, $fees_amount_paid, $fees_left_amount);
#     my $expected_output = 1 if ($id);
#     ok(1 == $expected_output, "TEST IS OKAY") or diag explain $id;
# };

# subtest "Get courses enrolled by student / getAllEnrolledData"=> sub{
#     my $expected_output = [
#           [
#             'Monish',
#             153,
#             5000,
#             'French Language Diploma'
#           ],
#           [
#             'Abdul',
#             10005,
#             15000,
#             'Youtube'
#           ],
#           [
#             'Brenda',
#             10009,
#             2500,
#             'React Beginner'
#           ],
#           [
#             'Brenda',
#             10009,
#             25000,
#             'Stock Analyst'
#           ],
#           [
#             'Monish',
#             153,
#             2500,
#             'MOBILE SOFTWARE'
#           ]
#         ];
#     my $obj = new StudentMS();
#     my $test_output = $obj->getAllEnrolledData("DataFetch");
#     is_deeply($test_output, $expected_output, "TEST IS OKAY");
# };

# subtest "FEE CHECK/UPDATE FEE / updatePendingFee"=> sub{
#     my $obj = new StudentMS();
#     my $course_id = 52;
#     my $pending_amount = 1500;
#     my $student_id = 153;
#     my $enrolled_data = $obj->getAllEnrolledData();
#     my @data = (2,52,153,8250,1750); # check st  udent course detail table hardcode value for validation
#     my $expected_output = "FEE UPDATED SUCCESSFULLY\n";
#     my $test_output = $obj->updatePendingFee($course_id, $pending_amount, $student_id, @data);
#     ok($test_output eq $expected_output, "TEST IS OKAY") or diag explain $test_output;
# };

subtest "Get Available Courses / getAllEnrolledData"=> sub{
    my $expected_output = [
          [
            'Data Science',
            50000,
            'Study Material, Beginner to Advance level'
          ],
          [
            'React Beginner',
            5000,
            'Study Material, Live Projects, Tutorials'
          ],
          [
            'French Language Diploma',
            10000,
            'one year course with certification'
          ],
          [
            'Bacherlor of Science',
            20000,
            'three year course with certification'
          ],
          [
            'Youtube',
            15000,
            'Design thumbnail, youtube managment, monetisation planning'
          ],
          [
            'Mobile Tech',
            25000,
            'live practical on mobile hardware and software'
          ],
          [
            'Software',
            5000,
            'basic of MS office '
          ],
          [
            'Stock Analyst',
            50000,
            'Basic of Stocks, Candle Pattern, Technical Analysis'
          ],
          [
            'MOBILE SOFTWARE',
            5000,
            'Basics structure, versions, OS, shutdown/restart'
          ]
        ];
    my $obj = new StudentMS();
    my $test_output = $obj->fetchCourses();
    is_deeply($test_output, $expected_output, "TEST IS OKAY");
};



done_testing();
#!/usr/bin/perl use 5.010;
use strict;
use warnings;
use Data::Dumper;
use lib"C:/Users/MOHD MONISH/Desktop/Task/PERL/Task9";  #where the module is saved
use StudentMS;

my $object = new StudentMS();

while(1){
    print"Press 1 Add New Student and Return ID\n";
    print"Press 2 Fetch Data by Student Id\n";
    print"Press 3 Add Courses to Database\n";
    print"Press 4 Enroll Courses to Student\n";
    print"Press 5 Get courses enrolled by student\n";
    print"Press 6 Fee Check and update Enrolled Courses fees\n";
    print"Press 7 Get Available Courses\n";
    print"Press 8 Get Course Fee\n";
    print"Press 9 Get Course Details\n";
    print"Press 0 Exit\nChoose Wisely: ";
    my $input=<STDIN>;
    if ($input == 1){
        passDataToaddNewStudent();
    }
    elsif($input == 2){
        passDataTostudentInfoById();
    }
    elsif($input == 3){
        passDataToaddCourses();
    }
    elsif($input == 4){
        PassDataTocoursesEnrollByStudent();
    }
    elsif($input == 5){
        enrolledDataDetails();
    }
    elsif($input == 6){
        feeCheck();
    }
    elsif($input == 7){
        getAvailableCourses();
    }
    elsif($input == 8){
        getCourseFees();
    }
    elsif($input == 9){
        getCourseDetails();
    }
    last if ($input == 0);
}


sub passDataToaddNewStudent{
    print "Please Enter the name of the Student: ";
    chomp(my $student_name= <STDIN>);
    print "Enter the address: ";
    chomp(my $student_address= <STDIN>);
    my $id = $object-> addNewStudent($student_name, $student_address);
    print "Here is the generated Id ",$id,"\n";
}

sub passDataTostudentInfoById{
    print "Please Enter the Student Id: ";
    chomp(my $student_id= <STDIN>);
    my $student_data = $object-> selectFromStudentTable($student_id);
    for my $keys(keys %{$student_data}){
        print "Name: ",$student_data->{$keys}->{'Name'},"\t",
        "Student Id: ",$student_data->{$keys}->{'student_id'},"\t",
        "Address: ",$student_data->{$keys}->{'Address'},"\n";
    }
}

sub passDataToaddCourses{
    print "Please Enter the Course Name: ";
    chomp(my $course_name= <STDIN>);
    print "Enter Course Fees: ";
    chomp(my $course_fee= <STDIN>);
    print "Enter Course Description: ";
    chomp(my $description= <STDIN>);
    my $id = $object-> addCourses($course_name, $course_fee, $description);
    print "The inserted course id is ", $id,"\n";
}


sub PassDataTocoursesEnrollByStudent{
    my $student_data = $object->selectFromStudentTable();
    print "Student Details with their Id's\n\n";
    for my $keys(keys %{$student_data}){
        print "Name: ",$student_data->{$keys}->{'Name'},"\t\t",
        "Student Id: ",$student_data->{$keys}->{'student_id'},"\n";
    }
    my $course_data = $object-> selectAllCourses();
    print "Here is all the Course Details\n\n";
    for my $keys(keys %{$course_data}){
        print "Course Name: ",$course_data->{$keys}->{'course_name'},"\t\t",
        "Course Id: ",$course_data->{$keys}->{'course_id'},"\n";
    }
    print "Enter the Course id for whom you wanna Enroll: ";
    chomp (my $course_id = <STDIN>);
    print "Enter the Student id for whom you wanna Enroll: ";
    chomp (my $student_id = <STDIN>);
    my $enrolled_data = $object->uniqueKeyCheckInEnroll($student_id, $course_id);

    if ($enrolled_data){
        print"Student Already Enrolled with that Course\n";
    }
    else{
        if (exists($student_data->{$student_id})){
            if (exists($course_data->{$course_id})){
                my $course_fee = $course_data->{$course_id}->{'course_fee'};
                print"The course Fees is: $course_fee\n";
                print "How much you Wanna Pay: ";
                chomp (my $fee_amount = <STDIN>);
                my $fees_amount_paid = $fee_amount;
                my $fees_left_amount = $course_fee - $fee_amount;
                if ($fees_left_amount < 0){
                    print "Invalid Fee amount Entered\n";
                }
                else{
                    my $id = $object->coursesEnrollByStudent($course_id, $student_id, $fees_amount_paid, $fees_left_amount);
                    print "Student enrolled successfully to available course: $id\n";
                } 
            }
            else{
                print "Not a Valid Course Id\n";
            }
        }
        else{
            print"Not a Valid Student Id\n";
        }
    }
}

sub enrolledDataDetails{
    my $flag = "DataFetch";
    my $enrolled_data = $object->getAllEnrolledData($flag);
    print"Name\tStudent_id\tAmountPaid\tCourseName\n";
    for my $data_enrolled (@{$enrolled_data}){
        for my $data(@{$data_enrolled}){
            print $data,"\t\t";
        }
        print"\n";
    }
}

sub feeCheck{
    print "Please Enter the Student Id/course_id to check the fee Structure: ";
    chomp(my $id = <STDIN>);
    my $enrolled_data = $object->getAllEnrolledData();
    print"Student_id\tCourse_id\tAmountPaid\tAmountPending\n";
    for my $data (@{$enrolled_data}){
        my @data = @{$data};
        if(($data[2] == $id) or ($data[1] == $id)){
            print $data[2],"\t \t",$data[1],"\t\t",$data[3],"\t\t", $data[4],"\n";
            print "Pending amount for CourseId:\t", $data[1], "\tAmount is ",$data[4],"\n";
            my $student_id = $data[2];
            print"Enter course id to pay for courses you enrolled\n";
            print"Press 0 To exit\nChoose Wisely: ";
            chomp(my $course_id = <STDIN>);
            if ($course_id == 0){
                last;
            } elsif($course_id == $data[1]){
                print "Enter the amount: ";
                chomp(my $pending_amount = <STDIN>);
                if ($pending_amount >$data[4]){
                    print"Amount Exceeds whatever left over is try again\n";
                } else{
                    print Dumper @data;
                    my $msg = $object->updatePendingFee($course_id, $pending_amount, $student_id, @data);
                    print $msg;               
                }
            }
            last;
        }
    }
}

sub getAvailableCourses{
    my $filter_data = $object->fetchCourses();
    for my $course(@{$filter_data}){
        my @data = @{$course};
        print $data[0],"\n";
    }
}

sub getCourseFees{
    my $filter_data = $object->fetchCourses();
    for my $course(@{$filter_data}){
        my @data = @{$course};
        print $data[0],"\n";
    }
    print"Enter the Course name for which you wanna get the fees:  ";
    chomp(my $course_name =<STDIN>);
    my $check;
    for my $course(@{$filter_data}){
        my @data = @{$course};
        if ($data[0] eq $course_name){
            print $data[0],"::\t",$data[1],"\n";
            $check = 1;
            last;
        }
    }
    print "Invalid name Entered\n" unless $check;
}
sub getCourseDetails{
    my $filter_data = $object->fetchCourses();
    for my $course(@{$filter_data}){
        my @data = @{$course};
        print $data[0],"\n";
    }
    print"Enter the Course name for which you wanna get the details:  ";
    chomp(my $course_name =<STDIN>);
    my $check;
    for my $course(@{$filter_data}){
        my @data = @{$course};
        if ($data[0] eq $course_name){
            print $data[0],"::\t",$data[2],"\n";
            $check =1;
            last;
        }
    }
    print "Invalid name Entered\n" unless $check;  #opposite of if is unless
}

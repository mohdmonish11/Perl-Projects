#!/usr/bin/perl use 5.010;

package StudentMS;
use DBI;
use Data::Dumper;
use Moose;

sub new{
    my $connection = DBI->connect('DBI:mysql:studentmanagementsystem:localhost','root','') or die $DBI::errstr;
    my $class= shift;
    my $self ={
        connection => $connection,
        insert_query => undef,
        update_query => undef,
        select_query => undef,
        delete_query => undef,
    };
    return bless $self, $class; 
}

sub addNewStudent{
    my $object = shift;
    my ($student_name, $student_address) = @_;
    my $insert_statement = "INSERT INTO student_details (Name, Address) Values(?,?)";
    my $insert_query= $object->{connection}->prepare($insert_statement);
    $insert_query->execute($student_name, $student_address) or die $DBI::errstr;
    my $id = $insert_query->{mysql_insertid};
    return $id;
}

sub selectFromStudentTable{
	my $object =shift;
	my $student_id= $_[0];
	my $select_statement;
	if ($student_id){
		$select_statement = "SELECT * from student_details WHERE student_id = ? LIMIT 1";
        $object->{select_query}= $object->{connection}->prepare($select_statement);
        $object->{select_query}->execute($student_id) or die $DBI::errstr;
	} else{
		$select_statement = "SELECT Name, student_id from student_details";
        $object->{select_query}= $object->{connection}->prepare($select_statement);
        $object->{select_query}->execute() or die $DBI::errstr;
	}
    my $student_data = $object->{select_query}->fetchall_hashref('student_id');
    return $student_data;
}

sub addCourses{
    my $object = shift;
    my ($course_name, $course_fee, $description) = @_;
    my $insert_statement = "INSERT INTO course_details (course_name, course_fee, description) Values(?,?,?)";
    my $insert_query = $object->{connection}->prepare($insert_statement);
    $insert_query->execute($course_name, $course_fee, $description) or die $DBI::errstr;
    my $id = $insert_query->{mysql_insertid};
    return $id;
}

sub selectAllCourses{
    my $object = shift;
    my $select_statement = "SELECT course_name, course_id, course_fee from course_details";
    $object->{select_query}= $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $course_data = $object->{select_query}->fetchall_hashref('course_id');
    return $course_data;
}


sub uniqueKeyCheckInEnroll{
    my $object = shift;
    my $student_id = $_[0];
    my $course_id = $_[1];
    my $select_statement= "SELECT 1 from student_course_details WHERE student_id=? and course_id=? LIMIT 1";
    $object->{select_query}= $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute($student_id, $course_id) or die $DBI::errstr;
    my $enrolled_data = $object->{select_query}->fetchrow;
    return $enrolled_data;
}

sub getAllEnrolledData{
    my $object = shift;
    my $statement = $_[0];
    my $select_statement;
    if ($statement){
        $select_statement = "select s.Name,s.student_id,sc.fees_paid_amount, c.course_name from "; 
        $select_statement.="student_details s,student_course_details sc, course_details c ";
        $select_statement.= "where s.student_id=sc.student_id and sc.course_id = c.course_id;";
    } else{
        $select_statement = "SELECT * from student_course_details";
    }
    $object->{select_query} = $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $filter_data = $object->{select_query}->fetchall_arrayref();
    return $filter_data;
}

sub coursesEnrollByStudent{
    my $object = shift;
    my ($course_id, $student_id, $fees_amount_paid, $fees_left_amount) = @_;
    my $insert_statement = "INSERT INTO student_course_details (course_id, student_id, fees_paid_amount, fees_left_amount) Values(?,?,?,?)";
    $object->{insert_query} = $object->{connection}->prepare($insert_statement);
    $object->{insert_query}->execute($course_id, $student_id, $fees_amount_paid, $fees_left_amount) or die $DBI::errstr;
    my $id = $object->{insert_query}->{mysql_insertid};
    return $id;
}

sub updatePendingFee{
    my $object = shift;
    my ($course_id, $pending_amount, $student_id, @data) = @_;
    my $update_query = "UPDATE student_course_details SET fees_paid_amount=?, fees_left_amount=? WHERE course_id =? and student_id=? LIMIT 1";
    if (($course_id == $data[1]) and ($student_id == $data[2])){
        my $new_paid_amount = $data[3] + $pending_amount;
        my $new_left_amount = $data[4] - $pending_amount;
        $object->{update_query} = $object->{connection}->prepare($update_query);
        $object->{update_query}->execute($new_paid_amount, $new_left_amount,$course_id, $student_id) 
        or die $DBI::errstr;
        return "FEE UPDATED SUCCESSFULLY\n";
    }
}

sub fetchCourses{
    my $object = shift;
    my $select_statement = "SELECT course_name, course_fee, description from course_details";
    $object->{select_query} = $object->{connection}->prepare($select_statement);
    $object->{select_query}->execute() or die $DBI::errstr;
    my $filter_data = $object->{select_query}->fetchall_arrayref();
    return $filter_data;
}

1;
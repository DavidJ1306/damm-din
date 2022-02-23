
#--------------------------------------------------------------------
# Test the damm algorithm using ATO's table
#--------------------------------------------------------------------
sub damm {
	my $number = shift;
	unless ($number =~ m/^\d{15}$/) {					# Must be exactly 15 digits
		return 'invalid';
	}
	unless (substr ($number, 0, 3) eq '036') {			# Must have leading 036
		return 'invalid';
	}
	$number = substr ($number, 3, 12);					# Check remaining 12 digits
    my (@digits) = split ('', $number);
	my @table = (
        [ qw( 0 9 8 7 6 5 4 3 2 1 ) ],
        [ qw( 1 0 5 8 7 6 9 4 3 2 ) ],
        [ qw( 2 1 0 9 8 7 6 5 4 3 ) ],
        [ qw( 3 2 1 0 5 8 7 6 9 4 ) ],
        [ qw( 4 3 2 1 0 9 8 7 6 5 ) ],
        [ qw( 9 4 3 2 1 0 5 8 7 6 ) ],
        [ qw( 6 5 4 3 2 1 0 9 8 7 ) ],
        [ qw( 7 6 9 4 3 2 1 0 5 8 ) ],
        [ qw( 8 7 6 5 4 3 2 1 0 9 ) ],
        [ qw( 5 8 7 6 9 4 3 2 1 0 ) ],
	);
    my $row = 0;
    for my $col (@digits) { 
		$row = $table[$row][$col];
	}
    return ( $row eq 0 ) ? 'valid' : 'invalid';			# Non-zero is invalid
}


my @array1 = 1,2,3,4,5;
my @array2 = 5,5,5,5,5;

class Column {
    has Str $.header;
    has @.data;

    method add() {

    }
}

class Dataframe {
    has @.columns of Column;
    has $length = 5;

    method show() {

	for @!columns -> $column {
	    print '|';
	    print $column.header;	
	}
	print '|';
	print "\n";

	for 1..$length -> $idx {
	    for @!columns -> $column {
		print '|';
		print $column.data[$idx-1];
	    }
	    print '|';
	    print "\n";
	}
	print '|';
	print "\n";
    }
}

my $col1 = Column.new(header => "col1", data => @array1);
my $col2 = Column.new(header => "col2", data => @array2);

my $raccoon = Dataframe.new(columns => [$col1, $col2]);

$raccoon.show();

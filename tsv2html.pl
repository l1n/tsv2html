#!/usr/bin/perl

use strict;
use warnings;

use Calendar::Schedule;

my $calendar = Calendar::Schedule->new();

while (<>) {
	next if /^#/;
	chomp;
	my ($name, $comments, $type, $start, $end, $mon, $tue, $wed, $thu, $fri, $sat, $sun) = split "\t";
	my $entry = "";
	$entry .= 'Mon,'	if length $mon;
	$entry .= 'Tue,'	if length $tue;
	$entry .= 'Wed,'	if length $wed;
	$entry .= 'Thu,'	if length $thu;
	$entry .= 'Fri,'	if length $fri;
	$entry .= 'Sat,'	if length $sat;
	$entry .= 'Sun,'	if length $sun;
	chop $entry;
	$entry .= ' ' . $start . '-' . $end . ' ';
	$entry .= <<"EOF";
$name<br />
$comments<br />
$type
EOF
	$calendar->add_entry($entry);
}

$calendar->set_first_week('now');
print $calendar->generate_table();

#!/usr/bin/perl -w

if (scalar(@ARGV) == 1) {
    $citeyaml = shift(@ARGV);
} else {
    print "usage: mk_citation.dbase.pl citation.yaml >my_sources.yaml\n";
    exit();
}

open IN, "<$citeyaml" or die "can't open: $citeyaml!\n";

$entry = 0;
while ($rl = <IN>) {
    chomp($rl);
  NEW:
    if ($rl =~ / id:/) {
#	sleep 1;
	# get the doi
	@e = split '\s+', $rl;
	$doi = $e[2];
#	print "New entry: $doi\n";

	$entry++;
	$data{$entry}{"doi"} = $doi;  
	$data{$entry}{"title"} = "NA";
	$data{$entry}{"pubmed"} = "NA";
	
	# print/get the title
	$gotit = 0;
	$title = "";
	while ($gotit == 0) {
	    $rl = <IN>;
	    chomp($rl);
	    if ($rl =~ /authors:/) {
		$gotit = 1;
	    } else {
		$title .= $rl; 
#		print "$rl\n";
	    }
	}
	$data{$entry}{"title"} = $title;

	#get date
       	$gotit = 0;
	$year = ".";
	while ($gotit == 0) {
	    $rl = <IN>;
	    chomp($rl);
	    if ($rl =~ / id:/) {
		goto NEW;
	    } else {
		if ($rl =~ / date:/) {
		    $rl =~ /'([0-9]+)-([0-9]+)-([0-9]+)'/;
		    $year = $1;
		    $data{$entry}{year} = $year;
		    $gotit = 1;
		}
	    }
	}
	
	#get buttons, then pubmed
	$gotit = 0;
	$pubmed = "NA";
	while ($gotit == 0) {
	    $rl = <IN>;
	    chomp($rl);
	    if ($rl =~ / id:/) { # new entry, start at the top, output current
#		print ">>ENTRY $entry<<\n";
#		print "doi: $data{$entry}{doi}\n";
#		print "title: $data{$entry}{title}\n";
#		print "pmid: $data{$entry}{pubmed}\n";
#		if (!defined($data{$entry}{tags}[0])) {
#		    print "tags: none\n";
#		} else {
#		    for ($j=0; $j<scalar(@{$data{$entry}{tags}}); $j++) {
#			if ($j==0) {
#			    print "tags: $data{$entry}{tags}[$j]";
#			} else {
#			    print " -- $data{$entry}{tags}[$j]";
#			}
#		    }
#		    print "\n";
#		}
		goto NEW;			
	    } else {	    	    
		if ($rl =~ /type: pubmed/) {
		    $rl = <IN>;
		    chomp($rl);
		    $rl =~ /https:\/\/pubmed.ncbi.nlm.nih.gov\/([0-9]+)\//;
		    $pubmed = $1;
		    $data{$entry}{"pubmed"} = $pubmed;
		    $rl = <IN>; #get the residual
		} elsif ($rl =~ / tags:/) { #stop reading buttons when you hit tags
		    $gotit = 1;
		}
	    }
	}
	
	#get tags
	$gotit = 0;	
	while ($gotit == 0) {
	    $rl = <IN>;
	    if (eof(IN)) {
		goto END;
	    }
	    
	    chomp($rl);
	    if ($rl =~ / id:/) { # new entry, start at the top, output current
#		print ">>ENTRY $entry<<\n";
#		print "doi: $data{$entry}{doi}\n";
#		print "title: $data{$entry}{title}\n";
#		print "pmid: $data{$entry}{pubmed}\n";
#		if (!defined($data{$entry}{tags}[0])) {
#		    print "tags: none\n";
#		} else {
#		    for ($j=0; $j<scalar(@{$data{$entry}{tags}}); $j++) {
#			if ($j==0) {
#			    print "tags: $data{$entry}{tags}[$j]";
#			} else {
#			    print " -- $data{$entry}{tags}[$j]";
#			}
#		    }
#		    print "\n";
#		}
		goto NEW;			
	    }
	    
	    $rl =~ /  - ([\w\d\s\/\-]+)/;
	    $tag = $1;
	    #print "tag>> $tag\n";
	    if (!defined($data{$entry}{tags}[0])) {
		$data{$entry}{"tags"}[0] = $tag;
	    } else {
		push @{$data{$entry}{"tags"}}, $tag;
	    }
	}

      END:
	#print this shit
#	print ">>ENTRY $entry<<\n";
#	print "doi: $data{$entry}{doi}\n";
#	print "title: $data{$entry}{title}\n";
#	print "pmid: $data{$entry}{pubmed}\n";
#	if (!defined($data{$entry}{tags}[0])) {
#	    print "tags: none\n";
#	} else {
#	    for ($j=0; $j<scalar(@{$data{$entry}{tags}}); $j++) {
#		if ($j==0) {
#		    print "tags: $data{$entry}{tags}[$j]";
#		} else {
#		    print " -- $data{$entry}{tags}[$j]";
#		}
#	    }
#	    print "\n";
#	}
	
    }
        
}

## ok database from citations loaded. Now, print a sources.yaml file

foreach $entry (sort {$a <=> $b} keys %data) {
    print "$entry,$data{$entry}{doi},$data{$entry}{title},$data{$entry}{year},$data{$entry}{pubmed},";
    if (!defined($data{$entry}{tags}[0])) {
	print ".\n";
    } else {
	for ($j=0; $j<scalar(@{$data{$entry}{tags}}); $j++) {
	    if ($j==0) {
		print "$data{$entry}{tags}[$j]";
	    } else {
		print ",$data{$entry}{tags}[$j]";
	    }
	}
	print "\n";
    }

    
}




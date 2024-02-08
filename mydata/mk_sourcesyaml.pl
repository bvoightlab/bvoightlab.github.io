#!/usr/bin/perl -w

if (scalar(@ARGV) == 1) {
    $dbasefile = shift(@ARGV);
} else {    
    print "usage: mk_sourcesyaml.pl Voight_publication_doi_taglist.csv\n";
    exit();
}

open IN, "<$dbasefile" or die "Can't open $dbasefile!\n";

# process the header
$rl = <IN>; #header
chomp($rl);    
@header = split '\,', $rl;

$entry = 1;
while ($rl = <IN>) {
    chomp($rl);
    @e = split '\,', $rl;
    @{$dbase{$e[4]}{$entry}} = @e; 	
    $entry++;
}
close(IN);

# print output

foreach $year (sort {$b <=> $a} keys %dbase) {
    print "\#\# $year\n\n";    
    foreach $e (keys %{$dbase{$year}}) {
	$this_pmid = $dbase{$year}{$e}[0];
	$this_doi = $dbase{$year}{$e}[1];
	$this_image = $dbase{$year}{$e}[2];
	$this_title = $dbase{$year}{$e}[3];
	$this_source = $dbase{$year}{$e}[5];
	$this_pdf = $dbase{$year}{$e}[6];
	$this_news = $dbase{$year}{$e}[7];

	# always has a doi
	print "- id: doi:$this_doi\n";

	# always has a title but comment out; keep for reference
	print "# title: $this_title\n";
	
	if ($this_image !~ /\./) { #print image if present
	    print "  image: $this_image\n";
	}

	#check if entry has a button. if no buttons, skip
	if ($this_pmid =~ /\./ && $this_pdf =~ /\./ && $this_source =~ /\./ && $this_news =~ /\./) {
	    #no buttons, skip
	} else {
	    #at least one button. print.
	    print "  buttons:\n";
	    if ($this_pmid !~ /\./) {
		print "    - type: pubmed\n";
		print "      link: https://pubmed.ncbi.nlm.nih.gov/$this_pmid\n";
		print "      text: PubMed\n";
	    } elsif ($this_pdf !~ /\./) {
		print "    - type: pdf\n";
		print "      link: $this_pdf\n";
		print "      text: PDF\n";
	    } elsif ($this_source !~ /\./) {
		print "    - type: source\n";
		print "      link: $this_source\n";
		print "      text: GitHub\n";
	    } elsif ($this_news !~ /\./) {
		print "    - type: news\n";
		print "      link: $this_news\n";
		print "      text: News\n";
	    }
	}

	# always has at least one tag
	print "  tags:\n";
	for ($i=8; $i<scalar(@{$dbase{$year}{$e}}); $i++) {
	    if ($dbase{$year}{$e}[$i] !~ /\./) {
		print "    - $header[$i]\n";
	    }
	}

	#break between entries
	print "\n";

    }

}

##pmid,doi,image,title,year,source,pdf,news,Selected_Work,P

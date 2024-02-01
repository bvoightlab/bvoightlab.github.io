---
title: Projects in Population Genetics
author: Ben Voight
---
{% include button.html text="Links to Pubs:" link="publications" %}
{% include tags.html tags="Pop Gen, Mutation Rate, Selection, Baymer, Demography" link="publications" %}

{% include section.html %}

{% include button.html text="Mutation Rates" link="2024/01/11/Projects-Pop-Gen#Mutation-Rate" %}
{% include button.html text="Selection" link="2024/01/11/Projects-Pop-Gen#Selection" %}
{% include button.html text="Interface of Pop-Gen/Complex Traits" link="2024/01/11/Projects-Pop-Gen#Interface" %}

{% include section.html %}
<a id="Mutation-Rate"></a>

## Inference of Mutation Rate Variation across Genomes

Mutation is one of the most important processes generating variation within and between species, and is a fundamental process underlying molecular evolution. My lab is generally interested in work to identify correlates of - and ways to ultimately explain - variation in where, what type, and how frequent different types of mutational events occur in genomes: polymorphisms, substitutions, _de novo_ events, somatic mutations, etc. Ultimately, better models to explain variation in mutation rates across genomes can help interpret evidence for selection (e.g., functional constraint), timing and the pace of the molecular evolutionary clock, how the process of mutation has changes over time or may be different across populations or across the tree of life broadly. Moreover, better models may also ultimately help us to understand mechanism, i.e., what are the ultimately environmental and molecular drivers underlying the mutational process.

To date, our work has mainly focused on modeling variation in mutation rates using sequence context – the local nucleotides that flank a mutated site. For example, it is well known that the rate of C>T transition mutations are substantially elevated at CpG dinucleotide sites owing to the mechanism of spontaneous deamination of 5-methylcytosine. This observation serves as the foundation for questions and models that we explore, namely:

1. *How much variation in where, what type, and how frequent different types of mutations can be captured by sequence context?*
2. *Can improved models for mutation rate variability help identify regions of functional constraint?*
3. *How has the mutational process -- measured by expanded windows of sequence context - changed over time?*

Below, I describe a couple of ideas of interest, but generally I am open to different types of analysis projects or ideas in this space!

1. **Further Development of Baymer**. Our primary report for Baymer describes a 'baseline' implementation that is poised for further development. Some possible angles for novel development include (but not limited to): 
- *Cross-substitution class modelling*. As currently implement, Baymer stratifies the data into 1-mer models (A>G, A>T, A>C, etc.). It is possible that information about rates and local sequence context could be borrowed across all types. 
- *Multi-population models*. When we apply Baymer, we typically do so with by grouping individuals based on some notion of ancestry or similarlity to reference groups, but each separately. However, we know that the history of human populations is connected and can be described by phylogenetic trees with mutations shared across populations, private to specific branches, or may migrate across populations. Extensions to Baymer that consider such models could be imagined which fully utilize all data collectively (rather than stratifying) and could be used to make comparisons of rates across populations.
- *Formal estimation of &theta;*. Baymer quantifies the *probability of mutation* for a given window of sequence context, based on the total number of mutated sites observed divided by the total number of k-mer sequence contexts in the reference (or reconstructed ancestral) genome. However, this basic model has limitations and assumptions which we acknowledge. First is that this probability depends on, but is not itself an estimate of the base pair per generation mutation rate, %mu;. It is also true that this probability depends on several additional quantities including (i) effective population size and other aspects of demographic history that influence patterns of genomic variation, (ii) forces that may influence patterns of variation locally, e.g., selection and recombination, (iii) biological or environmental factors that influence the mutation rate, either globally or locally. Thus, a direction for work would be to improve Baymer with explicit models of these forces to generate estimates of &theta;.
- *Models for recurrent mutation events; mutation saturation*. Baymer makes an infinite sites model, but as the number of surveyed genomes increase, mutational contexts can become saturated. We also know that highly mutable sites that may not yet be saturated can be subjected to recurrent mutational events as well. Work to relax this assumption and accomodate these factors into a modified modeling procedure could be imagined.

2. **Expanded model development for non-sequence context features**. Other (non-sequence contexts) correlates of mutation rate - Replication timing, rate of recombination, strand-biases, functional genomics, etc. These factors absolutely contribute to variation in where, what type, and how frequent polymorphisms are observed and may (or may not) correlate with sequence context features. Another goal would be to select key factors and incorporate them into a unified Baymer model which describes variation across sequences context _and_ one or more of these features.

3. **Applications of Baymer - Across the Tree of Life**. A central question is to what extent are mutational processes conserved across the tree of life. The reduction of cost for large scale sequencing has made creation of draft genomes of thousands of species now possible and facilitates the collection of population level variation data in those species. As a result, it is extremely timely to bring extant data - including but beyond mammals - to this basic question. Our lab is collaborating with the Mathieson Lab to cultivate >100 species worth of polymorphism data to characterize mutational profiles across species, to determine if patterns of variation are different, differently evolving, and if we can correlate features common to species with mutational profiles or spectra, given the structure of the phylogenetic tree. 

4. **Applications of Baymer - Coding Genome**. Previous work focused on the non-coding genome; we expect that patterns of variation in the coding genome (incorporating codon context with sequence context window) should reflect what is observed in the non-coding genome, albeit reduced as a function of purifying selection. The approach would be to improve Baymer to be knowledgable about codon context and strand bias (directionality) to evaluate this model. In particular, the field uses synonymous mutation to generate an expectation for neutral (background) variation. Yet, a small fraction of these sites might still be subject to constraint (e.g., cryptic splice enhancer/modifiers). Thus, the ability to generate an appropriate background based on the genome background would facilitate better models to test all types of variation. Moreover, we also have substantially larger and better refined information on protein structure than ever before -- generated empirically from Cryo-EM or through computational predictions e.g., [AlphaFold](https://www.nature.com/articles/s41586-021-03819-2), AlphaFold2. Another objective is to better isolate regions in proteins likely to be the most constrained overall, to discover regions that are functionally important.

{% include button.html text="Back to Top" link="2024/01/11/Projects-Pop-Gen" %}

{% include section.html %}
<a id="Selection"></a>

## Inference of Selection

I have a longstanding interest in discovery of genomic loci that may be targetted by directional positive selection or adaptive evolution in human populations. Ultimately, our goals are to built new and improve upon existing method to identify genomic signatures in data consistent with the action of different types of selection. I am also fond of much harder work to identify and characterize genes subject to selection that may arise from these efforts, connecting them to human traits to try to understand what may have been important in evolutionary history, primarily in human populations. Previous students in the lab developed new summary statistics to detect the action of balancing selection at genomic loci (the &beta;-Statistics), or improved upon and applied existing tools (the iHS) to multi-population genetics data. More recently, I am interested in applying our work to model mutation rate variation as a function of sequence context to improve resolution of sequences - coding and non-coding - subject to purifying selection, and the strength of that selection on those sequences. 

Some current interest include:

1. **Applying Baymer and context models for new measures of functional constraint, extended regions of homozygosity, adaptation**. The outputs from Baymer include the probability to observe polymorphism at a given nucleotide sites from population data. Using this information, it is possible to generate statistics that quantify the difference between observed vs. expected levels of polymorphism in specific genomic regions relative to the genome background as a whole. For example, we expect to see a reduction of polymorphic sites the coding relative to the non-coding genome, owing to functional constraint on coding sequences. Or, for example, directional selective sweeps that have have only recently fixed in a population will not have had much time to generate new mutations in the region; thus, one expects under some models to observe a deficit/absence of segregating sites in a 'completed' sweep (e.g., SLC24A5 in Europeans). Thus, projects include developing new test statistics based on this output to look for patterns in genomes consistent with different modes of selection.

2. **Baymer - reinterpret previously pop-gen statistics with better models for mutation rates**. Many of the population genetic summary statistics that I grew up learning about that were relevant for detection of selection - the MK test, HKA, dn/ds, etc. are based fundamentally on models for the mutational process. Generally, those models make limited assumptions about sequence context; these could be re-evaluated generally in the light of empirical data and evidence supporting variation in context-based mutability (within and across species).

3. **Application of selection scans to multi-species data**. In the process of assembling multi-species data for mutation-rate inference using Baymer, depending on the quality of the genome assembly and the data collected, it may be possible to apply some of our methods to species beyond humans, to identify signatures of selection from these data.

{% include button.html text="Back to Top" link="2024/01/11/Projects-Pop-Gen" %}

{% include section.html %}

<a id="Interface"></a>

## Projects at the Interface between Population Genomics and Complex Trait Genetics 

My previous training spans population genetic and complex disease trait mapping. I view these as complementary; population genetic thinking is quite informative (infectious, even) to interpreting complex trait association data, deciphering the genetic architecture of complex traits. Along these lines, we try to borrow ideas from population genetic models to understand disease-relevant variation or prediction problems, or how to develop and improve upon statistical genetics approaches that take advantage of multi-ancestry studies across human populations. My lab is always on the hunt for interesting angles where ideas from both spaces can be blended into interesting project. Some examples are listed below:

1. **Somatic mutational data in cancer**. The process and accumulation of somatic mutations is integral to the development of cancer in various tissues, and a great deal of prior work has been performed to learn about mutational signatures that are observed from these data as well as attempting to connect those signatures to molecular processes. However, most of these models are in 3-mer context models. Large-scale somatic mutational data are available to which Baymer could easily be applied to discover new signatures from data, or to use outputs from Baymer (and other measure of selection/constraint) to clarify somatic mutations that may be pathogenic.

2. **Functional constraint models to interpret coding, non-coding variation for complex traits**. While a great deal of functional constraint is observed and relatively well-quantified in the coding genome, quantification of constraint in the non-coding genome is much less obvious. There is a great deal of new methods and new data work from multi-species (mammalian) data, e.g., primate sequencing, Zoonomia, that is bringing unprecedent data and resolution to infer functional constraint. We think potentially there are gains to be made applying functional constraint inferred from measurements informed by sequence-context mutational probabilities inferred by Baymer to quantify constraint further. This could then be applied to interpret human complex trait association data, particularly as output from statistical signal fine-mapping, where additional information about variants within a credible set are likely to be causal would be exceedingly valuable to help guide functional follow-up experimental efforts. 

3. **Population Structure, admixture and quantitative genetics**. We are engaged in large-scale DNA biobanks like the Million Veteran Program, of whom the participants are population genetically diverse. This provides the opportunity to better understand the population genetics of individuals from those biobanks, to infer and quantify admixture to improve genetic mapping effort, and to understand complex disease architecture better. In addition, inferring community-level information about sub-population structure can be very important to identifying pathogenic variation that is at elevated frequency in those groups.

{% include button.html text="Back to Top" link="2024/01/11/Projects-Pop-Gen#" %}

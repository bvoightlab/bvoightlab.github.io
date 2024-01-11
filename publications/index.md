---
title: Publications
nav:
  order: 5
  tooltip: Published Works
---

# {% include icon.html icon="fa-solid fa-book-skull" %}Publications

We have created extensive scholarship around method development and analysis of genetic data in humans, the central focus of my lab. 

My roots began in population genetics, aiming to understand how the genome reveals details of our evolutionary history. Today, we are very are active in the development of methods in population genomics, which include characterization of mutation rates and studies of natural selection in human populations.

We are actively interested in the genetic dissection of complex traits. The statistical pipelines that we have developed and applied over my career have resulting in discovery of thousands of loci for complex traits, focused on type 2 diabetes, cardiovascular disease, and liver disease. This also include mapping of genetic variation associated with molecular phenotypes (eQTLs, sQTLs, caQTLs, etc.) using bulk tissue, cell model, and even single-cell resources in tissues relevant to these endpoints (e.g., pancreas). 

We also have an active interest in the application of Mendelian randomization (MR) to evaluate causal hypotheses between biomarkers and cardiometabolic endpoints, including most famously rejecting a protective role for HDL Cholesterol in heart disease.

I need to prettify the publication listing below (Work in progress)!

But feel free to follow the Pubmed and Google Scholar links below to see a full list of my publications. 

{% include section.html %}

{%
  include button.html
  icon="fa-solid fa-book-open"
  text="More on PubMed"
  link="https://www.ncbi.nlm.nih.gov/myncbi/benjamin.voight.1/bibliography/public/"
%}
{%
  include button.html
  icon="fa-brands fa-google"
  text="More on Google Scholar"
  link="https://scholar.google.com/citations?user=FexB61cAAAAJ&hl=en"
%}

{% include section.html %}

## All

Methodolgy Discipline Area:
{% include tags.html tags="Pop-Gen, Complex Traits, Mendelian Randomization, QTL Mapping" link="publications" %}

Population Genetics Focus:
{% include tags.html tags="Selection, Mutation Rate, Demography" link="publications" %}

Phenotypic Areas:
{% include tags.html tags="T2D, T1D, CAD/CVD, Liver Disease, Pleiotropy" link="publications" %}

Approaches:
{% include tags.html tags="Statistics, AI/ML, Automation" link="publications" %}

Software Available:
{% include tags.html tags="Software" link="publications" %} 

{% include search-box.html %}

{% include search-info.html %}

{% include section.html %}

{% include list.html data="citations" component="citation" style="rich" %}

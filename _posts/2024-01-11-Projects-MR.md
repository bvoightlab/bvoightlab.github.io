---
title: Projects in Mendelian Randomization
author: Ben Voight
---
{% include button.html text="Links to Pubs:" link="publications" %}
{% include tags.html tags="Mendelian Randomization" link="publications" %}

{% include section.html %}

{% include button.html text="MR Analysis" link="2024/01/11/Projects-MR#Analysis" %}
{% include button.html text="MR Methods" link="2024/01/11/Projects-MR#Methods" %}

{% include section.html %}

## Overview
Causal inference is one of the most challenge problems in biology and medicine, and requires multiple lines of evidence from model systems, pharmacology, and genetics to demonstrate convincingly. Under specific assumptions, it is possible to use human genetic variation as an instrumental variable to estimate causal effects between exposures an outcome. For example, loss-of-function variation in _PCSK9_ lowers LDL cholesterol (LDL-C) and susceptibility to heart disease, consistent with the fact that elevated LDL-C is a causal risk factor for heart attack. There is much nuance here, with advances in new methods, understanding the testable (and untestable) assumptions of the model, kits of tools that make application very straight forward – a complete didact on this subject is well beyond the purpose here brief. For those who are interested, I strongly recommend picking up a recently published MR Primer: 

{% include citation.html 
  lookup="doi.org/10.1038/s43586-021-00092-5" 
  style="rich" 
  type=paper 
  title="Mendelian randomization" 
  date="2022-2-10"
  authors="Sanderson E, Glymour MM, Holmes MV, Kang H, Morrison J, Munafò MR, Palmer T, Schooling CM, Wallace C, Zhao Q, Smith GD"
  publisher="Nature Reviews Methods Primers"
  id="doi.org/10.1038/s43586-021-00092-5"
  link="https://www.nature.com/articles/s43586-021-00092-5"
%}

<a id="Analysis"></a>

## Mendelian Randomization Analyses
We are generally interested in discovery or clarifying the role of exposures on outcomes, particularly (but not exclusive to) the cardiometabolic trait space. I.e., we have explore the role of smoking and body mass index (BMI) on T2D risk, serum urate on CAD/T2D, BMI and Waist-Hip ratio (WHR) on blood traits. Ongoing / active projects include:

1.  *Nutrition / dietary exposure on cardiometabolic traits/disease*. Dietary preference is conventionally thought of as a environmental risk factor, but previous studies have elucidated a significant (but small) heritable component to this collection of traits. This facilitates MR experiments to understand what, if any, role this ‘environment’ has on T2D, CVD, or related causal traits. A leading hypothesis is that risk from dietary preference to outcome is mediated through anthropometric factors like adiposity. This work is led by Mia Lee (PGG graduate student) in the lab.

2. *Phenome-wide MR; considerations for diverse ancestry analysis*.  In collaboration with Drs. Venexia Walker and Tom Gaunt (Univ. of Bristol, UK) and Dr. Scott Damrauer (Penn), we are engaged in a broad stroke, all-by-all MR experiment (hundreds of exposure:outcome pairings) via summary data from MVP and the UKBB. This will provide a deep, well powered resource for discovery, but will explore the role and extent of biases that must be contended with in the case of ancestry mismatching.  

3. *Collaborative activities with T2D-GGI*. Collaborating with the T2D-GGI, we are engaged in the latest GWAS for T2D and QTL data through which we can ‘drug target’ via QTLs. The goal with these approaches is to identify potential leads and directions of effect for changes in molecular phenotype (e.g., expression) with a target gene, to make an educated ‘guess’ at the predicted therapeutic direction of effect. In addition, work also is starting which seeks to relate our previously defined genetic clusters to T2D comorbidities (e.g., retinopathy, stroke, etc.)  through the MR framework.

Generally, I’m open to different types of analysis projects that are along the lines of specific targeted questions!

{% include button.html text="Back to Top" link="2024/01/11/Projects-MR" %}

{% include section.html %}
<a id="Methods"></a>

## Mendelian Randomization Methodology

We are also interested in developing methods in MR studies. Previously, we have developed pipelines and a simulation engine to evaluate (empirically) MR under different models and assumptions.

Methods development for MR is a particular challenge, broadly because the field moves rapidly and there are a great many biostatistician/epidemiologists who have dedicated their entire operation to MR (and methods development). Where possible, we seek to bring in these latest methods into ongoing work. Occasionally, we identify methodologic “targets of opportunity” in the course of working with Big Data sets or by pushing the envelope of human genomics studies. We have a couple of areas of interests in this space, primarily along the lines of instrument curation, and when considering large-scale data sets which derive from a plurality of ancestries. That said, my group is certainly open to other lines of inquiry, so interested parties should express their interest so that we can discuss further.


{% include button.html text="Back to Top" link="2024/01/11/Projects-MR" %}

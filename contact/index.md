---
title: Contact
nav:
  order: 7
  tooltip: Email, address, and location
---

# {% include icon.html icon="fa-regular fa-envelope" %}Contact

Our lab is part of the [Department of Systems Pharmacology and Translational Therapeutics](https://www.med.upenn.edu/syspharmatt/) and the [Department of Genetics](https://genetics.med.upenn.edu/), at the [Univesrity of Pennsylvania Perelman School of Medicine](https://www.med.upenn.edu/).
Our lab is located in the [Smilow Center for Translational Research](https://www.facilities.upenn.edu/maps/locations/smilow-center-translational-research).

{%
  include button.html
  type="email"
  text="bvoight28@gmail.com"
  link="bvoight28@gmail.com"
%}
{%
  include button.html
  type="phone"
  text="(215) 746-8083"
  link="+1-215-746-8083"
%}
{%
  include button.html
  type="address"
  tooltip="Our location on Google Maps for easy navigation"
  link="https://goo.gl/maps/ANnU9knKY6LNpxZ76"
%}

{% include section.html %}

{% capture col1 %}

{%
  include figure.html
  image="images/photo.jpg"
  caption="Lorem ipsum"
%}

{% endcapture %}

{% capture col2 %}

{%
  include figure.html
  image="images/photo.jpg"
  caption="Lorem ipsum"
%}

{% endcapture %}

{% include cols.html col1=col1 col2=col2 %}

{% include section.html dark=true %}

{% capture col1 %}
Lorem ipsum dolor sit amet  
consectetur adipiscing elit  
sed do eiusmod tempor
{% endcapture %}

{% capture col2 %}
Lorem ipsum dolor sit amet  
consectetur adipiscing elit  
sed do eiusmod tempor
{% endcapture %}

{% capture col3 %}
Lorem ipsum dolor sit amet  
consectetur adipiscing elit  
sed do eiusmod tempor
{% endcapture %}

{% include cols.html col1=col1 col2=col2 col3=col3 %}

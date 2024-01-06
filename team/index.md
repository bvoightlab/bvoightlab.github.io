---
title: Team
nav:
  order: 2
  tooltip: About Our Team
redirect_from:
  - /lab-members
  - /alums
  - /staff
  - /trainees
---

# {% include icon.html icon="fa-solid fa-users" %}Team

I am fortunate to be blessed with a fantastic group of diverse group of trainees and computational scientists who I have bedazzled into chasing all of our myriad of interests!

{% include section.html %}

{% include list.html data="members" component="portrait" filters="role: pi, group: member" %}
{% include list.html data="members" component="portrait" filters="role: bioinformatician, group: member" %}
{% include list.html data="members" component="portrait" filters="role: programmer, group: member" %}
{% include list.html data="members" component="portrait" filters="role: postdoc, group: member" %}
{% include list.html data="members" component="portrait" filters="role: technician, group: member" style="small" %}
{% include list.html data="members" component="portrait" filters="role: phd, group: member" %}
{% include list.html data="members" component="portrait" filters="role: masters, group: member" %}
{% include list.html data="members" component="portrait" filters="role: post-bac, group: member" %}
{% include list.html data="members" component="portrait" filters="role: undergrad, group: member" %}

{% include section.html background="images/background.jpg" dark=true%}

We are  always on the lookout for new souls, hungry to develop their computational skills chasing contemporary and impactful questions in human genetics, translational bioinformatics, and population biology. We dedicate part of our mission to training all in the computational scientific "dark arts" though statistical data science and computational methods development, and welcome folks interested in joining the team of all ilk and prior baselines!

{%
  include button.html
  icon="fa-solid fa-handshake-angle"
  text="Join the Team"
  link="join"
  style="button"
%}

{% include section.html %}

## Alumni

Our former lab members who have moved on to new places and activities!  

{% include list.html data="members" component="portrait" filters="role: programmer, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: bioinformatician, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: technician, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: postdoc, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: phd, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: masters, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: post-bacc, group: alum" style="small" %}
{% include list.html data="members" component="portrait" filters="role: undergrad, group: alum" style="small" %}

{% include section.html %}

## Funding

Our work is made possible by funding from several organizations.

{% capture content %}

[![Alfred P. Sloan Foundation](/images/logos/alfred-p-sloan-foundation.png)](https://sloan.org/)

[![National Institute for Diabetes and Digestive and Kidney Diseases](/images/logos/national-institute-diabetes-digestive-kidney-diseases.png)](https://www.niddk.nih.gov/)

[![American Heart Association](/images/logos/american-heart-association.png)](https://www.heart.org/)

[![The W.W. Smith Charitable Trust](/images/logos/ww-smith-charitable-trust.png)](http://www.wwsmithcharitabletrust.org/)

[![US Department of Veterans Affairs](/images/logos/us-department-of-veterans-affairs.png)](https://www.va.gov/)

<strong>Linda Pechenik Montague Foundation</strong>

{% endcapture %}

{% include grid.html content=content %}

---
layout: page
title: Scientific Publications 
permalink: /publications/
---

<div class="box" markdown="1">	

# Research Articles and Reviews 

{% assign revyears = site.data.years | reverse %}

{%for year in revyears  %}
<br >
<h2 style="text-align:center">{{year}}</h2>

{% assign thisyear = site.data.publications | where: "year",  year%}

<table>
{% for paper in thisyear %}
<tr>
  <td style="padding-left: 22px ; text-indent: -22px ;text-align:left">{{paper.text}}</td>
</tr>
{% endfor %}
</table>

{% endfor %}


</div>	

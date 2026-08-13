---
layout: page
title: Scientific Publications 
permalink: /publications/
hero_image: "/images/20230917_145626.jpg"
---



<div class="box" markdown="1" style="padding:40px">	

# Peer-reviewed articles and book chapters
<br>

<div id="allrefs">
{% assign years = site.data.pubs | map: 'year' | uniq %}

{%for year in years  %}
<div class="box" markdown="1">	
<h2 style="text-align:center">{{year}}</h2>

{% assign thisyear = site.data.pubs | where: "year",  year%}

<table >
{% for paper in thisyear %}
<tr>
  <td style="padding-left: 22px ; text-indent: -22px ;font-size:1.2rem;;text-align:left">{{paper.ref}}</td>
</tr>
{% endfor %}
</table>

</div>
{% endfor %}


</div>	

</div>	

<div class="box" markdown="1">	

<h2>Conference Abstracts and Proceedings </h2>

<div id="allconf">
{% assign years = site.data.conf | map: 'year' | uniq %}

{%for year in years  %}
<div class="box" markdown="1">	
<h2 style="text-align:center">{{year}}</h2>

{% assign thisyear = site.data.conf | where: "year",  year%}

<table >
{% for paper in thisyear %}
<tr>
  <td style="padding-left: 22px ; text-indent: -22px ;font-size:1.2rem;;text-align:left">{{paper.ref}}</td>
</tr>
{% endfor %}
</table>

</div>
{% endfor %}


</div>	

<script>
const div = document.querySelector('#allrefs')
div.innerHTML = div.innerHTML.replace(/Kocsis, [AÁ]. T./g, (match) => {
  return `<span style="font-weight:1000;color:black;font-family:sans-serif">${match}</span>`
})
const div2 = document.querySelector('#allconf')
div2.innerHTML = div2.innerHTML.replace(/Kocsis, [AÁ]. T./g, (match) => {
  return `<span style="font-weight:1000;color:black;font-family:sans-serif">${match}</span>`
})
</script>

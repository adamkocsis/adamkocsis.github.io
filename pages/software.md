---
layout: page
title: Software 
permalink: software/
---

# R extensions packages

### Packages on the Comprehensive R Archive Network (CRAN)

{% assign rpackages = site.data.software | where: "type", 'R package' %}

{% for pack in rpackages %}

<div class="box">
  <div class="columns is-vcentered">
	<div class="column is-2">
	<a  href="{{db['link']}}">
	<img src="{{site.baseurl}}{{site.url}}/images/logos/{{pack['logo']}}" width="200" alt="{{db['name']}} logo" style="margin-left:20px;margin-right:20px">
	</a>
	</div>
	<div class="column is-1">
	</div>
	<div class="column">
	<a  href="{{pack['link']}}">
	<h1>{{pack['name']}}</h1>
	<p><i> {{pack['long']}}</i></p>
	</a>
	<p> {{pack['description']}}</p>
	</div>
  </div>
</div>


{% endfor %}


---
layout: page
title: Lectures
permalink: /lectures/
---

# STAT 385: Statistics Programming Methods

#### *University of Illinois at Urbana-Champaign*

#### *Summer 2016*

{% for post in site.categories.lectures %}
- **{{ post.date | date: '%B %d, %Y' }} {{ post.date | date: '%a' }}** [{{ post.title }}]({{ post.url }})
{% endfor %}
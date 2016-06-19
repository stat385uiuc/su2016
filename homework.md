---
layout: page
title: Homework
permalink: /homework/
---

# STAT 385: Statistics Programming Methods

#### *University of Illinois at Urbana-Champaign*

#### *Summer 2016*

{% for post in site.categories.hw %}
- [{{ post.title }}]({{ post.url }})
{% endfor %}
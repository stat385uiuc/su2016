---
layout: page
title: Lectures
permalink: /lectures/
---

# STAT 385: Statistics Programming Methods

#### *University of Illinois at Urbana-Champaign*

#### *Summer 2016*

{% for post in site.categories.lectures %}
- [{{ post.title }}]({{ post.url }})
{% endfor %}
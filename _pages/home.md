---
layout: splash
permalink: /

title: Sample Hub
excerpt: 'Sample Hub Website'

header:
  overlay_color: splash
  overlay_image: /assets/images/splash.jpg

feature_row:
- title: "Title1"
  alt: "Title1"
  url: "/docs/page_1/"
  excerpt: "Page 1"
  btn_label: "Learn More"
- title: "Title2"
  alt: "Title2"
  url: "/docs/page_2/"
  excerpt: "Page 2"
  btn_label: "Learn More"
slack:
- excerpt: 'Join on Slack!'
---

{% include feature_row id="slack" type="center" %}

{% include feature_row %}

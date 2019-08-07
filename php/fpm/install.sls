{%- set tplroot = tpldir.split('/')[0] %}
{% set state = 'fpm' %}
{% include tplroot ~ "/installed.jinja" %}

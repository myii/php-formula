{%- set tplroot = tpldir.split('/')[0] %}
{%- set state = 'svn' %}
{%- include tplroot ~ "/installed.jinja" %}

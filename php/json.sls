{%- set tplroot = tpldir.split('/')[0] %}
{%- set state = 'json' %}
{%- include tplroot ~ "/installed.jinja" %}

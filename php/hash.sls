{%- set tplroot = tpldir.split('/')[0] %}
{%- set state = 'hash' %}
{%- include tplroot ~ "/installed.jinja" %}

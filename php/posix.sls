{%- set tplroot = tpldir.split('/')[0] %}
{%- set state = 'posix' %}
{%- include tplroot ~ "/installed.jinja" %}

{%- set tplroot = tpldir.split('/')[0] %}
{%- set state = 'mdb2-driver-mysql' %}
{%- include tplroot ~ "/installed.jinja" %}
{%- include tplroot ~ "/mdb2/init.sls" %}

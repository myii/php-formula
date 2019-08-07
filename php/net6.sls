{%- set tplroot = tpldir.split('/')[0] %}
{%- if salt['grains.get']('os_family') == "RedHat" %}
{#-
  Installation of this PEAR module can be done by running
  `pear install Net_IPv6` on RedHat based distros
#}
{%- else %}
  {%- set state = 'net6' %}
  {%- include tplroot ~ "/installed.jinja" %}
{%- endif %}

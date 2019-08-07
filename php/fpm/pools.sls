# Manages the php-fpm pools config files
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import php with context %}
{%- from tplroot ~ "/macro.jinja" import sls_block %}
{%- from tplroot ~ "/fpm/pools_config.sls" import pool_states with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
        - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - php.fpm.service
  - php.fpm.pools_config

{% if pool_states %}
extend:
  php_fpm_service:
    service:
      - watch:
{{ file_requisites(pool_states) }}
      - require:
{{ file_requisites(pool_states) }}
{% endif %}

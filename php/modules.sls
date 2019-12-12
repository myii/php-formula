{% from "php/map.jinja" import php with context %}

{% set modules = salt['pillar.get']('php:modules') or [] %}
{% set base_name = 'php.' %}
{% set existing_states = salt['cp.list_states']() %}

{% set includes = [] %}
{% set install = [] %}

{%- do salt.log.error('{0}\n'.format(modules) ~ modules|yaml(False)) %}
{% for module in modules %}
{%- do salt.log.error('{0}\n'.format(module) ~ module|yaml(False)) %}
{%   set state = base_name ~ module %}
{%- do salt.log.error('{0}\n'.format(state) ~ state|yaml(False)) %}
{%- do salt.log.error('{0}\n'.format(existing_states) ~ existing_states|yaml(False)) %}
{%   if state in existing_states %}
{%     do includes.append(state) %}
{%   else %}
{%     do install.append(module) %}
{%   endif %}
{% endfor %}

{%- do salt.log.error('{0}\n'.format(includes) ~ includes|yaml(False)) %}
include: {{ includes|json }}

{%- do salt.log.error('{0}\n'.format(install) ~ install|yaml(False)) %}
{% for state in install %}
{%- do salt.log.error('{0}\n'.format(state) ~ state|yaml(False)) %}
{%   include "php/installed.jinja" %}
{% endfor %}

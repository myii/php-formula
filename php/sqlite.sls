{%- from "php/map.jinja" import php with context %}

include:
  - php.deprecated
  - php

php-sqlite:
  pkg.installed:
    - name: {{ php.sqlite_pkg }}

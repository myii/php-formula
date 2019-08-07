# Meta-state to fully install php.fpm

include:
  - php.fpm.config
  - php.fpm.service
  - php.fpm.pools

{% set pillar_php_version = salt['pillar.get']('php:version', '7.0') %}
extend:
  php_fpm_service:
    service:
      - watch:
    {% if pillar_php_version is iterable and pillar_php_version is not string %}
      {% for version in pillar_php_version %}
        - file: php_fpm_ini_config_{{ version }}
        - file: php_fpm_conf_config_{{ version }}
      {% endfor %}
    {% else %}
        - file: php_fpm_ini_config
        - file: php_fpm_conf_config
    {% endif %}
      - require:
        - sls: php.fpm.config
  {% if pillar_php_version is iterable and pillar_php_version is not string %}
    {% for version in pillar_php_version %}
  php_fpm_ini_config_{{ version }}:
    file:
      - require:
        - pkg: php_install_fpm
  php_fpm_conf_config_{{ version }}:
    file:
      - require:
        - pkg: php_install_fpm
    {% endfor %}
  {% else %}
  php_fpm_ini_config:
    file:
      - require:
        - pkg: php_install_fpm
  php_fpm_conf_config:
    file:
      - require:
        - pkg: php_install_fpm
  {% endif %}

debconf-utils:
  pkg.installed

mysqlroot:
  debconf.set:
    - template: jinja
    - context:
      passwd: {{ pillar.get('passwd', 'mysqldefault') }}
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': '{{ 'passwd' }}'}
        'mysql-server/root_password_again': {'type': 'password', 'value': '{{ 'passwd' }}'}
    - require:
      - pkg: debconf-utils

mysql-server:
  pkg.installed

mysql-client:
  pkg.installed

debconf-utils:
  pkg.installed

mysqlroot:
  debconf.set:
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': 'mysqldefault'}
        'mysql-server/root_password_again': {'type': 'password', 'value': 'mysqldefault'}
    - require:
      - pkg: debconf-utils

mysql-server:
  pkg.installed

mysql-client:
  pkg.installed

mysql-server:
  pkg.installed

debconf-utils:
  pkg.installed

mysql_setup:
  debconf.set:
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': 'xeBee5roi1' }
        'mysql-server/root_password_again': {'type': 'password', 'value': 'xeBee5roi1' }
    - require:
      - pkg: debconf-utils

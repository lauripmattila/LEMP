nginx:
  pkg.installed

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/default

/var/www/virtualhost.com/html/index.html:
  file.managed:
    - source: salt://nginx/index.html
    - makedirs: true

/etc/nginx/sites-available/virtualhost.com:
  file.managed:
    - source: salt://nginx/virtualhost.com

/etc/nginx/sites-enabled/virtualhost.com:
  file.symlink:
    - target: /etc/nginx/sites-available/virtualhost.com

/etc/hosts:
  file.managed:
    - source: salt://nginx/hosts

nginxservice:
  service.running:
    - name: nginx
    - watch:
      - file: /etc/nginx/sites-available/default
      - file: /etc/nginx/sites-available/virtualhost.com

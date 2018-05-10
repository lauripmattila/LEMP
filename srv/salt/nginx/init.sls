nginx:
  pkg.installed

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/default

nginx:
  service.running:
    - watch:
      - file: /etc/nginx/sites-available/default

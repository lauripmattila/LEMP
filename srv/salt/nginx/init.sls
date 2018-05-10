nginx:
  pkg.installed

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/default

nginxservice:
  service.running:
    - name: nginx
    - watch:
      - file: /etc/nginx/sites-available/default

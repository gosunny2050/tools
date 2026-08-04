docker run -d \
  --name nginx \
  --restart=unless-stopped \
  --add-host host.docker.internal:host-gateway \
  -p 80:80 \
  -p 443:443 \
  -v /docker/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /docker/nginx/conf.d:/etc/nginx/conf.d:ro \
  -v /docker/nginx/html:/usr/share/nginx/html:ro \
  -v /docker/nginx/logs:/var/log/nginx \
  -v /docker/nginx/ssl:/etc/nginx/ssl:ro \
  -v /home/images/screenshots:/data/screenshots:ro \
  nginx:latest


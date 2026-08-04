# 一行命令创建 Nginx 容器
# 删除现有容器

# 重新创建，添加 host 映射
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
  -v /docker/nginx/static-assets:/var/www/static-assets:ro \
  -v /docker/nginx/pages:/var/www/pages:ro \
  nginx:latest

# 然后配置中使用 host.docker.internal:3000


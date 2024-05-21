FROM ubuntu:latest

EXPOSE 80

RUN apt-get update && apt-get install -y \
    nano \
    build-essential \
    libpcre3-dev \
    libssl-dev \
    zlib1g \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    wget \
    git

RUN mkdir /naxis_install && \
    cd /naxis_install && \
    git clone --recurse-submodules https://github.com/nginx/nginx && \
    git clone --recurse-submodules https://github.com/wargio/naxsi.git && \
    cd ./nginx && \
    ./auto/configure     --sbin-path=/usr/sbin/nginx \
                         --conf-path=/etc/nginx/nginx.conf \
                         --error-log-path=/var/log/nginx/error.log \
                         --http-log-path=/var/log/nginx/access.log \
                         --with-pcre \
                         --pid-path=/var/run/nginx.pid \
                         --with-http_ssl_module \
                         --add-dynamic-module=/naxis_install/naxsi/naxsi_src \
    && make \
    && make install \ 
    && cp /naxis_install/naxsi/naxsi_rules/naxsi_core.rules /etc/nginx/

    RUN rm /etc/nginx/nginx.conf && \
cat <<EOF > /etc/nginx/nginx.conf
load_module /usr/local/nginx/modules/ngx_http_naxsi_module.so;
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include /etc/nginx/naxsi_core.rules;
    include       mime.types;
    default_type  application/octet-stream;
    keepalive_timeout  65;
    server {
        listen 80;
        server_name 127.0.0.1;
        location / {
                add_header Referrer-Policy same-origin;
                add_header X-Frame-Options SAMEORIGIN;
                add_header X-Content-Type-Options nosniff;
                add_header X-XSS-Protection "1; mode=block";
                add_header Content-Security-Policy "default-src 'self' 'unsafe-inline' http://cdnjs.cloudflare.com; ";
                proxy_pass http://172.17.0.6:3000;
                proxy_http_version 1.1;
                # proxy_set_header Upgrade $http_upgrade;
                # proxy_set_header Connection "Upgrade";
                # proxy_set_header Host $host;
                include /etc/nginx/my_rules.rules;
                error_page 500 /etc/nginx/error_pages/500.html;
                proxy_intercept_errors on;
        }
    }
}
EOF

COPY my_rules.rules /etc/nginx/
COPY naxsi_rules.rules /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]

FROM ubuntu:26.04

# Install official nginx stable from nginx.org
RUN apt-get update -y \
    && apt-get install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring \
    && curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
        | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
https://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" \
        > /etc/apt/sources.list.d/nginx.list \
    && printf "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
        > /etc/apt/preferences.d/99nginx \
    && apt-get update -y \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*


# Install blendbyte nginx modules
RUN install -d -m 0755 /etc/apt/keyrings \
    && curl -fsSL https://apt.blendbyte.net/nginx/blendbyte-archive-keyring.gpg \
        | tee /etc/apt/keyrings/blendbyte.gpg >/dev/null \
    && echo "deb [signed-by=/etc/apt/keyrings/blendbyte.gpg] https://apt.blendbyte.net/nginx $(lsb_release -cs) main" \
        > /etc/apt/sources.list.d/blendbyte.list \
    && apt-get update -y \
    && apt-get install -y \
        nginx-module-brotli \
        nginx-module-brotli-static \
        nginx-module-zstd \
        nginx-module-zstd-static \
        nginx-module-modsecurity \
        nginx-module-geoip2 \
        nginx-module-stream-geoip2 \
        nginx-module-headers-more \
        nginx-module-substitutions \
        nginx-module-cache-purge \
        nginx-module-fancyindex \
        nginx-module-dav-ext \
    && rm -rf /var/lib/apt/lists/*


# Set up Ubuntu-style directory structure (sites-available/sites-enabled)
# Official nginx uses /etc/nginx/conf.d/ only — recreate Ubuntu layout
RUN mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled /etc/nginx/snippets \
    && rm -f /etc/nginx/conf.d/default.conf \
    && useradd --no-create-home --shell /usr/sbin/nologin --user-group www-data 2>/dev/null || true


COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./sites-available/default /etc/nginx/sites-available/default
COPY ./snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf
COPY ./homepage /var/www/html

RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


CMD ["nginx", "-g", "daemon off;"]

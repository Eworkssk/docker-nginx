FROM ubuntu:24.04

RUN apt update -y \
    && apt install software-properties-common -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


RUN add-apt-repository ppa:ondrej/nginx-mainline \
    && apt update -y \
    && apt install nginx-extras libnginx-mod-http-brotli-static libnginx-mod-http-brotli-filter -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./sites-available/default /etc/nginx/sites-available/default
COPY ./snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf
COPY ./homepage /var/www/html


CMD ["nginx", "-g", "daemon off;"]

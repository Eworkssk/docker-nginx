# Nginx Docker Image

![Docker Stars](https://img.shields.io/docker/stars/eworkssk/nginx?style=for-the-badge)
![Docker Pulls](https://img.shields.io/docker/pulls/eworkssk/nginx?style=for-the-badge)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/eworkssk/nginx/latest?style=for-the-badge)

**Automatic weekly updates**

Latest Nginx Mainline release available for both `linux/amd64` and `linux/arm64/v8` platforms using [Ubuntu PPA by Ondřej Surý](https://launchpad.net/~ondrej/+archive/ubuntu/nginx-mainline). The image uses `nginx-extras` package with additional `brotli` compression and `HTTP3` support.


## Pull

Current image is tagged in `year.week` format.

```
docker pull eworkssk/nginx:latest
```

```
docker pull eworkssk/nginx:year.week
```


## Usage

Mount your web application anywhere and expose ports:

```
docker run -v /my-app:/my-app -p 80:80 -p 443:443 --rm eworkssk/nginx
```


# Installed modules

```
--with-http_ssl_module
--with-http_stub_status_module
--with-http_realip_module
--with-http_auth_request_module
--with-http_v2_module
--with-http_v3_module
--with-http_dav_module
--with-http_slice_module
--with-threads
--with-http_addition_module
--with-http_flv_module
--with-http_gunzip_module
--with-http_gzip_static_module
--with-http_mp4_module
--with-http_random_index_module
--with-http_secure_link_module
--with-http_sub_module
--with-mail_ssl_module
--with-stream_ssl_module
--with-stream_ssl_preread_module
--with-stream_realip_module
--with-http_geoip_module=dynamic
--with-http_image_filter_module=dynamic
--with-http_perl_module=dynamic
--with-http_xslt_module=dynamic
--with-mail=dynamic
--with-stream=dynamic
--with-stream_geoip_module=dynamic
```

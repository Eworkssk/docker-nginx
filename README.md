# Nginx Docker Image

Ubuntu-based Docker image with [nginx](https://nginx.org/) stable from the official nginx.org repository, extended with third-party modules for compression, security, and more.

[![Build and Publish](https://github.com/eworkssk/docker-nginx/actions/workflows/build.yml/badge.svg)](https://github.com/eworkssk/docker-nginx/actions/workflows/build.yml)
![Docker Stars](https://img.shields.io/docker/stars/eworkssk/nginx?style=for-the-badge)
![Docker Pulls](https://img.shields.io/docker/pulls/eworkssk/nginx?style=for-the-badge)
![Docker Image Size](https://img.shields.io/docker/image-size/eworkssk/nginx/latest?style=for-the-badge)
![GitHub Packages](https://img.shields.io/badge/GitHub_Packages-ghcr.io-blue?style=for-the-badge&logo=github)

> [!WARNING]
> This image has switched from the [Ondřej Surý PPA](https://codeberg.org/oerdnj/deb.sury.org/issues/67) to the [official nginx.org repository](https://nginx.org/en/linux_packages.html). If you are using custom modules or configuration that depends on the Ondřej Surý packaging, please review your setup before upgrading. A big thank you to Ondřej Surý for maintaining the PPA for many years — it was invaluable to the community.

## What's included

Nginx stable from [nginx.org](https://nginx.org/en/linux_packages.html) with dynamic modules from [Blendbyte](https://www.nginx-modules.com/):

| Module | Package |
|--------|---------|
| Brotli compression | `nginx-module-brotli` |
| Brotli static | `nginx-module-brotli-static` |
| Zstandard compression | `nginx-module-zstd` |
| Zstandard static | `nginx-module-zstd-static` |
| ModSecurity WAF | `nginx-module-modsecurity` |
| GeoIP2 | `nginx-module-geoip2` |
| Stream GeoIP2 | `nginx-module-stream-geoip2` |
| Headers More | `nginx-module-headers-more` |
| Substitutions | `nginx-module-substitutions` |
| Cache Purge | `nginx-module-cache-purge` |
| Fancy Index | `nginx-module-fancyindex` |
| WebDAV Extended | `nginx-module-dav-ext` |

We are keeping the Ubuntu-style configuration structure (`sites-available` / `sites-enabled` / `snippets`) instead of Debian structure that uses `conf.d` folder.

## Get it from

- [Docker Hub](https://hub.docker.com/r/eworkssk/nginx): `eworkssk/nginx`
- [GitHub Packages](https://github.com/eworkssk/docker-nginx/pkgs/container/nginx): `ghcr.io/eworkssk/nginx`

### Choose the right tag

| Tag | Description |
|-----|-------------|
| `latest` | Latest build |
| `1.30` | Latest build of the 1.30.x line |
| `1.30.5` | Latest build of nginx 1.30.5 |

_Tags are examples — see [Docker Hub](https://hub.docker.com/r/eworkssk/nginx) or [GitHub Packages](https://github.com/eworkssk/docker-nginx/pkgs/container/nginx) for current tags._

## Quick start

```bash
# Run with your app mounted
docker run -d \
  -v /my-app:/my-app \
  -p 80:80 -p 443:443 \
  eworkssk/nginx:latest

# Open a shell
docker exec -it nginx bash
```

## Docker Compose

```yaml
services:
  nginx:
    image: eworkssk/nginx:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./sites-available:/etc/nginx/sites-available
      - ./ssl:/etc/nginx/ssl:ro
    restart: unless-stopped
```

## Configuration

Default config is at `/etc/nginx/nginx.conf`. Directory layout follows Ubuntu conventions:

| Path | Purpose |
|------|---------|
| `/etc/nginx/sites-available/` | Available site configs |
| `/etc/nginx/sites-enabled/` | Enabled site configs (symlinks) |
| `/etc/nginx/snippets/` | Reusable config snippets |
| `/etc/nginx/conf.d/` | Additional global config |

Mount your own `nginx.conf` or site configs as volumes, or extend this image with a `COPY` in your own Dockerfile.

## Builds

Images are built for `linux/amd64` and `linux/arm64` — works on standard x86-64 machines, ARM-based Linux servers, Apple Silicon, and Raspberry Pi.

Images are updated automatically every Tuesday and Friday at 03:00 UTC, always pulling the latest nginx stable release and Ubuntu security patches.

---

## Maintained by EWORKS.sk

[<img src="https://raw.githubusercontent.com/eworkssk/docker-nginx/master/homepage/eworks.png" alt="EWORKS.sk" height="80">](https://eworks.sk/)

We are building custom web and mobile apps for 20+ years. Check out [our website](https://eworks.sk/) for more.

This image runs in our own stack, which is why we keep it maintained. Issues and PRs are welcome and appreciated.

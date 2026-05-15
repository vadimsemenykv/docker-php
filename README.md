
# PHP Docker Images

This repository provides Docker images for multiple PHP versions, configured for development and testing environments. Each image includes support for various PHP extensions and tools.

---

## Available Tags

| Tag | PHP Version | Base OS |
|-----|-------------|---------|
| `7.1` | PHP 7.1 | Debian Buster |
| `7.2` | PHP 7.2 | Debian Buster |
| `7.3` | PHP 7.3 | Debian Buster |
| `7.4` | PHP 7.4 | Debian Buster |
| `8.0` | PHP 8.0 | Debian Bullseye |
| `8.1` | PHP 8.1 | Debian Bullseye |
| `8.2` | PHP 8.2 | Debian Bullseye |
| `8.3` | PHP 8.3 | Debian Bookworm |
| `8.4` | PHP 8.4 | Debian Bookworm |
| `8.5`, `latest` | PHP 8.5 | Debian Bookworm |

---

## Features

- **Multiple PHP versions**: 7.1 through 8.5, each as a separate image tag.
- **FPM-based**: All images use `php-fpm` as the process manager.
- **Multi-arch**: Images are built for `linux/amd64` and `linux/arm64`.
- **Configurable build**: Optional extensions enabled via build arguments.
- **Included by default**: PDO (MySQL, PostgreSQL), GD.

---

## Getting Started

### Pull an Image

```bash
docker pull vadymsemeniuk/docker-php:8.4
docker pull vadymsemeniuk/docker-php:7.4
```

### Build Locally

```bash
docker build -f DockerFile-84 -t vadymsemeniuk/docker-php:8.4 .
```

#### Build Arguments

Customize the image using the following optional build arguments:

| Argument            | Description                      | Default |
|---------------------|----------------------------------|---------|
| `INSTALL_SOAP`      | Enable SOAP extension            | `false` |
| `INSTALL_XDEBUG`    | Enable xDebug extension          | `false` |
| `INSTALL_PHPREDIS`  | Enable Redis extension           | `false` |
| `INSTALL_BCMATH`    | Enable BCMath extension          | `false` |
| `INSTALL_MEMCACHED` | Enable Memcached extension       | `false` |
| `INSTALL_OPCACHE`   | Enable Opcache extension         | `false` |
| `INSTALL_MYSQLI`    | Enable MySQLi extension          | `false` |
| `INSTALL_INTL`      | Enable Intl extension            | `false` |

> **Note:** `INSTALL_AEROSPIKE` is only available in the `7.1` image. The Aerospike PHP client does not support PHP 7.2+.

Example:

```bash
docker build -f DockerFile-84 \
  --build-arg INSTALL_XDEBUG=true \
  --build-arg INSTALL_OPCACHE=true \
  -t vadymsemeniuk/docker-php:8.4 .
```

---

### Run the Container

```bash
docker run -d -p 9000:9000 -v $(pwd):/var/www vadymsemeniuk/docker-php:8.4
```

---

## Build & Push All Tags

Use the provided script to build and push all versions with multi-arch support:

```bash
./build-and-push.sh
```

This builds all tags for `linux/amd64` and `linux/arm64` and pushes them to Docker Hub.

---

## Configuration Files

The following configuration files are included and mounted into the container:

- **PHP Configuration**: `configs/php.ini`
- **PHP-FPM Pool Configuration**: `configs/php-fpm.pool.conf`
- **xDebug Configuration**: `configs/xdebug.ini`
- **Opcache Configuration**: `configs/opcache.ini`

---

## Extensions

### Included by Default

- **GD**: Image manipulation (JPEG, FreeType).
- **PDO**: Database support for MySQL and PostgreSQL.

### Optional (via Build Arguments)

- **SOAP**: SOAP-based web services.
- **xDebug**: Debugging and profiling.
- **Redis**: Redis integration.
- **BCMath**: Arbitrary precision mathematics.
- **Memcached**: Caching layer.
- **Opcache**: PHP opcode caching.
- **MySQLi**: Extended MySQL support.
- **Intl**: Internationalization support.

---

## Exposed Ports

- **9000**: Default PHP-FPM port.

---

## License

This Docker image is licensed under the [MIT License](LICENSE).

---

For issues or contributions, feel free to open an issue or submit a pull request.

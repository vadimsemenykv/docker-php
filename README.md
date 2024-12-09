
# PHP 7.1 Docker Image

This repository provides a Docker image with PHP 7.1 configured for development and production environments. The image includes support for various PHP extensions and tools, ensuring compatibility and flexibility for a wide range of applications.

---

## Features

- **Base Image**: Based on `php:7.1-fpm`.
- **Included Extensions**: PDO (MySQL, PostgreSQL), GD, mcrypt, bcmath, memcached, redis, xdebug, aerospike, and more.
- **Configurable Build**: Supports optional extensions via build arguments.
- **Customizable**: Predefined configuration files for xdebug, opcache, aerospike, and more.

---

## Getting Started

### Prerequisites

- Docker installed on your machine.
- Basic knowledge of Docker commands to build and run the container.

---

### Build the Image

To build the Docker image, run:

```bash
docker build -t php-7.1-custom .
```

#### Build Arguments

Customize the image during the build process using the following optional arguments:

| Argument            | Description                      | Default Value |
|---------------------|----------------------------------|---------------|
| `INSTALL_SOAP`      | Enable SOAP extension           | `false`       |
| `INSTALL_XDEBUG`    | Enable xDebug extension         | `false`       |
| `INSTALL_PHPREDIS`  | Enable Redis extension          | `false`       |
| `INSTALL_BCMATH`    | Enable BCMath extension         | `false`       |
| `INSTALL_MEMCACHED` | Enable Memcached extension      | `false`       |
| `INSTALL_AEROSPIKE` | Enable Aerospike extension      | `false`       |
| `INSTALL_OPCACHE`   | Enable Opcache extension        | `false`       |
| `INSTALL_MYSQLI`    | Enable MySQLi extension         | `false`       |
| `INSTALL_INTL`      | Enable Intl extension           | `false`       |

Example:

```bash
docker build --build-arg INSTALL_XDEBUG=true --build-arg INSTALL_SOAP=true -t php-7.1-custom .
```

---

### Run the Container

To run the container, use:

```bash
docker run -d -p 9000:9000 -v $(pwd):/var/www php-7.1-custom
```

---

## Configuration Files

The following configuration files are included and can be customized as needed:

- **PHP Configuration**: `configs/php.ini`
- **PHP-FPM Pool Configuration**: `configs/php-fpm.pool.conf`
- **xDebug Configuration**: `configs/xdebug.ini`
- **Opcache Configuration**: `configs/opcache.ini`
- **Aerospike Configuration**: `configs/aerospike.ini`

Mount these files into the container to override the defaults.

---

## Extensions

### Included by Default

- **GD**: Image manipulation.
- **PDO**: Database support for MySQL and PostgreSQL.
- **Mcrypt**: Encryption support.

### Optional (Enabled via Build Arguments)

- **SOAP**: SOAP-based web services.
- **xDebug**: Debugging and profiling.
- **Redis**: Redis integration.
- **BCMath**: Arbitrary precision mathematics.
- **Memcached**: Caching layer.
- **Aerospike**: Aerospike database support.
- **Opcache**: PHP performance optimization.
- **MySQLi**: Extended MySQL support.
- **Intl**: Internationalization support.

---

## Environment Variables

- `INSTALL_AEROSPIKE`: Set to `true` to enable Aerospike extension.

---

## Exposed Ports

- **9000**: Default PHP-FPM port.

---

## License

This Docker image is licensed under the [MIT License](LICENSE).

---

For issues or contributions, feel free to open an issue or submit a pull request.

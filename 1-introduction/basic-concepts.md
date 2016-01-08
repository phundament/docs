Basic concepts
==============

Layers
------

### PHP Application source-code

The topmost layer of the stack is the application source-code in `/src`. The PHP application is build with
Yii 2.0 Framework.

- [View application ENV variables](https://github.com/phundament/app/tree/master/.env-dist)
- [View application source](https://github.com/phundament/app/tree/master/src)
- [View application tests](https://github.com/phundament/app/tree/master/tests)

### Application framework and composer packages

The building blocks of the application.

 - [View application packages](https://github.com/phundament/app/blob/master/composer.json)

### Containers

The application along with other services are run in containers, usually you have one container per service, but
you can also scale PHP-FPM with a haproxy or run multiple workers off a CLI container.

- [View application Dockerfile](https://github.com/phundament/app/blob/master/Dockerfile)
- [View Phundament Docker images](https://hub.docker.com/u/phundament/)
- [View Phundament Docker images source-code](https://github.com/phundament/docker-images)

### Services

Services are defined in `docker-compose.yml` they describe the stack components, such as the PHP application, databases,
caches or testing containers.

- [View application service definition](https://github.com/phundament/app/blob/master/docker-compose.yml)

### Stacks

Stacks and their service definitions can have different flavours. You may need slightly different setups in testing, staging
and production environment. Phundament features as `yaml-converter-command`, which can create stack files from templates.
  
- [View project stacks](https://github.com/phundament/app/tree/master/build/compose)

### Docker

Docker is the container-engine in which all services and tools are run, this ensures a maximum of portability across
 platforms and environments.

- [View build tools](https://github.com/phundament/app/tree/master/build)

Directories & files
-------------------

Build support

```
Makefile            build and Docker stack control-targets
build/              files for Docker build tasks
```

Docker & docker-compose

```
docker-compose.yml  docker container setup
Dockerfile          docker image build information
```

Application source

```
.env                environment config
src/                application source-code
yii                 application CLI
```

Application packages

```
composer.json       application packages
composer.lock       application packages (locked revisions)
vendor/             dependent 3rd-party packages
```

Application runtime (non-persistent data)

```
runtime/            files generated during runtime
```

Testing

```
codeception.yml     test-suite configuration
tests/              various tests for objects that are common among applications
```

### src/

```
assets/             application assets such as JavaScript and CSS
config/       application configuration
controllers/        web-controller classes
commands/           console controller classes
models/             application model classes
modules/            application modules (eg. admin)
migrations/         database migrations
views/              view files for the application
web/                document root with entry-script
```

Extension Testing

"Potemkin"-Testing
------------------

> **Heads up!** This section is under development.

*TODO: see giiant tests*



"Acception"-Testing
-------------------



PHP library testing
===================

You can use Phundament base images `phundament/php-one` for running unit tests of composer packages.

First you need to create a `docker-compose.yml` file containing the test configuration.

A basic example looks like the following:

```
test:
  image: phundament/php-one:5.6-fpm-4.6.0-beta1
  command: sh -c 'composer install && bin/phpunit'
  volumes:
    - ./:/app
```

We will use the Phundament image as a CLI container with composer pre-installed.

By mounting the working directory into `/app`, which is the `WORKING_DIR` inside the container, we can use
commands like `composer` or `bin/phpunit` directly.

To run the default command from the `test` container, run

    docker-compose run test
    
And a composer installation and unit tests will be run inside the container.    

Examples
--------

- [stage1/php-docker](https://github.com/schmunk42/docker-php/commit/63ab86ac7d0eab5d5d243f4122e4a883de724425)
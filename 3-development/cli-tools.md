CLI tools
=========

### On your host-system

- `git`
- `docker`
- `docker-compose`
- `make` (optional)

> :information_source: Several other Linux command line tools are available.

You can create a container bash with

    make bash

or    
    
    docker-compose run php bash

or

    docker exec -it app_php_1 bash

### Inside the PHP container

- composer
- yii
- codecept
- linkchecker

> If a line in the documentation is prefixed with `$` it means that this command needs to be run inside the container.

    $ composer update
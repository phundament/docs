Working with Databases
======================

MySQL
-----

By default phd comes with a MySQL compatible database on a Docker image.
With Docker you have the freedom to choose from several available pre-built images, such as `mysql`, 
`tutum/mariadb` or `percona`.

You can view information about the database container in your stack by running `docker-compose ps`.

To connect to your database you can either use a desktop client, such as `MySQL workbench` or `Sequel Pro` (OS X).
Enter your docker-host IP and the mapped host-port of the database container into the connection details.

Or you can add an web-based management interface like `clue/adminer` or `phpmyadmin/phpmyadmin`. Usually these
containers can be linked to the database server.

> Note! Links  will become deprecated in a future version of Docker. 


Using a PostgreSQL database
---------------------------

Install PHP extension in `Dockerfile`

    RUN apt-get update \
     && apt-get install -y \
            libpq5 \
            libpq-dev \
            --no-install-recommends \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
     && docker-php-ext-install pdo_pgsql

Add container

    postgres:
      image: 'postgres'
      environment:
        POSTGRES_USER: pg
        POSTGRES_PASSWORD: dev123

Adjust PHP service

    php:
      build: .
      links:
        - 'postgres:DB'
      environment:
        - DATABASE_DSN_BASE=pgsql:host=db
        - DATABASE_DSN_DB=pg
        - DATABASE_USER=pg
        - DATABASE_PASSWORD=dev123

> Heads up! You might need to some manual setup steps.

    make bash

Run migrations and create an admin    
    
    $ yii migrate
    $ yii app/setup-admin-user

Working with Databases
======================

By default phd comes with a MySQL compatible database on a Docker image.
With Docker you have the freedom to choose from several available pre-built images, such as `mysql`, 
`tutum/mariadb` or `percona`.

You can view information about the database container in your stack by running `docker-compose ps`.

To connect to your database you can either use a desktop client, such as `MySQL workbench` or `Sequel Pro` (OS X).
Enter your docker-host IP and the mapped host-port of the database container into the connection details.

Or you can add an web-based management interface like `clue/adminer` or `phpmyadmin/phpmyadmin`. Usually these
containers can be linked to the database server.

> Note! Links  will become deprecated in a future version of Docker. 


 
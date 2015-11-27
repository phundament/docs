Requirements
============

 - `docker`
 - `docker-compose`

> Note: You can run Phundament also by installing it with [composer](http://getcomposer.org/doc/00-intro.md#installation-nix) or within a Vagrant VM. But we recommend Docker, since it provides a consistent environment from development to deployment.


Recommendations
---------------

- make


### Linux

See [Docker installation](https://docs.docker.com/installation/) documentation.

Install make, Docker & Compose
 
    apt-get install make
 
    curl -sSL https://get.docker.com/ | sh
    curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose



### OS X & Windows

Get the [Docker Toolbox](https://www.docker.com/docker-toolbox), which contains all tools required to setup a local Docker development environment.

> Note: You need to install `make` via *MacPorts*, *brew* or *Xcode*.

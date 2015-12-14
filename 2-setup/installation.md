Installation
============

> Note: You can run Phundament also by installing it with [composer](http://getcomposer.org/doc/00-intro.md#installation-nix) or within a Vagrant VM. But we recommend docker, since it provides a consistent environment

Clone the repository and go to the application directory

    git clone https://github.com/phundament/app

Create environment configuration file

    cd app
    cp .env-dist .env

> Phundament uses a `Makefile` to execute common tasks during development. 
> All `make` commands without a configuration target, are run on the default stack 
> without additional `docker-compose` parameters. Basically `make` targets are just shorthand commands.

For the first initial setup run

    make all

You can also chain single commands

    make up setup open
   
Or use configuration targets for compose stacks
   
    make TEST all
    
    make TEST run-tests




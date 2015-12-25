Installation
============

> Note: Examples in this guide are run in the dockerized setup. 
> You can run Phundament also  with [composer](http://getcomposer.org/doc/00-intro.md#installation-nix) 
> or within a Vagrant VM. 

Phundament uses `Makefile`s to execute common tasks during development. 
All `make` commands without a *configuration target*, like `TEST` or `STAGING` are run on the default stack 
without additional `docker-compose` parameters. 

Basically, `make` targets are just shorthands for lengthy Docker commands.

To see all available targets run

    make help

For the first initial setup run

    make all

You can also chain single commands

    make setup up open bash
   
Or use a configuration target, in example for managing an isolated test-stack
   
    make TEST bash

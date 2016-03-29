Installation
============

> Note: Examples in this guide are run in the dockerized setup. 
> You can run Phundament also  with [composer](../6-tutorials/installation-composer.md) 
> for example within a Vagrant VM. 

When starting a new project it is recommended to download a [packaged release](https://github.com/phundament/app/releases)
and create a fresh repository from it.

    cd myapp
    git init

> :bulb: It is recommended to create an initial commit from the unmodified template code, before making the first changes, see [tutorials](../6-tutorials/git-repository.md) for details.

## `make` application

Phundament uses `Makefile`s to execute common tasks during development, but you can also use standard *Docker* commands to control your stack.
See *phd* [README](https://github.com/phundament/app/blob/master/README.md) for some examples.

Basically, `make` targets are just shorthands for lengthy Docker commands.

For the first initial setup run

    make all

To see all available targets run

    make help

You can also chain single commands

    make setup up open bash
   
Or use a configuration target, in example for managing an isolated test-stack
   
    make TEST up setup bash

> All `make` commands without a *configuration target*, like `TEST` or `STAGING` are run on the default stack 
> without additional `docker-compose` parameters. 

You can find information in the [testing](../4-testing/testing.md) section.

> :bulb: To do a dry-run for a command you can use the `-n` option, eg. `make -n all`

See also [CLI tools](../3-development/cli-tools.md) the see which commands are available in the containers.

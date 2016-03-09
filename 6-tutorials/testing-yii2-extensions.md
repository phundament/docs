### Phundament "Potemkin"-testing

**Note! This is a concept/prototype.**

You can use *[Phundament 4](https://github.com/phundament/app)* in a docker-stack "wrapped around" the extension directory.

The basic concept is to start an application stack with `docker-compose` and "host-mount" the extension directly into `/vendor/name/extension`.

> You should be able to use this approach for any *Yii 2.0 Framework* extension. Note: You need to install the extension in the application. This is a current limitation. 

In `tests/` resides a `docker-compose.yml` file, which contains an full-featured `phundament/app` stack, with pre-installed a *Codeception* test-framework on the `appcli`-container.
There are suites for CLI, unit, function and acceptance testing right - ready to use, right out of the box.
 
The stack also contains *Selenium* containers for acceptance testing with screenshots - *Firefox* or *Chrome*.

Finally it creates a screenshot of that in `tests/_output`. 


Setup
-----

    docker-compose run phpfpm bash
   
    $ codecept bootstrap

    $ codecept run

Configuration
-------------


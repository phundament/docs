# Upgrading instructions

## Docker image

### phundament/php-one 4.5 :arrow_right: 4.6

#### Upgrade Codeception tester classes

Locate your **generated** tester classes in `/tests/codeception/...` and remove them.

Create an application bash

    make bash
    
Rebuild tester classes. (YII_ENV must be set to 'test')

    $ codecept build
    
Test the testers

    make build
    make TEST up setup bash

    $ codecept run
    
Commit your changes...        

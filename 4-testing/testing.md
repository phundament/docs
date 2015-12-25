Testing
=======



### With `make`

Or one-by-one via `Makefile` targets, make sure to build first, if you have made changes to `src`

    make build
    
Start the test stack    
    
    make TEST setup up 

Enter the `tester` container    
    
    make TEST bash

Run codeception directly *(container bash)*

    $ codecept run acceptance allow_fail

Or run the test suites from build scripts

    $ sh build/scripts/build.sh
    $ sh build/scripts/test.sh



Bootstrap Codeception
---------------------

    make bash
    
    cd src/extensions/$MODULE_ID
    
    codecept bootstrap src/extensions/$MODULE_ID
    
    codecept run -c src/extensions/$MODULE_ID
    
    
### Running test suites    


   make TEST app-run-tests OPTS='-c src/extensions/hrzg/resque-tests'

   
   
   make TEST app-setup APP_MIGRATION_LOOKUP='@ext/onebase/core/migrations/data'
   
   
### Functional vs. acceptance tests
   
Functional only basic tests, see codeception.com
   
Login, JavaScript, Cookies, Session, ... use acceptance tests.
   
`wait(1)`, `waitForElement(1)`   
   
   
Testing
=======

### Running in isolated Docker stacks

Creating and running a test environment can be a cumbersome task, since you have to take care about several specific tasks, like executing your tests in a separate database. Therefore the Phundament 4 Docker images contain pre-installed Yii 2.0 Framework codeception test-suites for unit-, functional- and acceptance-testing.

### Basic usage 
 
Before starting tests, it's recommended to build all images in the default development stack

    make docker-build

Next step is to get a clean stack selected and configured by using `TEST` target.  

    make TEST docker-kill docker-rm docker-up

Before the test-suites can be run, we need to setup the application, like during development setup, but also in the test-stack. 

    make TEST app-setup

Finally we can execute the tests.

    make TEST app-run-tests

### Advanced usage

To run specific tests you can use the `OPTS` environment variable

    make TEST app-run-tests OPTS='acceptance dev/MyCept --steps'

If you need to customize the codeception setup you can rebuild the tester classes with      

    make TEST app-build-tests

   
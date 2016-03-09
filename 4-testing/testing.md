Testing
=======

### Running in isolated Docker stacks

Creating and running a test environment can be a cumbersome task, like executing your tests in an isolated database. 

Therefore the Phundament 4 Docker images contain pre-installed Codeception binaries for running  Yii 2.0 Framework unit-, functional- and acceptance-test-suites.


### With `make`

Or one-by-one via `Makefile` targets, make sure to build your images first, if you have made changes to `src`.

    make build

> :information_source: It is possible to use host-volumes during local testing/debugging, but running containers without host-volumes is usually much closer to the final production setup.

Next step is to get a clean stack selected and configured by using `TEST` target.  

    make TEST clean
    
Before the test-suites can be run, we need to setup the application, like during development setup, but in the test-stack.
    
    make TEST setup up 

Enter the `tester` container    
    
    make TEST bash

Run codeception directly *(container bash)*

    $ codecept run acceptance allow_fail


### Advanced usage
    
Running test suites from a different location

     make TEST run-tests OPTS='-c src/extensions/hrzg/resque-tests'

With additional migrations
   
     make TEST setup APP_MIGRATION_LOOKUP='@ext/onebase/core/migrations/data'

To run specific tests you can use the `OPTS` environment variable

    make TEST run-tests OPTS='acceptance dev/MyCept --steps'



### Functional vs. acceptance tests
   
Due to limitations functional-testing should only be used for basic tests, see codeception.com
   
For Login, JavaScript, Cookies, Session, ... use acceptance tests. See commands `wait(1)`, `waitForElement(1)`.

   
### Codeception development and update commands

If you add a new module to a suite or after Codeception updates, you may need to update your Codeception classes

    make TEST bash
    
Re-build in container

    $ codecept build

Run tests from a custom location *(container-bash)*  

    $ codecept run -c src/extensions/<MODULE_ID>


### Grouping tests

See http://codeception.com/docs/07-AdvancedUsage#Groups

    // @group prod

allow failure    
    
    // @group allow_failure
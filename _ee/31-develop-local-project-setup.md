Project setup
=============

See also [Phundament](https://github.com/phundament/app/blob/master/README.md)

Clone your project

    git clone

Then run    
    
    make all
    
To run tests locally, first bring up the whole application stack with all containers

    make TEST docker-up

Setup application (mainly database setup)    
    
    make TEST app-setup

Run test-suites

    make TEST app-run-tests


> Hint: Trigger an initial build by using the settings panel in GitLab.
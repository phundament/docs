Continuous integration
======================

Example: Gitlab CI

- build
- test
- report
- deploy
- cleanup


Run the test suites from build scripts

    $ sh build/scripts/build.sh
    $ sh build/scripts/test.sh



#### Building the `:production` image

Adjust your `Dockerfile` and build `FROM phundament/app:production`.

    make build



Production
----------

- All images MUST BE tagged


Push to branch `foo` results in Docker image `appsrc:foo`.
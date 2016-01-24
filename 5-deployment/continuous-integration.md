Continuous integration
======================

Example: Gitlab CI

- build
- test
- report
- deploy
- cleanup

### Workflow

1. Clone application from local repository
2. Start application `make all`
3. Make changes in local development stack
4. (optional) Run tests in isolated local testing stack `make TEST up setup run-tests`
5. Commit (triggers CI)
6. CI builds images
7. CI starts isolated stacks (by setting custom `COMPOSE_PROJECT_NAME`s) from built images and performs setup operations
8. CI runs tests (also acceptance tests with Selenium containers)
9. CI creates reports
10. CI performs cleanup of isolated stacks
11. CI tags images and pushes them to a registry (if tests were successful)


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
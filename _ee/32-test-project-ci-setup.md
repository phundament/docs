# Project setup

## GitLab CI build setup

### Create job

**/!\ Manual workaround! set `GIT_SSL_NO_VERIFY` to `1**

### Inject data in project job script

If you need to modify data during the build job, but don't want to mark the file as modified.
An example use-case for this is injecting a API GitHub token to enable the container to download archives.

    export GITHUB_TOKEN=<INSERT_YOUR_TOKEN_HERE>
    sed -i "s|0000000000000000000000000000000000000000|${GITHUB_TOKEN}|" images/phundament/php/cli-dev/config.json 
    touch -acmt 1010101010 images/phundament/php/cli-dev/config.json

### Debugging

You can override ENV variables in the *Variables* section in GitLab.

## Caveats

Do not build base images for the projects you use on the same runner (node).


---


#### Type: Phundament 4

Refer to phundament.com how to create a project from the app template.

For automatic building and deployment the CI server needs access to the repositories containing the application source code.
GitLab Server
=============

CI nodes
========


    vagrant up
    
TODO: How to update SSH Login + Port `internal`?    
    
    # What ports, IPs and protocols we listen for
    Port 222
    
...    
    
    # after initial setup
    #machine.ssh.port = 13222    

reload with new SSH config

    vagrant reload --provision internal-30

Gitlab + Gitlab CI
------------------

### docker-composer stack

> TODO: add examples based on `cluster-stuttgart` repo.


Runners
-------

    docker -D pull schmunk42/gitlab-ci-runner

Mount required files for data, private repositories as host-volumes.

See also 

### Create new runners


    sh spawn-runners.sh ab8db74f9d3be2067b5a "60-tci 61-kohlhammer"


```
export RUNNER_NAME=runner-g
docker run --name $RUNNER_NAME -it --rm --privileged \
    -e CI_SERVER_URL=http://192.168.23.30:32080 \
    -e REGISTRATION_TOKEN=<CAN_BE_FOUND_HERE:https://ci.example.com/admin/runners> \
    -e CI_RUNNERS_COUNT=1 \
    -v /Volumes/git.hrzg.de/runners/$RUNNER_NAME/:/home/gitlab_ci_runner/data \
    -v /vagrant/docker-stacks/container-files/runner:/etc/ssl/certs/runner  \
    -v /vagrant/docker-stacks/container-files/certs/hrzg.de.crt:/etc/ssl/certs/ca-certificates.crt \
    -v /vagrant/docker-stacks/container-files/id_rsa-deploy-hrzg-de:/root/.ssh/id_rsa \
    -v /vagrant/docker-stacks/container-files/id_rsa-deploy-hrzg-de.pub:/root/.ssh/id_rsa.pub \
    -v /vagrant/docker-stacks/container-files/ssh_config:/root/.ssh_config \
    -v /vagrant/docker-stacks/container-files/known_hosts:/root/.ssh/known_hosts \
    -v `which docker`:/usr/bin/docker \
    -v `which docker-compose`:/usr/local/bin/docker-compose \
    -v /var/run/docker.sock:/var/run/docker.sock \
    schmunk42/gitlab-ci-runner
```    

### Restart runners

Beispiel

    docker start runner-test-e runner-xdb runner-test-b runner-shared-a runner-starrag runner-test-f
    
## Debug Runner

    ssh 192.168.23.33
    
Execute commands of the runner, see also `/home/gitlab_ci_runner`    

    docker exec -it runner-XX bash

Runner container:

    cd /home/gitlab_ci_runner/data/builds
    

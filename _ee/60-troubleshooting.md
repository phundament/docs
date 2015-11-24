Troubleshooting
===============

Docker
------


### General

#### Cleanup images

see https://github.com/chadoe/docker-cleanup-volumes

#### Login

Interactive login
    
    docker login tutum.co

Login docker CLI
    
    docker login --username=dmstr --password=$TUTUM_PASS --email=dmstr-tutum@h17n.de tutum.co

Login docker-compose 1.2.0
    
    docker login --username=dmstr --password=$TUTUM_PASS --email=dmstr-tutum@h17n.de https://tutum.co/v1

> Note! Check if Docker saves the credentials locally.


### Gitlab CI Server

#### General

In case of weird errors you have the following workaround options, which you should try from to bottom:

- Retry
- Run a clean-script from time to time.
- Use a different `compose-project` name for the `CI` config target.
- Clean project build folder via NAS
- Clean project build folder via SSH to runner host and `docker exec -it runner-x bash`
- Restart Docker daemon (`sudo service docker restart` and `docker start runner-a runner-b ...`
- Move the project to another runner
- Create a new runner
- Reboot the runner-host (don't forget to bring up the runners)
- Recreate the runner-host (**last resort**)


### boot2docker (local development)

#### Tutum login not working

Error: 

    FATA[0017] Error response from daemon: v1 ping attempt failed with error: Get https://registy.example.com/v1/_ping: dial tcp: lookup registy.example.com: no such host. If this private registry supports only HTTP or HTTPS with an unknown CA certificate, please add `--insecure-registry registy.example.com` to the daemon's arguments. In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag; simply place the CA certificate at /etc/docker/certs.d/registy.example.com/ca.crt 

Workaround: Add registry host to `/etc/hosts`

    boot2docker ssh "echo '54.85.213.230 tutum.co' | sudo tee -a /etc/hosts"
    boot2docker ssh "sudo /etc/init.d/docker restart"

> Heads up! On some Docker-hosts, the `--insecure-registry` flag is not working as expected.


#### Private registry certificates

    boot2docker ssh

Download private cert (docker >= 1.6)
    
    sudo mkdir -m 755 -p /etc/docker/certs.d/registry.hrzg.de
    curl -k https://git.hrzg.de/herzog/pub/raw/master/ssh/hrzg.de.crt > /etc/docker/certs.d/registry.hrzg.de/ca.crt

    sudo mkdir -m 755 -p /var/lib/boot2docker/certs
    curl http://curl.haxx.se/ca/cacert.pem > /var/lib/boot2docker/certs/ca.crt

Upddate daemon arguments

    EXTRA_ARGS="--insecure-registry registry.hrzg.de --insecure-registry https://registry.hrzg.de/v1/ --registry-mirror=http://192.168.23.30:5555 --dns 192.168.23.17 --dns 8.8.4.4"

Restart docker

    /etc/init.d/docker restart


### Docker fixes (on dockerhost(!)

	echo "54.165.225.71 tutum.co" | sudo tee -a /etc/hosts
	echo "nameserver 8.8.4.4" | sudo tee /etc/resolv.conf
	sudo /etc/init.d/docker restart

### SSH protocol error
  
  > fatal: protocol error: bad line length character: No s
  
Check SSH key and correct spelling.

> Todo: How to allow artifacts? ... cp to tmp and cp from tmp (EXPERIMENTAL!)




### Vagrant VMs 

#### Virtual machine stopped or aborted

Check `dmesg`, if you find message like

    [343535.486350] Out of memory: Kill process 18115 (VBoxHeadless) score 242 or sacrifice child
    
You may have overbooked the memory of the "bare-metal" host with VM instances.
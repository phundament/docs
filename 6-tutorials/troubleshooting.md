Troubleshooting
===============

For more frequently asked questions (FAQ) see [GitHub](https://github.com/phundament/app/issues) and [Stackoverflow](http://stackoverflow.com/questions/tagged/phundament)

Yii
---

#### Debug toolbar visible with `YII_DEBUG=0`

**Solution** Set `YII_ENV=dev` which is the variable responsible for the debug toolbar.

#### AssetManager warning

```
PHP Warning – yii\base\ErrorException

Cannot use a scalar value as an array
1. in /app/vendor/yiisoft/yii2/web/AssetManager.php
```
:warning:
**Fix** Check your application for missing asset files or configuration.

## composer

#### Slow or hanging updates

If you're experiencing slow updates, check what's going on in detail with

    composer -vvv update

#### Can't use `@dev` or `dev-master` packages

You need to use https://getcomposer.org/doc/articles/aliases.md, see also https://github.com/dmstr/yii2-cms-metapackage/issues/1




Docker
------


#### Port is already allocated

    ERROR: Cannot start container 88b754d7e46aca58961ef0a049216f0e7331e35ba905d84fab01016a4797a779: failed to create endpoint appdev_mariadb_1 on network bridge: Bind for 0.0.0.0:43306 failed: port is already allocated

Change your port mapping.

#### Can't push to private registry

See also [issue on GitHub]()

**Solution** Add the nameserver on your `boot2docker` vm 

```
echo "nameserver 8.8.8.8" > /etc/resolv.conf && sudo /etc/init.d/docker restart
```

#### Show environment variables (in container)

    env | sort


#### `YII_ENV=dev` and `phundament/app:production` image

In most cases you won't be able to start images built `FROM phundament/app:production` image, if you set `YII_ENV=dev`, since development packages are missing on that image. It is also not recommended to use a production image in development mode.

#### VM harddisk out of space

See https://github.com/chadoe/docker-cleanup-volumes

    docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes


#### Service 'php' failed to build

    Pulling repository docker.io/phundament/php-one
    ERROR: Service 'php' failed to build: Network timed out while trying to connect to https://index.docker.io/v1/repositories/phundament/php-one/images. You may want to check your internet connection or if you are behind a proxy.
    make: *** [build] Error 1

#### MySQL connection takes more than 5 seconds

Check your DNS settings, restart VM with `docker-machine`.


#### Docker daemon does not restart (>=1.9)

Error description

    docker@dev5:~$ tail -f /var/log/docker.log 
    
    [...]
    
    time="2016-02-03T09:18:59.567541148Z" level=fatal msg="Error starting daemon: Error initializing network controller: could not delete the default bridge network: network bridge has active endpoints" 

Remove stale network files    
    
    docker@dev5:~$ sudo rm -rf /var/lib/docker/network/files
    docker@dev5:~$ sudo /etc/init.d/docker restart
    Need TLS certs for dev5,127.0.0.1,10.0.2.15,192.168.99.100
    -------------------
    docker@dev5:~$ docker ps


#### Cleanup volumes

see https://github.com/chadoe/docker-cleanup-volumes 

#### Cleanup images and containers

```
docker run \
	-it \
	-v /var/run/docker.sock:/var/run/docker.sock \
	yelp/docker-custodian \
		dcgc --max-image-age=30d --max-container-age=1d --dry-run
```

#### Login

Interactive login
    
    docker login tutum.co

Login docker CLI
    
    docker login --username=dmstr --password=$TUTUM_PASS --email=dmstr-tutum@h17n.de tutum.co

Login docker-compose 1.2.0
    
    docker login --username=dmstr --password=$TUTUM_PASS --email=dmstr-tutum@h17n.de https://tutum.co/v1

> Note! Check if Docker saves the credentials locally.

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





## Gitlab CI Server

#### General

In case of weird errors you have the following workaround options, which you should try from to bottom:

- Retry
- Run a clean-script from time to time.
- Use a different `COMPOSE_PROJECT_NAME` name for the `CI` jobs.
- Clean project build folder via NAS
- Clean project build folder via SSH to runner host and `docker exec -it runner-x bash`
- Restart Docker daemon (`sudo service docker restart` and `docker start runner-a runner-b ...`
- Move the project to another runner
- Create a new runner
- Reboot the runner-host (runners should have `restart=always` policy)
- Recreate the runner-host (**last resort**)

#### Pushing

    $ bash build/scripts/deploy.sh
    Username: EOF
    
Build variables like `REGISTRY_USER` not set.



### SSH protocol error
  
  > fatal: protocol error: bad line length character: No s
  
Check SSH key and correct spelling.

> Todo: How to allow artifacts? ... cp to tmp and cp from tmp (EXPERIMENTAL!)



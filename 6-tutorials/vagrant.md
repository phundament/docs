

You can modify the above config examples easily for VMWare, Parallels, HyperV, RedHat, Amazon AWS, DigitalOcean, Rackspace and many more.


Troubleshooting
===============
## Vagrant

#### `vagrant up db`

```
Command: "docker" "ps" "-a" "-q" "--no-trunc"
```

Just run it one more time.

#### `vagrant up db` fails second time

```
Command: "docker" "run" "--name" "db" "-d" "-e" "MYSQL_ROOT_PASSWORD=secretroot" "-e" "MYSQL_USER=dev" "-e" "MYSQL_PASSWORD=dev-123" "-e" "MYSQL_DATABASE=myapp-vagrant" "-p" "3306:3306" "-v" "/var/lib/docker/docker_1424995498_65018:/vagrant" "mysql"

Stderr: Unable to find image 'mysql:latest' locally
Pulling repository mysql
time="2015-02-27T00:09:38Z" level="fatal" msg="Get https://index.docker.io/v1/repositories/library/mysql/images: dial tcp: lookup index.docker.io on 10.0.2.3:53: server misbehaving" 
```

Fix nameservers in `/etc/resolv.conf` in dockerhost VM.

#### `vagrant destroy web` fails with error message.
 
> TODO link to GitHub issue



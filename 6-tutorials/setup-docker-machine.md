### Docker Machine

Machine lets you create Docker hosts on your computer, on cloud providers, and inside your own data center. It creates servers, installs Docker on them, then configures the Docker client to talk to them.

Once your Docker host has been created, it then has a number of commands for managing them:

- Starting, stopping, restarting
- Upgrading Docker
- Configuring the Docker client to talk to your host

Usage / Installation see Docker Machine docs:   
[https://docs.docker.com/machine/]()  


#### Docker Machine "root" directory

``USER_HOME_DIRECTORY/.docker/machine`` 

#### Change Docker Machine VM's directory (optional: e.g. low disk space on main hdd / ssd)

1. `mv .docker /Volumes/Macintosh\ HD2/`
2. `mkdir .docker`
3. `cd .docker`
4. `ln -s /Volumes/Macintosh\ HD2/.docker/machine .`

#### Insecure Registry

1. `docker-machine ssh`
2. `sudo -s`
3. `echo "EXTRA_ARGS='--registry-mirror=http://192.168.23.30:5555 --dns 192.168.23.17 --dns 8.8.4.4 --insecure-registry registry.hrzg.de'" > /var/lib/boot2docker/profile`
4. `/etc/init.d/docker restart`

#### Create new machine and tell Docker to talk to that machine

1. `docker-machine create dev --driver virtualbox --virtualbox-memory "3096" --virtualbox-disk-size "60000" --virtualbox-cpu-count "2"`
2. `docker-machine ls`
3. `eval "$(docker-machine env dev1)"`
4. `docker ps`
5. `docker-machine env dev1`

### Subcommands

#### active

Get or set the active machine.

```
$ docker-machine ls
NAME      ACTIVE   DRIVER         STATE     URL
dev                virtualbox     Running   tcp://192.168.99.103:2376
staging   *        digitalocean   Running   tcp://104.236.50.118:2376
$ docker-machine active dev
$ docker-machine ls
NAME      ACTIVE   DRIVER         STATE     URL
dev       *        virtualbox     Running   tcp://192.168.99.103:2376
staging            digitalocean   Running   tcp://104.236.50.118:2376
```

#### create

Create a machine.

```
$ docker-machine create --driver virtualbox dev
INFO[0001] Downloading boot2docker.iso to /home/ehazlett/.docker/machine/cache/boot2docker.iso...
INFO[0000] Creating SSH key...
INFO[0000] Creating VirtualBox VM...
INFO[0007] Starting VirtualBox VM...
INFO[0007] Waiting for VM to start...
INFO[0038] "dev" has been created and is now the active machine.
INFO[0038] To point your Docker client at it, run this in your shell: eval "$(docker-machine env dev)"
```

#### config

Show the Docker client configuration for a machine.

```
$ docker-machine config dev
--tlsverify --tlscacert="/Users/ehazlett/.docker/machines/dev/ca.pem" --tlscert="/Users/ehazlett/.docker/machines/dev/cert.pem" --tlskey="/Users/ehazlett/.docker/machines/dev/key.pem" -H tcp://192.168.99.103:2376
```

#### env

Set environment variables to dictate that `docker` should run a command against
a particular machine.

`docker-machine env machinename` will print out `export` commands which can be
run in a subshell.  Running `docker-machine env -u` will print
`unset` commands which reverse this effect.

```
$ env | grep DOCKER
$ eval "$(docker-machine env dev)"
$ env | grep DOCKER
DOCKER_HOST=tcp://192.168.99.101:2376
DOCKER_CERT_PATH=/Users/nathanleclaire/.docker/machines/.client
DOCKER_TLS_VERIFY=1
$ # If you run a docker command, now it will run against that host.
$ eval "$(docker-machine env -u)"
$ env | grep DOCKER
$ # The environment variables have been unset.
```

#### inspect

Inspect information about a machine.

```
$ docker-machine inspect dev
{
    "DriverName": "virtualbox",
    "Driver": {
        "MachineName": "docker-host-128be8d287b2028316c0ad5714b90bcfc11f998056f2f790f7c1f43f3d1e6eda",
        "SSHPort": 55834,
        "Memory": 1024,
        "DiskSize": 20000,
        "Boot2DockerURL": ""
    }
}
```

#### help

Show help text.

#### ip

Get the IP address of one or more machines.

```
$ docker-machine ip
192.168.99.104
$ docker-machine ip dev
192.168.99.104
$ docker-machine ip dev dev2
192.168.99.104
192.168.99.105
```

#### kill

Kill (abruptly force stop) a machine.

```
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376
$ docker-machine kill dev
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```

#### ls

List machines.

```
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev             virtualbox   Stopped
foo0            virtualbox   Running   tcp://192.168.99.105:2376
foo1            virtualbox   Running   tcp://192.168.99.106:2376
foo2            virtualbox   Running   tcp://192.168.99.107:2376
foo3            virtualbox   Running   tcp://192.168.99.108:2376
foo4   *        virtualbox   Running   tcp://192.168.99.109:2376
```

#### regenerate-certs

Regenerate TLS certificates and update the machine with new certs.

```
$ docker-machine regenerate-certs
Regenerate TLS machine certs?  Warning: this is irreversible. (y/n): y
INFO[0013] Regenerating TLS certificates
```

#### restart

Restart a machine.  Oftentimes this is equivalent to
`docker-machine stop; machine start`.

```
$ docker-machine restart
INFO[0005] Waiting for VM to start...
```

#### rm

Remove a machine.  This will remove the local reference as well as delete it
on the cloud provider or virtualization management platform.

```
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
foo0            virtualbox   Running   tcp://192.168.99.105:2376
foo1            virtualbox   Running   tcp://192.168.99.106:2376
$ docker-machine rm foo1
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
foo0            virtualbox   Running   tcp://192.168.99.105:2376
```

#### ssh

Log into or run a command on a machine using SSH.

To login, just run `docker-machine ssh machinename`:

```
$ docker-machine ssh dev
                        ##        .
                  ## ## ##       ==
               ## ## ## ##      ===
           /""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
           \______ o          __/
             \    \        __/
              \____\______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
Boot2Docker version 1.4.0, build master : 69cf398 - Fri Dec 12 01:39:42 UTC 2014
docker@boot2docker:~$ ls /
Users/   dev/     home/    lib/     mnt/     proc/    run/     sys/     usr/
bin/     etc/     init     linuxrc  opt/     root/    sbin/    tmp      var/
```

You can also specify commands to run remotely by appending them directly to the
`docker-machine ssh` command, much like the regular `ssh` program works:

```
$ docker-machine ssh dev free
             total         used         free       shared      buffers
Mem:       1023556       183136       840420            0        30920
-/+ buffers:             152216       871340
Swap:      1212036            0      1212036
```

If the command you are appending has flags, e.g. `df -h`, you can use the flag
parsing terminator (`--`) to avoid confusing the `docker-machine` client, which
will otherwise interpret them as flags you intended to pass to it:

```
$ docker-machine ssh dev -- df -h
Filesystem                Size      Used Available Use% Mounted on
rootfs                  899.6M     85.9M    813.7M  10% /
tmpfs                   899.6M     85.9M    813.7M  10% /
tmpfs                   499.8M         0    499.8M   0% /dev/shm
/dev/sda1                18.2G     58.2M     17.2G   0% /mnt/sda1
cgroup                  499.8M         0    499.8M   0% /sys/fs/cgroup
/dev/sda1                18.2G     58.2M     17.2G   0%
/mnt/sda1/var/lib/docker/aufs
```

#### start

Gracefully start a machine.

```
$ docker-machine restart
INFO[0005] Waiting for VM to start...
```

#### stop

Gracefully stop a machine.

```
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Running   tcp://192.168.99.104:2376
$ docker-machine stop dev
$ docker-machine ls
NAME   ACTIVE   DRIVER       STATE     URL
dev    *        virtualbox   Stopped
```

#### upgrade

Upgrade a machine to the latest version of Docker.  If the machine uses Ubuntu
as the underlying operating system, it will upgrade the package `lxc-docker`
(our recommended install method).  If the machine uses boot2docker, this command
will download the latest boot2docker ISO and replace the machine's existing ISO
with the latest.

```
$ docker-machine upgrade dev
INFO[0000] Stopping machine to do the upgrade...
INFO[0005] Upgrading machine dev...
INFO[0006] Downloading latest boot2docker release to /tmp/store/cache/boot2docker.iso...
INFO[0008] Starting machine back up...
INFO[0008] Waiting for VM to start...
```

> **Note**: If you are using a custom boot2docker ISO specified using
> `--virtualbox-boot2docker-url` or an equivalent flag, running an upgrade on
> that machine will completely replace the specified ISO with the latest
> "vanilla" boot2docker ISO available.

#### url

Get the URL of a host

```
$ docker-machine url
tcp://192.168.99.109:2376
```
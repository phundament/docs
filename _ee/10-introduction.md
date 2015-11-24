Installation
============


*Enterprise Edition*

> This documentation describes the exteneded development, testing and deployment process with Phundament 4.

**Phundament EE is a dockerized toolset for rapid prototyping, developing, testing, building and deploying high-quality web and desktop applications.**

It features a scalable continuous integration cluster for Docker stacks, built upon open-source software including Vagrant, Docker, GitLab and make.

Its goal is to provide building, testing, pushing and deploying of Docker images defined in `docker-compose` YAML files -
 which we call stacks.

Includes examples how to "git-push-to-deploy-docker-stack" on a Docker cloud platform, like Tutum.


Developer Setup
---------------

### Requirements

- docker
- [docker-compose](https://github.com/docker/compose/releases) >= 1.2.0
- doma - Makefile collection

### Recommendations

- VNC Viewer
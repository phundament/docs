About
=====

[![Build Status](https://travis-ci.org/phundament/app.svg?branch=master)](https://travis-ci.org/phundament/app)
[![Total Downloads](https://poser.pugx.org/phundament/app/downloads.png)](https://packagist.org/packages/phundament/app)
[![Latest Stable Version](https://poser.pugx.org/phundament/app/v/stable.png)](https://packagist.org/packages/phundament/app)
[![Stories in Ready](https://badge.waffle.io/phundament/app.png?label=ready&title=Ready)](https://waffle.io/phundament/app)


Phundament is a Web Application Foundation built upon Docker, PHP and Yii Framework 2.0 and further tools, providing a consistent environment for rapidly developing web
applications - from development to deployment.


It is a dockerized toolset for rapid prototyping, developing, testing, building and deploying high-quality web applications.


It features continuous integration support, built upon open-source software, using as much native tools as possible.

Its goal is to provide a complete build, test and deployment environment for dockerized applications, defined in `docker-compose` YAML files - which we call stacks.




### Design goals

The goal of Phundament is to provide a rock-solid base for integrating the best tools and plugins for web-application development, 
while not creating a new framework or [another competing standard](http://xkcd.com/927/). 

Instead, existing tools are pre-configured in a clean and easy way and built on Docker images to ensure 100% compatibility across different platforms.

Compared to the standard Yii 2.0 application templates, Phundament introduces a configuration based on *environment variables*,
which gives you a maximum level of control over your application setup. It follows the [12factor specifications](http://12factor.net) on a very slim codebase.



Branches
--------

The Phundament repository contains the following main branches:

- master (development, unstable)
- 4.0 (alpha, beta, RC, stable releases)
- 3.0 (alpha, beta, RC, stable releases)


Special thanks
--------------

...go out to qiangxue, samdark, cebe, the yii core-devs, motin, mikehaertl, tonydspaniard, crisu83, thyseus, quexer69, marc7000 and disco-tex77 for their work, feedback and input.


Developed by
------------

[diemeisterei GmbH](http://diemeisterei.de)  
Immenhofer Straße 21  
D-70180 Stuttgart

Germany

- Core developer: Tobias Munk (schmunk42)
- [Contributors](https://github.com/phundament/app/graphs/contributors)

---

Continue to [Installation](../2-setup/installation.md)

Frontend
========

Let's get your hands on your newly created application.


Frontend Assets
---------------

The asset package in the application is prepared for customization of *Bootstap 3* with LESS files, but you can use any CSS-Framework you like in the application frontend.

The phd Docker images, come with a build in `lessc` binary to create the CSS files by the asset command or on-the-fly.

See also [Yii 2.0 Assets](http://www.yiiframework.com/doc-2.0/guide-structure-assets.html).


Views & Controllers
-------------------

You application views are located in `/views/site`. They are basically old-school PHP files which get their data
prepared in controller actions.

See also [Yii 2.0 Views](http://www.yiiframework.com/doc-2.0/guide-structure-views.html).


Module: Prototype
--------

This module has very limited features and has been mainly developed to create tiny static sites. It basically allows
you to add HTML and LESS files to your site. 

### LESS

- go to `/prototype/less`
- create key `main`
 - add example LESS content
- save
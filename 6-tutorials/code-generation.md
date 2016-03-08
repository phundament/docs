Code-generation
===============

Backend prototype/CRUD module
-----------------------

Phundament allows you to use you custom designed database schema as the base for CRUD admin interfaces.
To add a new module to your application backend create a `prototype` module with Phundament and Yii's built-in tools

> If you would like to create an extension module in a composer package, please start by 
> [creating an extension](44-extension-development.md) first.
> push it to your repo and install it with `composer require --prefer-source name/package`. 
> Afterwards generate your code directly into `vendor/name/package` and use this repository for development.

### Enter the application container

For debugging and multiple one-off commands, you can enter the CLI container with

    docker-compose run --rm php bash

### Generate module code

First, create the module with

    yii gii/giiant-module \
        --moduleID=prototype \
        --moduleClass=app\\modules\\prototype\\Module

and add it to your application config or `src/config/local.php`

    'modules' => [
        'prototype' => [
            'class'  => 'app\modules\prototype\Module',
            'layout' => '@admin-views/layouts/main',
        ],
    ]

### Create migrations

	$ yii migrate/create init --migrationPath=@app/modules/prototype/migrations

Add migration to application params

    'params' => [
        'yii.migrations' => [
            [...],
            '@app/modules/prototype/migrations'
        ],
    ],

And run the migrations
    
    $ yii migrate


### Generate CRUDs with giiant 

Create the backend CRUDs with gii and Giiant

    yii giiant-batch \
      --interactive=0 \
      --overwrite=1 \
      --tablePrefix=app_ \
      --modelDb=db \
      --modelNamespace=app\\modules\\prototype\\models \
      --modelQueryNamespace=app\\modules\\prototype\\models\\query \
      --crudAccessFilter=1 \
      --crudControllerNamespace=app\\modules\\prototype\\controllers \
      --crudSearchModelNamespace=app\\modules\\prototype\\models\\search \
      --crudViewPath=@app/modules/prototype/views \
      --crudPathPrefix= \
      --tables=app_view,app_less

See also [Giiant documentation](https://github.com/schmunk42/yii2-giiant/blob/master/README.md).

Have also a look at [guidelines for good schema design](http://www.yiiframework.com/wiki/227/guidelines-for-good-schema-design/)
even if it was written for Yii 1 it is still valid today. 

Login to the application backend and go to the prototype module.

### Create widget for view contents

See `modules/prototype/widgets/ViewWidget.php`

### Create asset bundle for LESS from the database

See `modules/prototype/assets/PrototypeAsset.php`


### Create additional controllers

    yii gii/controller --controllerClass=modules\\frontend\\controllers\\MyController --viewPath=@modules/frontend/views/my


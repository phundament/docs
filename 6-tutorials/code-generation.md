Code-generation
===============

Backend CMS/CRUD module
-----------------------

Phundament allows you to use you custom designed database schema as the base for CRUD admin interfaces.
To add a new module to your application backend create a `cms` module with Phundament and Yii's built-in tools

> If you would like to create an extension module in a composer package, please start by 
> [creating an extension](44-extension-development.md) first.
> push it to your repo and install it with `composer require --prefer-source name/package`. 
> Afterwards generate your code directly into `vendor/name/package` and use this repository for development.

### Enter the application container

For debugging and multiple one-off commands, you can enter the CLI container with

    make bash

### Generate module code

First, create the module with

    yii gii/giiant-module \
        --moduleID=cms \
        --moduleClass=app\\modules\\cms\\Module

and add it to your application config or `src/config/local.php`

    'modules' => [
        'cms' => [
            'class'  => 'app\modules\cms\Module',
            'layout' => '@admin-views/layouts/main',
        ],
    ]

### Create migrations

	yii migrate/create init --migrationPath=@app/modules/cms/migrations

Add migration to application params

    'params' => [
        'yii.migrations' => [
            [...],
            '@app/modules/cms/migrations'
        ],
    ],

And run the migrations
    
    yii migrate


### Generate CRUDs with giiant 

Create the backend CRUDs with gii and Giiant

    yii giiant-batch \
      --interactive=0 \
      --overwrite=1 \
      --tablePrefix=app_ \
      --modelDb=db \
      --modelNamespace=app\\modules\\cms\\models \
      --modelQueryNamespace=app\\modules\\cms\\models\\query \
      --crudAccessFilter=1 \
      --crudControllerNamespace=app\\modules\\cms\\controllers \
      --crudSearchModelNamespace=app\\modules\\cms\\models\\search \
      --crudViewPath=@app/modules/cms/views \
      --crudPathPrefix= \
      --tables=app_html,app_less

See [Giiant documentation](https://github.com/schmunk42/yii2-giiant/blob/master/README.md) for an [example with Sakila demo database](https://github.com/schmunk42/yii2-giiant/blob/master/docs/generate-sakila-backend.md).

Have also a look at [guidelines for good schema design](http://www.yiiframework.com/wiki/227/guidelines-for-good-schema-design/)
even if it was written for Yii 1 it is still valid today. 

Login to the application backend and go to the CMS module.

### Create widget for HTML contents

See `modules/cms/widgets/HtmlWidget.php`

### Create asset bundle for LESS from the database

See `modules/cms/assets/DbAsset.php`
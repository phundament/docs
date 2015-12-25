Code-generation
===============

Backend CMS/CRUD module
-----------------------

Phundament allows you to use you custom designed database schema as the base for CRUD admin interfaces.
To kickstart you application backend create a new `crud` module with Yii's built-in tools

> If you would like to create an extension module in a composer package, please start by [creating an extension](44-extension-development.md) first
> push it to your repo and install it with `composer require --prefer-source name/package`. 
> Afterwards generate your code directly into `vendor/name/package` and use this repository for development.

### Enter the application container

For debugging and multiple one-off commands, you can enter the CLI container with

```
make bash
```

### Generate module code

First, create the module with

```
./yii gii/module \
    --moduleID=crud \
    --moduleClass=app\\modules\\crud\\Module
```

and add it to your application config or `src/config/local.php`

```
'modules'    => [
    'crud'    => [
        'class'  => 'app\modules\crud\Module',
        'layout' => '@admin-views/layouts/main',
    ],
]
```

### Create migrations

	yii migrate/create nanocms --migrationPath=modules/crud


### Generate CMS/CRUD models, controllers and views 


Create the backend CRUDs with gii and Giiant

```
./yii giiant-batch \
  --interactive=0 \
  --overwrite=1 \
  --modelDb=db \
  --modelNamespace=app\\modules\\crud\\models \
  --crudControllerNamespace=app\\modules\\crud\\controllers \
  --crudViewPath=@app/modules/crud/views \
  --crudPathPrefix= \
  --tables=app_html,app_less
```

See [Giiant documentation](https://github.com/schmunk42/yii2-giiant/blob/master/README.md) for an [example with Sakila demo database](https://github.com/schmunk42/yii2-giiant/blob/master/docs/generate-sakila-backend.md).

Have also a look at [guidelines for good schema design](http://www.yiiframework.com/wiki/227/guidelines-for-good-schema-design/)
even if it was written for Yii 1 it is still valid today. 


`SettingsAsset`
---------------

`app.assets` `useSettingsAsset` `1` 

`app.less` `main`

```
BODY {
 background: #ccc;
}
```

HTML-Documentation
------------------

Generate application documentation

```
make app-docs
```

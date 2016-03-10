Configuration
=============

## Introduction

Phundament uses an environment variables based configuration, see also [Dev/prod parity](http://12factor.net/dev-prod-parity) for more information about this topic.

## Environment settings

The following list displays configuration locations from highest to lowest priority, files are located in the application root folder.

1. `docker-compose.override.yml` (needs container restart)
2. `docker-compose.yml` (needs container restart)
3. `Dockerfile` (needs rebuilding)
4. `.env` (can be change at runtime during developemt)

> defaults for `.env`, see [`.env-dist`](https://github.com/phundament/app/blob/master/.env-dist)

ENV variable are immutable by default, so if a value is set in a `Dockerfile`, you can not
 overwrite it in your `.env` file, but in `docker-compose.yml`.

Only values in `.env` can be changed while the containers are running. If you change environment variables in 
`docker-compose.yml` you need to restart your containers.  

## Application settings

You find the config files for an application in `src/config`, those can also be changed at runtime:

 - [`config/main.php`](https://github.com/phundament/app/blob/master/config/main.php) - main application configuration
 - [`config/local.php`](https://github.com/phundament/app/blob/master/config/main.php) - application configuration settings for **local development only**

> :exclamation: An important difference between application and environment configuration is that
> ENV variables are immutable by default, but values in PHP arrays can be overwritten.

## Usage

### Basic settings 

Initial configuration adjustments should be made for the following values

 - `APP_NAME`
 - `APP_TITLE`
 - `APP_LANGUAGES`

> `.env-dist` can be adjusted and committed to reflect basic application settings, but we strongly
> recommend **not to add secrets** like passwords or tokens to the repository. 

During **local development** it is also recommended to enable debug settings in `.env`.

    YII_ENV=dev
    YII_DEBUG=1

> :bangbang: Make sure you **do not** have these settings enabled in production deployments.

### Database migrations

Lookup paths for migrations can be defined in application configuration, for details see [dmstr/yii2-migrate-command](https://github.com/dmstr/yii2-migrate-command/blob/master/README.md).

    'params'      => [
        'yii.migrations' => [
            '@yii/rbac/migrations',
            '@dektrium/user/migrations',
            '@vendor/lajax/yii2-translate-manager/migrations',
            '@bedezign/yii2/audit/migrations'
        ]
    ]

### Asset bundles

By default *phd* runs with the default bootstrap asset bundle from Yii.
To enable asset customization, edit `src/assets/AppAsset.php` and uncomment `'less/app.less',`.

There are three files included by default:

 - `app.less` main LESS file for application
 - `bootstrap.less` includes for bootstrap LESS files
 - `variables.less` bootstrap settings
 
Initial adjustment to the style settings of the application should be made in `variables.less`

> When developing assets you can set `APP_ASSET_FORCE_PUBLISH=1` in your local `.env` file, this improves detection of
changes for included files.
> Note: This feature is only available in the `AppAsset` bundle for the application.

For bundling assets for production usage, see tutorial about [asset compression](../6-tutorials/asset-compression.md).

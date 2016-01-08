Configuration
=============

## Environment & application

Phundament uses an environment variables based configuration, see also [Dev/prod parity](http://12factor.net/dev-prod-parity) for more information about this topic.

You find the config files for an application in `src/config`:

 - [`.env`](https://github.com/phundament/app/blob/master/.env-dist) - environment dependend configuration
 - [`config/main.php`](https://github.com/phundament/app/blob/master/config/main.php) - application configuration
 - [`config/local.php`](https://github.com/phundament/app/blob/master/config/main.php) - application configuration overrides

> `.env-dist` can be adjusted to reflect basic application settings, but we strongly
> recommend **not to add secrets** like passwords or tokens to the repository. 


### Hierachy

From highest to lowest priority. ENV variable are immutable by default, so if a value is set in a `Dockerfile`, you can not
 overwrite it in your `.env` file, but in `docker-compose.yml`.

1. `docker-compose.override.yml`
2. `docker-compose.yml`
3. `Dockerfile`
4. `.env`

Only values in `.env` can be changed while the containers are running. If you change environment variables in 
`docker-compose.yml` you need to restart your containers.  

> :exclamation: While in Yii configuration files the last value takes precedence, because they are based on PHP arrays and merged 
> together, ENV variables are immutable by default.


## Database migrations

Lookup paths for migrations can be defined in application configuration, for details see [dmstr/yii2-migrate-command](https://github.com/dmstr/yii2-migrate-command/blob/master/README.md).

    'params'      => [
        'yii.migrations' => [
            '@yii/rbac/migrations',
            '@dektrium/user/migrations',
            '@vendor/lajax/yii2-translate-manager/migrations',
            '@bedezign/yii2/audit/migrations'
        ]
    ]

Composer Installation
---------------------


### Requirements

- PHP 5.6
- PHP extensions for Yii2 Framework
- [composer](https://getcomposer.org/download/)
- [fxp/composer-asset-plugin](https://github.com/francoispluchino/composer-asset-plugin) **>=1.1.1**
- MySQL 5

### Database setup

Create a new database to store application information.

### Composer installation

You can install _phd 4_ using [composer](https://getcomposer.org/download/)...

    composer global require "fxp/composer-asset-plugin:1.1.*"
    composer create-project --stability=beta phundament/app myapp

### Application configuration with environment variables

The setup is based on `vlucas/dotenv`, which reads environment variables from the system or a local `.env` file. 
You can find background information about this topic in the [The Twelve Factor App](http://12factor.net/config) documentation.


Create and adjust your environment configuration, eg. add a database...

    cd myapp
    cp .env-dist .env
    edit .env
    
Run the application setup...
    
    ./yii migrate --interactive=0
    ./yii app/setup-admin-user --interactive=0
    
Open `http://path-to-app/web` or `http://path-to-app/web?r=admin` in your browser.

Afterwards you can access your phd application under `http://localhost/app/frontend/web` and `http://localhost/app/backend/web`.


### Virtual Hosts and nice URLs
 
If you choose `APP_PRETTY_URLS=1` in your `.env` file, activate the `web/.htaccess` if you are devleoping on your local machine.

```
cp web/.htaccess-dist web/.htaccess
```

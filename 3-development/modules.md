Modules
=======

Create a new module

    yii gii/module --moduleID=backend --moduleClass=pkg\\backend\\Module
    

Add config to module

    return [
        'components' => [
        ],
        'modules' => [
            'pkg' => [
                'class' => 'pkg\backend\Module',
            ]
        ]
    ];

Enable config in `.env`

    APP_CONFIG_FILE = /app/extensions/pkg/backend/config/main.php







CRUD generation 

-> override for fixed port-mapping
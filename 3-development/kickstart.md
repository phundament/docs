

Create a new module

    yii gii/module --moduleID=backend --moduleClass=shopeur\\backend\\Module
    

Add config to module

    return [
        'components' => [
        ],
        'modules' => [
            'shopeur' => [
                'class' => 'shopeur\backend\Module',
            ]
        ]
    ];

Enable config in `.env`

    APP_CONFIG_FILE = /app/extensions/shopeur/backend/config/main.php







CRUD generation 

-> override for fixed port-mapping
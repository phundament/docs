Bootstrap Codeception
---------------------

    make app-bash
    
    cd src/extensions/$MODULE_ID
    
    codecept bootstrap src/extensions/$MODULE_ID
    
    codecept run -c src/extensions/$MODULE_ID
    
    
### Running test suites    


   make TEST app-run-tests OPTS='-c src/extensions/hrzg/resque-tests'

   
   
   make TEST app-setup APP_MIGRATION_LOOKUP='@ext/onebase/core/migrations/data'
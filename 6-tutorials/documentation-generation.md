
HTML-Documentation
------------------

Generate application documentation

Enter container-bash

    docker-compose run --rm php bash

Run docs generator

    $ apidoc api src tmp/docs
    $ apidoc guide docs tmp/docs

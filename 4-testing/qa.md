QA
==

Run the following commands from a by starting the test-stack and running a `bash` in the tester container

    make TEST up setup
    make TEST bash


Linkchecker
-----------

    
    $ linkchecker http://WEB -r 3
        

Sitemap
    
    
    $ linkchecker http://WEB --threads 2 --file-output sitemap -o none
        
    
    
HTML-Validator
--------------

    validator:
      image: magnetikonline/html5validator
      entrypoint: ["java", "-jar", "/root/build/validator.nu/vnu.jar"]
      links:
        - nginx:WEB


Index page

    docker-compose run validator http://WEB/en

Login page

    docker-compose run validator http://WEB/en

From bash in validator

    $ java -jar validator.nu/vnu.jar


Lint
----
    
https://github.com/redcoolbeans/dockerlint
    
    docker run -it --rm -v "$PWD/$(DOCKERFILE)":/Dockerfile:ro redcoolbeans/dockerlint
    
https://github.com/projectatomic/dockerfile_lint
    
    docker run -it --rm --privileged -v `pwd`:/root/ projectatomic/dockerfile-lint dockerfile_lint -f $(DOCKERFILE)
    

Linkchecker
-----------

    
    docker run phundament/php linkchecker http://web -r 1 -F html/utf8/_output/report.html
        

Sitemap
    
    
    docker run phundament/php linkchecker http://web --threads 2 --file-output sitemap -o none
        
    
    
HTML-Validator
--------------

    validator:
      image: magnetikonline/html5validator
      entrypoint: ["java", "-jar", "/root/build/validator.nu/vnu.jar"]
      links:
        - appnginx:WEB

Index page

    make docker-run SERVICE=validator CMD=http://WEB/en

Login page

    make docker-run SERVICE=validator CMD=http://WEB/user/login


Lint
----
    
https://github.com/redcoolbeans/dockerlint
    
    docker run -it --rm -v "$PWD/$(DOCKERFILE)":/Dockerfile:ro redcoolbeans/dockerlint
    
https://github.com/projectatomic/dockerfile_lint
    
    docker run -it --rm --privileged -v `pwd`:/root/ projectatomic/dockerfile-lint dockerfile_lint -f $(DOCKERFILE)
    

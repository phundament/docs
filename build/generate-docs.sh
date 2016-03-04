#!/usr/bin/env bash

/app/vendor/bin/apidoc guide --interactive=0 --exclude=tmp,tests docs/ web/apidocs/
/app/vendor/bin/apidoc api   --interactive=0 --exclude=tmp,tests src,vendor/dmstr web/apidocs/
/app/vendor/bin/apidoc guide --interactive=0 --exclude=tmp,tests docs/ web/apidocs/
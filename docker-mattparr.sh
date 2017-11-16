#!/bin/bash

docker rm -f saml-mpar
docker run -d \
  --name saml-mpar \
  -p 8000:80 \
  -h demo-saml-app.example.com \
  --volume $PWD/certs/myservice.cert:/etc/httpd/conf.d/saml_sp.cert \
  --volume $PWD/certs/myservice.key:/etc/httpd/conf.d/saml_sp.key \
  --volume $PWD/certs/myservice.xml:/etc/httpd/conf.d/saml_sp.xml \
  -e BACKEND=http://localhost:8443 \
  -e SCHEMA=http \
  -e IDP_METADATA=https://www.testshib.org/metadata/testshib-providers.xml \
  -e SAML_MAP_EmailAddress=X-WEBAUTH-USER \
  mpar/saml-proxy

echo "http://demo-saml-app.example.com:8000/"
docker logs -f saml-mpar


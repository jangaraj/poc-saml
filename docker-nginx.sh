#!/bin/bash

docker rm -f saml-nginx
docker run -d \
  -p 80:80 \
  --name saml-nginx \
  --volume $PWD/certs:/certs \
  --volume $PWD/certs/myservice.cert:/etc/shibboleth/sp-cert.pem \
  --volume $PWD/certs/myservice.key:/etc/shibboleth/sp-key.pem \
  -e CLIENT_APP_HOSTNAME=demo-saml-app.example.com \
  -e CLIENT_APP_SCHEME=http \
  -e NGINX_PROXY_DESTINATION=http://172.17.42.1:8001 \
  matter/shibboleth-nginx

#    --volume $PWD/shibboleth2.xml:/etc/shibboleth/shibboleth2.xml \
#  --volume $PWD/certs/myservice.xml:/etc/httpd/conf.d/saml_sp.xml \
echo "http://demo-saml-app.example.com/"
echo "http://demo-saml-app.example.com/secure"
echo "http://demo-saml-app.example.com/Shibboleth.sso/Metadata"
echo "http://demo-saml-app.example.com/Shibboleth.sso/Session"

docker logs -f saml-nginx


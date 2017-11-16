#!/bin/bash

docker rm -f saml-digiapulssi
docker run -d \
  -p 80:80 \
  --name saml-digiapulssi \
  --volume $PWD/certs:/certs \
  --volume $PWD/shibboleth2.xml:/etc/shibboleth/shibboleth2.xml \
  digiapulssi/shibboleth-sp 

echo "http://demo-saml-app.example.com/"
echo "http://demo-saml-app.example.com/secure"
echo "http://demo-saml-app.example.com/Shibboleth.sso/Metadata"
echo "http://demo-saml-app.example.com/Shibboleth.sso/Session"

docker logs -f saml-digiapulssi


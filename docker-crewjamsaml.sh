#!/bin/bash

docker rm -f saml
docker run -d \
  --net host \
  --name saml \
  --volume $PWD/certs:/certs \
  jangaraj/crewjamsaml /saml 

echo "metadata: http://demo-saml-app.example.com:8000/saml/metadata + fix expiry date because https://github.com/crewjam/saml/issues/123"
echo "test: http://demo-saml-app.example.com:8000/hello"
docker logs -f saml


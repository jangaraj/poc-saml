#!/bin/bash

docker rm -f saml
docker run -d \
  --net host \
  --name saml \
  --volume $PWD/szechuansauce/config.yaml:/config.yaml \
  --volume $PWD/certs:/certs \
  jangaraj/szechuansauce /szechuansauce /config.yaml
docker logs -f saml


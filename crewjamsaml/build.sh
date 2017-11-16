#!/bin/bash

docker rm -f saml
docker rmi jangaraj/crewjamsaml
docker build -t jangaraj/crewjamsaml .


#!/bin/bash

if [ -d $(pwd)/artifactory ]
then
    echo "Directory artifactory exists."
else
    echo "Creating the directory artifactory."
    mkdir $(pwd)/artifactory
fi

docker build -t machine/artifactory .
docker run -d -p 8081:8081 --name server-artifactory -v $(pwd)/artifactory:/usr/local/artifactory -v $(pwd):/home/DevOps --restart always machine/artifactory
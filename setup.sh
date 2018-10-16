#!/bin/bash

if [ -d $(pwd)/artifactory ]
then
    echo "Directory artifactory exists."
else
    echo "Creating the directory artifactory."
    mkdir $(pwd)/artifactory
    chmod 777 -R $(pwd)/artifactory
fi

if [ -d $(pwd)/artifactory/data ]
then
    echo "Directory artifactory/data exists."
else
    echo "Creating the directory artifactory/data."
    mkdir $(pwd)/artifactory/data
    chmod 777 -R $(pwd)/artifactory/data
fi

if [ -d $(pwd)/artifactory/backup ]
then
    echo "Directory artifactory/backup exists."
else
    echo "Creating the directory artifactory/backup."
    mkdir $(pwd)/artifactory/backup
    chmod 777 -R $(pwd)/artifactory/backup
fi

if [ -d $(pwd)/artifactory/etc ]
then
    echo "Directory artifactory/etc exists."
else
    echo "Creating the directory artifactory/etc."
    mkdir $(pwd)/artifactory/etc
    chmod 777 -R $(pwd)/artifactory/etc
fi

if [ -d $(pwd)/artifactory/etc/plugins ]
then
    echo "Directory artifactory/etc/plugins exists."
else
    echo "Creating the directory artifactory/etc/plugins."
    mkdir $(pwd)/artifactory/etc/plugins
    chmod 777 -R $(pwd)/artifactory/etc/plugins
fi

docker build -t machine/artifactory .

docker run -d -p 8081:8081 --name server-artifactory -v $(pwd)/artifactory/data:/usr/local/artifactory/data \
-v $(pwd)/artifactory/backup:/usr/local/artifactory/backup \
-v $(pwd)/artifactory/etc/plugins:/usr/local/artifactory/etc/plugins \
-v $(pwd):/home/DevOps \
--restart always machine/artifactory
#!/bin/sh
#Checking whether username is passed to script
#A docker folder will be created inside this users home directory and container persistant data will be stored there
dockerUser=$1;
[ -z "$dockerUser" ] && echo "Please pass username...!!!" && exit 0 || echo "Will be deploying container for user $dockerUser";

#Deploying docker compose
echo "Deploying Jellyfin...";
DOCKER_USER=$dockerUser docker-compose down
DOCKER_USER=$dockerUser docker-compose up -d
echo "Jellyfin deployment successfull...!!!";
exit 0
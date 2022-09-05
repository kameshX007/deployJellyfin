#!/bin/sh
#Checking whether username is passed to script
#A docker folder will be created inside this users home directory and container persistant data will be stored there
dockerUser=$1;
[ -z "$dockerUser" ] && echo "###Please pass username...!!!">>deployJellyfin.log && exit 0 || echo "Will be deploying container for user $dockerUser">>deployJellyfin.log;

#Deploying docker compose
echo "Deploying Jellyfin...">>deployJellyfin.log;
DOCKER_USER=$dockerUser PLEX_CLAIM=$plexClaim docker-compose down
DOCKER_USER=$dockerUser PLEX_CLAIM=$plexClaim docker-compose up -d
echo "Jellyfin deployment successfull...">>deployJellyfin.log;
exit 0

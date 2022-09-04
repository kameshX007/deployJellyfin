#!/bin/sh
#Checking whether username is passed to script
#A docker folder will be created inside this users home directory and container persistant data will be stored there
dockerUser=$1;
[ -z "$dockerUser" ] && echo "###Please pass username...!!!">>deployPlex.log && exit 0 || echo "Will be deploying container for user $dockerUser">>deployPlex.log;

#Checking whether plexClaim is passed to script
plexClaim=$3;
[ -z "$plexClaim" ] && echo "###Please pass plexClaim...!!!">>deployPlex.log && exit 0 || echo "Got the plexClaim successfully...">>deployPlex.log;

#installing docker-compose
apt install docker-compose -y;

#Deploying docker compose
echo "Deploying Plex...">>deployPlex.log;
DOCKER_USER=$dockerUser PLEX_CLAIM=$plexClaim docker-compose down
DOCKER_USER=$dockerUser PLEX_CLAIM=$plexClaim docker-compose up -d
echo "Plex deployment successfull...">>deployPlex.log;
exit 0
#!/bin/sh

# creates and runs emphemeral set of containers and attaches to the
# main service container which is assumed to be named "web"
# after you exit from the attached bash shell, the containers are deleted
# must be executed in project's root

#important, different project name causes a different set of ephemeral
#containers to be created so that your other local containers are not used
#and modified or deleted
export COMPOSE_PROJECT_NAME=$(basename `pwd`)"-dev"

docker-compose run -v $(pwd):/app -v /app/node_modules --rm --name $COMPOSE_PROJECT_NAME web bash

exit_code=$?

docker-compose down -v
exit $exit_code

#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
export DOCKER_REPO_SLUG=$DOCKER_USER/cicd-buzz
docker build -f Dockerfile -t $DOCKER_REPO_SLUG:$TAG .
docker push $DOCKER_REPO_SLUG
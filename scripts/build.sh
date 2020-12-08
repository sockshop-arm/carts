#!/usr/bin/env bash

set -ev

SCRIPT_DIR=$(dirname "$0")

DOCKER_CMD=docker

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven paperinik/rpi-maven install -DskipTests
cp $CODE_DIR/target/*.jar $CODE_DIR/docker/carts

$DOCKER_CMD build -t codelab/carts $CODE_DIR/$m;

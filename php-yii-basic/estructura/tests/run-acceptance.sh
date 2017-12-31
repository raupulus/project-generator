#!/bin/sh

matar_procesos()
{
    if fuser -n tcp 8080 > /dev/null 2>&1
    then
        echo "Matando los procesos en los puertos 8080 y 9515..."
        fuser -k -n tcp 8080
        fuser -k -n tcp 9515
    fi
}

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
ACTUAL=$PWD

if [ -f $DIR/acceptance.suite.yml ]
then
    matar_procesos
    if [ "$1" != "-d" ]
    then
        cd $DIR/..
        echo "Ejecutando chromedriver --url-base=/wd/hub ..."
        $DIR/chromedriver --url-base=/wd/hub > /dev/null 2>&1 &
        echo "Ejecutando ./yii serve ..."
        if [ "$1" = "-v" ]
        then
            ./yii serve &
        else
            ./yii serve > /dev/null 2>&1 &
        fi
        cd $ACTUAL
    fi
fi

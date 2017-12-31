#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
## @twitter    https://twitter.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################
## Crea las las bases de datos normal y de pruebas. Contempla si está
## desplegado en travis para usar en ese caso solo entorno de pruebas

if [[ "$1" = "travis" ]]; then
    psql -U postgres -c "CREATE DATABASE proyecto_test;"
    psql -U postgres -c "CREATE USER proyecto PASSWORD 'proyecto' SUPERUSER;"
else
    if [[ "$1" != 'test' ]]; then
        sudo -u postgres dropdb --if-exists proyecto
        sudo -u postgres dropdb --if-exists proyecto_test
        sudo -u postgres dropuser --if-exists proyecto
    fi

    sudo -u postgres psql -c "CREATE USER proyecto PASSWORD 'proyecto' SUPERUSER;"

    if [[ "$1" != 'test' ]]; then
        sudo -u postgres createdb -O proyecto proyecto
    fi

    sudo -u postgres createdb -O proyecto proyecto_test

    passDB="localhost:5432:*:proyecto:proyecto"
    pgpass="$HOME/.pgpass"

    if [[ ! -f "$pgpass" ]]; then
        touch "$pgpass"
        chmod 600 "$pgpass"
    fi

    if ! grep -qsF "$passDB" "$pgpass";then
        echo "$passDB" >> "$pgpass"
    fi
fi

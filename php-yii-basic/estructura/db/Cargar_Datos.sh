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
## Inyecta en las Bases de datos el script sql "datos.sql"

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

## Solo inyecta en la BD si entra en modo test
if [[ "$1" != 'test' ]]; then
    psql -h localhost -U proyecto proyecto < $DIR/datos.sql
fi

psql -h localhost -U proyecto proyecto_test < $DIR/datos.sql

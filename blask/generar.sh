#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2018 Raúl Caro Pastorino
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

############################
##     IMPORTACIONES      ##
############################

############################
##       CONSTANTES       ##
############################

############################
##       VARIABLES        ##
############################

############################
##       FUNCIONES        ##
############################
blask_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'python3' 'pip3'
    compruebaExisteProyecto
}

blask_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    generarEstructura "$WORKSCRIPT/blask/estructura"

    local dirActual=$PWD
    cd "$nombre" || exit 1
    pipenv run pip install m2r
    pipenv install -e .
    pipenv run pip install blask
    cd "$dirActual" || exit 1
}

blask_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    permisos
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_blask() {
    echo -e "$VE Generador de proyecto Blask$CL"
    blask_preconfiguraciones
    blask_instalacion
    blask_postconfiguraciones
}

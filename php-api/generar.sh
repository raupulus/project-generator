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
php_api_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    #compruebaExisteComando 'python3' 'pip3'
    compruebaExisteProyecto
}

php_api_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    generarEstructura "$WORKSCRIPT/php_api/estructura"

    local dirActual=$PWD
    cd "$nombre" || exit 1

    cd "$dirActual" || exit 1
}

php_api_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    permisos
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_api() {
    echo -e "$VE Generador de proyecto de$RO API RESTful$VE con$RO PHP$CL"
    php_api_preconfiguraciones
    php_api_instalacion
    php_api_postconfiguraciones
}

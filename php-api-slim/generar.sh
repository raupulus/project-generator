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
php_api_slim_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'composer' 'php'
    compruebaExisteProyecto
}

php_api_slim_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    #generarEstructura "$WORKSCRIPT/php-api-slim/estructura"
    #composer create-project fryntiz/api-slim-template --no-interaction $nombre
    composer create-project fryntiz/api-slim-template:dev-master --no-interaction $nombre
}

php_api_slim_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    local dirActual=$PWD
    cd "$nombre" || exit 1
    echo -e "$VE Asigando permisos$CL"
    make permisos
    cd "$dirActual" || exit 1

    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_api_slim() {
    echo -e "$VE Generador de proyecto de$RO API RESTful$VE con$RO PHP$VE y$RO Slim$CL"
    php_api_slim_preconfiguraciones
    php_api_slim_instalacion
    php_api_slim_postconfiguraciones
}

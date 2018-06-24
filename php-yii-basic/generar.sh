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

############################
##     IMPORTACIONES      ##
############################

############################
##       CONSTANTES       ##
############################

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
php_yii_basic_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'composer' 'php'
    compruebaExisteProyecto
}

php_yii_basic_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    #composer create-project --prefer-dist fryntiz/yii2-app-basic:dev-master "$nombre"
    composer create-project fryntiz/yii2-app-basic:dev-master --no-interaction $nombre
}

php_yii_basic_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    local dirActual=$PWD
    cd "$nombre" || exit 1
    echo -e "$VE Asigando permisos$CL"
    make permisos
    cd "$dirActual" || exit 1
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_yii_basic() {
    echo -e "$VE Generador de proyecto YII Básico$CL"

    php_yii_basic_preconfiguraciones
    php_yii_basic_instalacion
    php_yii_basic_postconfiguraciones

    ## Crear Base de Datos
    #generarBD

    ## Asigna permisos necesarios
    #permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

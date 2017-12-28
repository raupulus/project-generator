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
preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones$CL"
    composer create-project --no-install --no-scripts yiisoft/yii2-app-basic $nombre
}

instalacion() {
    echo -e "$VE Instalando$CL"
}

postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_yii_basic() {
    echo -e "$VE Generador de proyecto YII Básico$CL"

    ## Pide nombre para el directorio del proyecto
    nombreProyecto

    ## Comprueba si ya existe un proyecto
    compruebaExisteProyecto

    preconfiguraciones

    ## Generar estructura básica
    generarEstructura "$WORKSCRIPT/php-yii-basic/estructura"

    ## Crear Base de Datos
    generarBD

    instalacion
    postconfiguraciones

    ## Asigna permisos necesarios
    permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

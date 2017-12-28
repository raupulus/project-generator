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
    echo "a"
}

instalacion() {
    echo "a"
}

postconfiguraciones() {
    echo "a"
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

    ## Generar estructura básica
    generarEstructura "$WORKSCRIPT/php-yii-basic/estructura"

    ## Crear Base de Datos
    generarBD

    preconfiguraciones
    instalacion
    postconfiguraciones

    ## Asigna permisos necesarios
    permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

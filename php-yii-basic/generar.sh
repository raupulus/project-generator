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
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
}

instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    composer create-project --prefer-dist fryntiz/yii2-app-basic:dev-master "$nombre"
}

postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    local dirActual=$PWD
    cd "$nombre" || exit 1
    echo -e "$VE Asigando permisos$CL"
    make permisosWEB
    cd "$dirActual" || exit 1
}

###########################
##       EJECUCIÓN       ##
###########################
## Recibe el nombre del proyecto a crear y lo genera
generar_php_yii_basic() {
    echo -e "$VE Generador de proyecto YII Básico$CL"

    ## Comprueba si ya existe un proyecto
    compruebaExisteProyecto

    preconfiguraciones
    instalacion
    postconfiguraciones

    ## Crear Base de Datos
    #generarBD

    ## Asigna permisos necesarios
    #permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

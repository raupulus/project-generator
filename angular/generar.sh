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
##        VARIABLES       ##
############################

############################
##        FUNCIONES       ##
############################
angular_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
}

angular_instalacion() {
    if [[ ! -x '/usr/bin/ng' ]]; then
        echo -e "$RO No está instalado Angular desde npm$CL"
        exit 1
    fi

    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"

    ng new "$nombre"
}

angular_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    local dirActual=$PWD
    cd "$nombre" || exit 1
    ownerApache
    cd "$dirActual" || exit 1
}

###########################
##       EJECUCIÓN       ##
###########################
generar_angular() {
    echo -e "$VE Generador de proyecto en Angular$CL"

    ## Comprueba si ya existe un proyecto
    compruebaExisteProyecto

    angular_preconfiguraciones
    angular_instalacion
    angular_postconfiguraciones

    ## Crear Base de Datos
    #generarBD

    ## Asigna permisos necesarios
    #permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

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
javascript_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'node' 'npm'
    compruebaExisteProyecto
}

javascript_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    generarEstructura "$WORKSCRIPT/javascript/estructura"

    local dirActual=$PWD
    cd "$nombre" || exit 1
    npm install
    cd "$dirActual" || exit 1

}
javascript_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    permisos
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_javascript() {
    echo -e "$VE Generador de proyecto$RO javascript$CL"
    javascript_preconfiguraciones
    javascript_instalacion
    javascript_postconfiguraciones
}

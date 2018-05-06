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
python_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
}

python_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    compruebaExisteProyecto
    generarEstructura "$WORKSCRIPT/python/estructura"
}

python_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
## Recibe el nombre del proyecto a crear y lo genera
generar_python() {
    echo -e "$VE Generador de proyecto Python$CL"
    python_preconfiguraciones
    python_instalacion
    python_postconfiguraciones
}

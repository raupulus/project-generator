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
bash_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
}

bash_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    compruebaExisteProyecto
    generarEstructura "$WORKSCRIPT/bash/estructura"

    echo -e "$VE Descargando plantilla$CL"
    wget 'https://github.com/fryntiz/Debian_Developer_Init/raw/master/conf/home/Plantillas/Gen%C3%A9ricas/Scripts/Script%20Bash.sh' -O "$nombre/main.sh"
}

bash_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    permisos
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_bash() {
    echo -e "$VE Generador de proyecto Bash$CL"
    bash_preconfiguraciones
    bash_instalacion
    bash_postconfiguraciones
}

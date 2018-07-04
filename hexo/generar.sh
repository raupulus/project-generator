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
hexo_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'node' 'npm'
    compruebaExisteProyecto

    echo -e "$VE Comprobando paquete$RO hexo$VE en$RO npm$CL"
    if [[ ! -x '/usr/bin/hexo' ]] || [[ ! -x "$HOME/.npm/bin/hexo" ]]; then
        npm install -g hexo-cli
    fi
}

hexo_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"
    hexo init $nombre

    local dirActual=$PWD
    cd "$nombre" || exit 1
    npm install
    # hexo server
    cd "$dirActual" || exit 1

    generarEstructura "$WORKSCRIPT/hexo/estructura"

    cd "$nombre" || exit 1
    ./setup.sh
    cd "$dirActual" || exit 1
}

hexo_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    permisos
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
generar_hexo() {
    echo -e "$VE Generador de proyecto$RO hexo$CL"
    hexo_preconfiguraciones
    hexo_instalacion
    hexo_postconfiguraciones
}

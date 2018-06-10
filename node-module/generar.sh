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
node-module_preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones para el nuevo proyecto$CL"
    compruebaExisteComando 'npm'
    compruebaExisteProyecto
}

node-module_instalacion() {
    echo -e "$VE Creando proyecto con el nombre$RO $nombre$CL"

    generarEstructura "$WORKSCRIPT/node-module/estructura"

    local dirActual=$PWD
    cd "$nombre" || exit 1

    echo -e "$VE Inicializando configuración con$RO npm init$VE"
    npm init || exit 1

    touch 'index.js' "lib/${nombre}.js" "lib/${nombre}.css" "lib/index.js"

    echo "var fuzzy = require('./lib/${nombre}.js');" > 'index.js'
    echo "# Módulo NodeJS: $nombre" > 'README.md'
    echo "module.exports = require('./lib/${nombre}');" > 'lib/index.js'

    cd "$dirActual" || exit 1
}

node-module_postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    inicializar_GIT
}

###########################
##       EJECUCIÓN       ##
###########################
## Recibe el nombre del proyecto a crear y lo genera
generar_node-module() {
    echo -e "$VE Generador de proyecto módulo con NodeJS$CL"
    node-module_preconfiguraciones
    node-module_instalacion
    node-module_postconfiguraciones
}

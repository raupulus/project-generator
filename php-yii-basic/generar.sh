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
preparando() {
    while [[ -z $nombre ]]; do
        clear
        echo -e "$VE Introduce el nombre del proyecto$RO"
        read -p '  → ' nombre
        echo -e "$VE El nombre del proyecto introducido es$RO $nombre$CL"
    done

    ## Comprueba que no exista
    if [[ -d $nombre ]]; then
        echo -e "$RO Ya existe el directorio$AM $nombre$CL"
        echo -e "$VE ¿Quieres$RO BORRAR$VE y generarlo de nuevo?$RO"
        read -p '  s/N → ' opcion
        if [[ $opcion = 's' ]] || [[ $opcion = 'S' ]]; then
            rm -Rf $nombre
        else
            exit 1
        fi
    fi

    ## Crear el directorio
    mkdir $nombre
}

azc() {
    echo "test"
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_yii_basic() {
    echo -e "$VE Generador de proyecto YII Básico$CL"

    ## Preguntar nombre del directorio

    ## Preparar
    preparando

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT

    azc
}

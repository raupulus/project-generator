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
## Este script tiene como objetivo reunir las funciones comunes para todos
## los demás scrips que componen el programa, con el fin de repetir la menor
## cantidad de código posible.

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
##
## Crea un repositorio en remoto en github y sube los cambios
##
subir_github() {
    ## Preguntar si quiere subir a github el repositorio
    echo -e "$VE Subiendo repositorio a GitHub$CL"
}

##
## Inicializa un repositorio GIT
## $1  String  Recibe el nombre del directorio donde inicializar
##
inicializar_GIT() {
    ## Preguntar si quiere iniciar repositorio GIT, si no existe y no hay un directorio ".git"

    ## Entrar al repositorio
    #cd $1

    ## Inicializar repositorio si
    #git init

    ## Llama a la función que sube el repositorio a GitHub
    subir_github
}
###########################
##       EJECUCIÓN       ##
###########################

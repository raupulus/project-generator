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
## Script principal que gestiona todo el programa

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
AZ="\033[1;34m"  ## Color Azul
BL="\033[1;37m"  ## Color Blanco
CY="\033[1;36m"  ## Color Cyan
GR="\033[0;37m"  ## Color Gris
MA="\033[1;35m"  ## Color Magenta
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

WORKSCRIPT=$1    ## Directorio principal del script recibido en la llamada
USER=$(whoami)   ## Usuario que ejecuta el script

############################
##     IMPORTACIONES      ##
############################
source "$WORKSCRIPT/funciones.sh"
source "$WORKSCRIPT/php-yii-basic/generar.sh"
source "$WORKSCRIPT/php-yii-advanced/generar.sh"

###########################
##       VARIABLES       ##
###########################
nombre=''  ## El nombre del proyecto

###########################
##       FUNCIONES       ##
###########################
## Menú principal
menu_principal() {
    while true; do
        clear
        echo -e "$VE Bienvenido al menú principal, selecciona un proyecto$CL"
        echo ""
        echo -e "$RO 1)$AZ Proyecto PHP YII Básico$CL"
        echo -e "$RO 2)$AZ Proyecto PHP YII Avanzado$CL"
        #echo -e "$RO 3)$AZ Proyecto PHP Laravel$CL"
        #echo -e "$RO 4)$AZ Proyecto Python Django$CL"
        echo -e "$RO 0)$AZ Salir$CL"
        echo ""
        echo -e "$RO Introduce el proyecto"
        read -p '  → ' entrada
        echo -e "$CL"

        case $entrada in

            1) generar_php_yii_basic && exit 0;;
            2) generar_php_yii_advanced && exit 0;;

            0) exit 0;;
            *) clear; echo -e "$RO Opción no válida$CL"; read x;;
        esac
    done
}

###########################
##       EJECUCIÓN       ##
###########################

menu_principal

exit 0

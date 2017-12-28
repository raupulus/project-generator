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
## Permite integrar el repositorio en el sistema generando el comando
## "proyecto" el cual se podrá ejecutar con el usuario que lo integra en
## todo el sistema operativo (siempre que tenga permisos) para generar una
## estructura e inicializar un repositorio.

############################
##     IMPORTACIONES      ##
############################

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

WORKSCRIPT=$PWD  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################

###########################
##       EJECUCIÓN       ##
###########################

if [[ "$USER" = 'root' ]]; then
    echo -e "$RO No se contempla root por motivos de seguridad.$CL"
    echo -e "$VE Saliendo del scrip. Ejecútalo como usuario.$CL"
    exit 1
fi

## Se elimina anterior existencia del comando
if [[ -f "/home/$USER/.local/bin/proyecto" ]]; then
    rm -rf "/home/$USER/.local/bin/proyecto"
fi

## Copiar en /home/$USER/.local/bin/proyecto el $WORKSCRIPT/proyecto
cp "$WORKSCRIPT/proyecto.sh" "/home/$USER/.local/bin/proyecto"

## Dar permisos
chmod 755 "/home/$USER/.local/bin/proyecto"

## Asignar propietario
sudo chown "$USER:$USER" "/home/$USER/.local/bin/proyecto"

## Reemplaza la ruta hacia el directorio del script en el archivo copiado
## Observar que el delimitador no es "/" sino que lo cambio a "|"
sed -i "s|^WORKSCRIPT=''|WORKSCRIPT=\'$WORKSCRIPT\'|g" "/home/$USER/.local/bin/proyecto"

exit 0

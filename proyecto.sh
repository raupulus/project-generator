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
## Este script se enlazará dentro de /home/$USER/.local/bin/proyecto
## Será el lanzador de "main.sh" tras comprobar que existe el repositorio
## y actualizarlo si procede para traer cambios.
## $1 Recibe como primer parámetro el tipo de proyecto
## $2 Recibe como segundo parámetro el nombre para el proyecto (Opcional)

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

WORKSCRIPT=''  ## Directorio principal del script
USER=$(whoami)   ## Usuario que ejecuta el script

###########################
##       EJECUCIÓN       ##
###########################
## Si es ejecutado como root sale del script
if [[ "$USER" = 'root' ]]; then
    echo -e "$RO No se contempla root por motivos de seguridad.$CL"
    echo -e "$VE Saliendo del scrip. Ejecútalo como usuario.$CL"
    exit 1
fi

## Si pide ayuda se muestra este menú
if [[ "$1" = '-h' ]] || [[ "$1" = '--help' ]]; then
    echo -e "$VE Menú de ayuda$CL"
    echo ''
    echo -e "$AZ Sintaxis:$RO proyecto$MA tipo$AM nombre$CL"
    echo ''
    echo -e "$AZ Tipos de proyectos:$CL"
    echo -e "$RO yii$VE → Genera estructura de Yii2 framework php$CL"
    echo -e "$RO js$VE → Genera Proyecto Javascript$CL"
    echo -e "$RO slim$VE → Genera Proyecto Slim$CL"
    echo -e "$RO bash$VE → Genera Proyecto Bash$CL"
    echo -e "$RO python$VE → Genera Proyecto Python$CL"
    echo -e "$RO angular$VE → Genera Proyecto Angular$CL"
    echo -e "$RO node$VE → Genera Proyecto Node$CL"
    echo -e "$RO blask$VE → Genera Proyecto Blask$CL"
    echo -e "$RO hexo$VE → Genera Proyecto Hexo$CL"

    exit 0
fi

## Si no existe proyecto → git clone ¿? (Preguntar si descargar de nuevo)
if [[ ! -d "$WORKSCRIPT" ]] || [[ ! -f "$WORKSCRIPT/main.sh" ]]; then
    echo -e "$RO El programa principal ha sido movido de directorio$VE"
    read -p '¿Clonar de nuevo el directorio en el mismo lugar? s/N' entrada
    if [[ "$entrada" = 's' ]] || [[ "$entrada" = 'S' ]]; then
        echo -e "$VE Preparando para clonar repositorio$CL"
        git clone 'https://github.com/fryntiz/Generador_Proyectos.git' "$WORKSCRIPT" || exit 1
    else
        echo -e "$VE No se clona el repositorio, error al intentar regenerar$CL"
        exit 1
    fi
fi

## Actualizar repositorio
function actualizar_proyectos() {
    echo -e "$VE Actualizando scripts$CL"
    local diractual=$(pwd)
    cd "$WORKSCRIPT" || exit 1
    git checkout -- .
    git pull
    ./instalar.sh
    cd $diractual || exit 1
}

actualizar_proyectos

## LLamada al script principal del repositorio main.sh
if [[ $# = 1 ]]; then
    $WORKSCRIPT/main.sh "$WORKSCRIPT" "$1"
elif [[ $# = 2 ]]; then
    $WORKSCRIPT/main.sh "$WORKSCRIPT" "$1" "$2"
else
    $WORKSCRIPT/main.sh "$WORKSCRIPT"
fi

exit 0

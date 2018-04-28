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
## Pide introducir un nombre para crear el proyecto
##
nombreProyecto() {
    ## Pide el nombre del proyecto
    while [[ -z "$nombre" ]]; do
        clear
        echo -e "$VE Introduce el nombre del proyecto$RO"
        read -p '  → ' nombre
        echo -e "$VE El nombre del proyecto introducido es$RO $nombre$CL"
    done
}

##
## Comprueba si ya existe este proyecto
##
compruebaExisteProyecto() {
    ## Comprueba que no exista
    if [[ -d $nombre ]]; then
        echo -e "$RO Ya existe el directorio$AM $nombre$CL"
        echo -e "$VE ¿Quieres$RO BORRAR$VE y generarlo de nuevo?$RO"
        read -p '  s/N → ' opcion
        if [[ $opcion = 's' ]] || [[ $opcion = 'S' ]]; then
            rm -Rf $nombre
        else
            echo -e "$VE Has elegido no borrarlo, no se puede continuar$CL"
            exit 1
        fi
    fi
}

##
## Genera la estructura básica del proyecto
## @param  $1  String  Recibe la cadena con la ruta de la estructura
##
generarEstructura() {
    ## Crear el directorio si no existe
    if [[ ! -d $nombre ]]; then
        echo -e "$VE Creando directorio$RO $nombre$CL"
        mkdir $nombre
    fi

    ## Copia la estructura base dentro del proyecto
    echo -e "$VE Copiando esqueleto de proyecto...$CL"
    cp -aR $1/\. "./$nombre/"
}

##
## Crear BD con el nombre del proyecto
##
generarBD() {
    echo -e "$VE ¿Quieres crear un usuario psql y una BD para el proyecto?$CL"
    echo -e "$VE Esto borrará si existe alguna con ese nombre$RO"
    read -p '  s/N → ' opcion
    if [[ $opcion = 's' ]] || [[ $opcion = 'S' ]]; then
        echo -e "$VE Asegurando que postgreSQL está funcionando$CL"
        sudo service postgresql status > /dev/null || sudo service postgresql start

        echo -e "$VE Eliminando BD y usuario$RO $nombre$CL"
        sudo -u postgres dropdb --if-exists "$nombre"
        sudo -u postgres dropdb --if-exists "$nombre\_test"
        sudo -u postgres dropuser --if-exists "$nombre"

        ./$nombre/db/CrearDB.sh

        if [[ -f ./$nombre/db/Cargar_Datos.sh ]]; then
            echo -e "$VE Cargando datos en la BD$CL"
            ./$nombre/db/Cargar_Datos.sh
        fi
    else
        echo -e "$VE No se creará Base de Datos para el proyecto$CL"
        exit 1
    fi
}

##
## Establece permisos correspondientes para el nuevo proyecto
##
permisos() {
    echo -e "$VE Asignando dueños y permisos$CL"
    echo -e "$VE Usuario →$RO $USER$CL"
    echo -e "$VE Grupo   →$RO www-data$CL"
    chmod 775 -R "$nombre"
    chown "$USER:www-data" -R "$nombre"
}
##
## Crea un repositorio en remoto en github y sube los cambios
##
subir_github() {
    ## Preguntar si quiere subir a github el repositorio
    echo -e "$VE Subiendo repositorio a GitHub$CL"

    ## TODO → Plantear con "hub" para crear repositorio remoto y subirlo
}

##
## Inicializa un repositorio GIT
## $1  String  Recibe el nombre del directorio donde inicializar
##
inicializar_GIT() {
    ## Preguntar si quiere iniciar repositorio GIT, si no existe y no hay un directorio ".git"

    ## Entrar al repositorio
    local dirActual=$PWD
    cd $nombre
    git init -q
    git add .
    git commit -q -m "Proyecto recién generado"

    ## Llama a la función que sube el repositorio a GitHub
    subir_github
}

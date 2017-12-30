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
preconfiguraciones() {
    echo -e "$VE Generando Preconfiguraciones$CL"
    composer create-project --no-install --no-scripts yiisoft/yii2-app-basic $nombre
}

instalacion() {
    echo -e "$VE Instalando$CL"
    local dirActual=$PWD
    cd $nombre
    composer install --no-scripts
    composer run-script post-create-project-cmd
    cd $dirActual
}

postconfiguraciones() {
    echo -e "$VE Generando Postconfiguraciones$CL"
    ## Temporalmente se obtiene el proyecto del repositorio "ricpelo/propuesta" ##
    FILES="check-ghi.sh check-label.sh Makefile.proyecto requisitos.php requisitos.xlsx"

    FILES=$(for p in $(echo $FILES); do echo "ricpelo-propuesta-*/$p"; done)
    curl -s -L https://github.com/ricpelo/propuesta/tarball/master | tar xz --strip-components=1 -C $nombre/docs --wildcards $(echo $FILES)

    mv -f $nombre/docs/Makefile.proyecto $nombre/docs/Makefile
    ## Hasta aquí ##

    echo -e "$VE Modificando configuración del proyecto...$AM"
    for x in $nombre/config/web.php \
             $nombre/config/console.php
    do
        sed -r -i "s%^(\\\$db = require __DIR__ . '/db.php';)$%\1\n\\\$log = require __DIR__ . '/log.php';%" $x
        sed -r -zi "s%(\s*)'log' => \[.*\1\],\1'%\1'log' => \\\$log,\1'%" $x
    done
    read -r -d '' SUB <<'EOT'
    'aliases' => [
        '\@bower' => '\@vendor/bower-asset',
        '\@npm'   => '\@vendor/npm-asset',
    ],
EOT
    perl -i -0pe "s%(\s*)'components'%\1$SUB\1'components'%" $nombre/config/console.php

    echo -e "\ntests/chromedriver" >> $nombre/.gitignore
    echo -e "\n.php_cs.cache" >> $nombre/.gitignore

    echo -e "$VE Modificando archivos con el nombre del proyecto...$AM"
    sed -i s/proyecto/$nombre/g $nombre/db/* $nombre/config/*
    mv $nombre/db/datos.sql $nombre/db/$nombre.sql
    mv $nombre/proyecto.conf $nombre/$nombre.conf
    sed -i s/proyecto/$nombre/g $nombre/$nombre.conf

    echo -e "$VE Eliminando espacios en blanco sobrantes de config/test.php...$CL"
    sed -i 's/[[:blank:]]*$//' $nombre/config/test.php

    echo -e "$VE Añadiendo permisos de escritura a directorios temporales$CL"
    chmod 0777 $nombre/runtime
    chmod 0777 $nombre/web/assets

    echo -e "$VE Asignando Solo escritura al directorio yii"
    chmod 0755 $nombre/yii
}

###########################
##       EJECUCIÓN       ##
###########################
generar_php_yii_basic() {
    echo -e "$VE Generador de proyecto YII Básico$CL"

    ## Pide nombre para el directorio del proyecto
    nombreProyecto

    ## Comprueba si ya existe un proyecto
    compruebaExisteProyecto

    preconfiguraciones

    ## Generar estructura básica
    generarEstructura "$WORKSCRIPT/php-yii-basic/estructura"

    instalacion
    postconfiguraciones

    ## Crear Base de Datos
    generarBD

    ## Asigna permisos necesarios
    permisos

    ## Preguntar si quiere inicializar repositorio y sincronizar con GitHub
    inicializar_GIT
}

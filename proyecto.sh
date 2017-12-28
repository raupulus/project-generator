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

###########################
##       EJECUCIÓN       ##
###########################
## Si es ejecutado como root → exit 1
## Generar marca de tiempo y si hace más de 1 día que no se actualiza ejecutar un → git pull
## Si no existe proyecto → git clone ¿? (Preguntar si descargar de nuevo)




exit 0

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

VERSION="0.0.1"
WORKSCRIPT=$PWD
USER=$(whoami)

sudo cp plantilla.conf /etc/apache2/sites-available/
hexo deploy
sudo a2ensite plantilla
sudo mkdir -p /var/log/apache2/plantilla

##
## Cuando la llamada al script recibe el parámetro "-y" se ejecuta sin preguntas
##
certificado() {
    if [[ -f '/usr/bin/certbot' ]]; then
        local SN=''

        if [[ "$1" = '-y' ]]; then
            SN='S'
        else
            read -p "¿Generar certificado ssl para https con certbot? → s/N" SN
        fi

        if [[ "$SN" = 's' ]] || [[ "$SN" = 'S' ]]; then
            # -d dominios (se pueden añadir más), -w ruta absoluta al directorio
            sudo certbot certonly --webroot -w /var/www/html/Publico/plantilla/public -d plantilla
        fi
    fi
}

sudo systemctl reload apache2
certificado "$1"
sudo systemctl reload apache2

exit 0

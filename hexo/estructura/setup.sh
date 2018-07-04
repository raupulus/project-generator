#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

DIR="$(basename "$(realpath .)")"

echo $DIR

PROYECT_NAME="$(echo $DIR | tr -d ' ' \
                          | tr '[:upper:]' '[:lower:]' \
                          | tr '-' '_' \
                          | tr '.' '_' \
                          | tr 'ñ' 'n' \
                          #| tr -cs '[:alnum:]' '_') \
)"
sed -i s/plantilla/$PROYECT_NAME/g apache.conf Makefile CITATION.txt README.md \
LICENSE desplegar.sh

mv 'apache.conf' "$PROYECT_NAME.conf"
rm -f $0

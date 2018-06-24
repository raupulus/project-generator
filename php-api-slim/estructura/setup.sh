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
sed -i s/plantilla/$PROYECT_NAME/g db/* config/* apache.conf \
    Makefile CITATION.txt README.md LICENSE

mv 'apache.conf' "$PROYECT_NAME.conf"
mv 'db/plantilla.sql' "db/$PROYECT_NAME.sql"
mv 'db/plantilla_datos.sql' "db/$PROYECT_NAME"'_datos'.sql
rm -f $0

## Generar random para md5
# php md5(uniqid(rand(), true))

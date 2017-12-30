#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
CHROME="chromedriver"
SN="S"
if [ -f "$DIR/$CHROME" ]
then
    if [ "$1" = "-q" ]
    then
        SN="N"
    else
        echo -n "El archivo $CHROME ya existe. ¿Desea descargar la última versión? (s/N): "
        read SN
        [ "$SN" = "s" ] && SN="S"
    fi
fi
if [ "$SN" = "S" ]
    then
    echo "Descargando la última versión de ChromeDriver..."
    ZIP=chromedriver_linux64.zip
    VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
    curl -s -o $DIR/$ZIP https://chromedriver.storage.googleapis.com/$VERSION/$ZIP
    unzip -o $DIR/$ZIP -d $DIR
    rm $DIR/$ZIP
fi

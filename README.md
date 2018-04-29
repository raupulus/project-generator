# Generador_Proyectos

Genera la estructura entre varios proyectos de los más recurridos en mi trabajo

El objetivo principal de este repositorio es crear de una forma sencilla un proyecto entre los cuales dejo planteado, mediante un menú de selección.

Se creará un comando solo para el usuario que podrá llamarse desde cualquier parte del sistema escribiendo "**proyecto**" dentro del directorio donde se desea crear. Una vez ejecutado el comando preguntará el tipo de proyecto a generar y creará su estructura.

Tras crear la estructura nos preguntará si inicializar el repositorio y después si crear un repositorio en github asociado al mismo.

## Requisitos

Para que funcione la subida a repositorio en github debes tener **hub** bien
configurado en el sistema. Más información en https://github.com/github/hub

Es fundamental tener instalado **git** en el sistema. En debian:

```bash
    sudo apt install git
```

El script está orientado a distribuciones GNU/Linux y solo se ha probado
en Debian GNU/Linux stable por lo que no se garantiza el funcionamiento en
otros sistemas o incluso otras ramas de la misma distribución.

Más información sobre Debian: https://www.debian.org/

Para aplicaciones o frameworks php es necesario tener instalado **composer**.
Más sobre comoser: https://getcomposer.org/

Para aplicaciones o frameworks python es necesario tener instalado **pip** y/o
**pip3** para python3. Más información: https://es.wikipedia.org/wiki/Pip_(administrador_de_paquetes)


## A tener en cuenta

Prácticamente todos los proyectos tendrán dependencias que se resuelven automáticamente si tenemos bien instalado las tecnologías necesarias.

Se parte de haber preparado el script con una de las siguientes
**herramientas** o conjunto de **scripts** propios:

- https://github.com/fryntiz/Fedora_Developer_Init
- https://github.com/fryntiz/Debian_Developer_Init

La Guía de **estilos** usada para la sintaxis en **bash** es la siguiente:

- https://github.com/fryntiz/Bash_Style_Guide

Se deberá tener configurado gestores de paquetes para cada **proyecto** y para **git**:
- Para que funcione correctamente se deberá tener instalado servidores y tecnologías necesarias para cada ámbito, por ejemplo para un proyecto **php** deberá existir **composer**, para python **pip**
- Para inicializar repositorio deberá estar instalado **GIT**.
- Para poder crear repositorio en **GitHub** correctamente deberá estar **git** configurado en el sistema.

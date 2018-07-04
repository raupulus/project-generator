.PHONY: all install npm serve clean permisos perm p requeriments req apache

all: install

install: requeriments npm permisos apache

npm:
	npm install

serve:
	hexo server

clean:
	find 'tmp' -not -path 'runtime' -not -name ".gitkeep" -exec rm -Rf {} \; || echo ''

permisos perm p:
	echo 'Aplicando permisos para desarrollo. No usar en producción, son inseguros'
	sudo chmod -R 770 .
	sudo chmod -R 777 tmp
	bash -c 'yo=$(shell whoami) && sudo chown -R $${yo}:www-data .'

requeriments req:
	echo 'Instalando dependencias'

apache:
	./desplegar.sh

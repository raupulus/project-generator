.PHONY: all install permisos perm p

all: install permisos

install:
	npm install

permisos perm p:
	echo 'Aplicando permisos para desarrollo. No usar en producción, son inseguros'
	sudo chmod -R 775 .
	bash -c 'yo=$(shell whoami) && sudo chown -R $${yo}:www-data .'

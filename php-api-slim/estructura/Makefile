.PHONY: all test tests install db psql clean permisos perm p requeriments \
	req dbfull dbh dbheroku

all: requeriments install db permisos

test tests:
	tests/main.sh

install:
	composer install
	composer run-script post-create-project-cmd

db:
	db/load.sh

dbfull:
	db/create.sh
	db/load.sh

dbh dbheroku:
	heroku psql < db/plantilla.sql
	heroku psql < db/plantilla_datos.sql

psql:
	db/psql.sh

clean:
	find 'runtime' -not -path 'runtime' -not -name ".gitignore" -exec rm -Rf {} \; || echo ''
	find 'tmp' -not -path 'tmp' -not -name ".gitignore" -exec rm -Rf {} \; || echo ''

permisos perm p:
	echo 'Aplicando permisos para desarrollo. No usar en producción, son inseguros'
	sudo chmod -R 750 .
	sudo chmod -R 775 v1
	sudo chmod -R 777 tmp/*
	bash -c 'yo=$(shell whoami) && sudo chown -R $${yo}:www-data .'

requeriments req:
	echo 'Instalando dependencias'

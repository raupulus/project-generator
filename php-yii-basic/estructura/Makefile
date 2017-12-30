.PHONY: all test cs codecept pre_codecept post_codecept run_codecept fastcs fast phpcs docs api guia guide

all: test

test: codecept phpcs

cs: phpcs

codecept: pre_codecept run_codecept post_codecept

pre_codecept:
	db/load.sh test
	tests/run-acceptance.sh

post_codecept:
	tests/run-acceptance.sh -d

run_codecept:
	vendor/bin/codecept run

fastcs: fast phpcs

fast:
	vendor/bin/codecept run unit
	vendor/bin/codecept run functional

phpcs:
	vendor/bin/phpcs

docs:
	./publish-docs.sh

api:
	./publish-docs.sh -a

guia:
	./publish-docs.sh -g

guide: guia

.PHONY: composer-install composer-install-dev composer-require composer-require-dev up start restart halt test cs-fix test-single

start: composer-install-dev up

restart: halt up

init: init-event-store init-read-model

up:
	docker-compose up -d --remove-orphans php web

recreate:
	docker-compose up -d --force-recreate --build --remove-orphans

logs:
	docker-compose logs --follow web php

composer-install:
	docker-compose run --rm --no-deps composer composer install --no-dev --ignore-platform-reqs --optimize-autoloader

composer-install-dev:
	docker-compose run --rm --no-deps composer composer install --ignore-platform-reqs

halt:
	docker-compose down -v

composer-require:
	docker-compose run --rm --no-deps composer composer require $(dependency) --ignore-platform-reqs

composer-require-dev:
	docker-compose run --rm --no-deps composer composer require --dev $(dependency) --ignore-platform-reqs

test:
	docker-compose run --rm --no-deps php ./vendor/bin/phpunit --testdox --exclude-group=none --colors=always

test-single:
	docker-compose run --rm --no-deps php ./vendor/bin/phpunit --testdox --exclude-group=none --colors=always $(test)

cs-fix:
	docker-compose run --rm --no-deps cs-fixer php-cs-fixer fix

cs-check:
	docker-compose run --rm --no-deps cs-fixer php-cs-fixer fix --dry-run -v

init-event-store:
	docker-compose run --rm --no-deps php ./bin/console broadway:event-store:create

init-read-model:
	docker-compose run --rm --no-deps php ./bin/console broadway:read-model:create
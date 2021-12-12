help:
	bash scripts/help.sh
setup:
	bash scripts/setup.sh
build:
	bash scripts/deploy.sh build
run:
	docker-compose --compatibility up -d
env:
	bash scripts/deploy.sh env

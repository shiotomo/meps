setup:
	bash scripts/setup.sh
build:
	bash scripts/deploy.sh build
start:
	bash scripts/deploy.sh start
restart:
	bash scripts/deploy.sh restart
stop:
	bash scripts/deploy.sh stop
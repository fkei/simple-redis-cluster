__PWD=$(shell pwd)

__NAME=simple-redis-cluster
__VERSION=4.0.10

.PHONY: all help

all: help

help: ## help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/\'$$'\n\\'$$'\t/g'

build: ## docker build
	docker build . -t fkei/$(__NAME):$(__VERSION)

pull: ## docker pull
	docker pull fkei/$(__NAME)

run: ## docker run
	docker run --rm --name=$(__NAME) \
	 -p 7000:7000 \
	 -p 7001:7001 \
	 -p 7002:7002 \
	 -p 7003:7003 \
	 -p 7004:7004 \
	 -p 7005:7005 \
	 -p 17000:17000 \
	 -p 17001:17001 \
	 -p 17002:17002 \
	 -p 17003:17003 \
	 -p 17004:17004 \
	 -p 17005:17005 \
	 -v $$PWD/data:/docker \
	 -it \
	 fkei/$(__NAME):$(__VERSION)

bash:
	docker exec -it $(__NAME) bash

cli: cli-7000

cli-7000:
	docker exec -it simple-redis-cluster redis-cli -c -p 7000
cli-7001:
	docker exec -it simple-redis-cluster redis-cli -c -p 7001
cli-7002:
	docker exec -it simple-redis-cluster redis-cli -c -p 7002
cli-7003:
	docker exec -it simple-redis-cluster redis-cli -c -p 7003
cli-7004:
	docker exec -it simple-redis-cluster redis-cli -c -p 7004
cli-7005:
	docker exec -it simple-redis-cluster redis-cli -c -p 7005

__PWD=$(shell pwd)

__NAME=simple-redis-cluster

.PHONY: all help

all: help

help: ## help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/\'$$'\n\\'$$'\t/g'

dry-run: ## helm install dry-run
	helm install --debug --name=$(__NAME) --dry-run .

install: ## helm install
	helm install --debug --name=$(__NAME) .

delete: ## helm delete
	helm del --purge $(__NAME)

list: ## helm list
	helm list

lint: ## helm lint
	helm lint

cli: cli-7000 ## redis-cli access

cli-7000:
	redis-cli -c -p 7000

package: ## helm package (dist:../../docs)
	helm package --destination ../../docs/ .
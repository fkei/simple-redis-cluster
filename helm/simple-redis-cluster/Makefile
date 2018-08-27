__PWD=$(shell pwd)

__NAME=simple-redis-cluster
__HELM_REPO_RUL=https://fkei.github.io/simple-redis-cluster

.PHONY: all help

all: help

help: ## help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/\'$$'\n\\'$$'\t/g'

list: ## helm list
	helm list

lint: ## helm lint
	helm lint

cli: cli-7000 ## redis-cli access

cli-7000:
	redis-cli -c -p 7000

# helm

dry-run: ## helm install dry-run
	helm install --debug --name=$(__NAME) --dry-run .

local-install: ## helm install (local dir)
	helm install --debug --name=$(__NAME) .

repo-install: ## helm install (helm repository)
	helm install $(__NAME)/$(__NAME) --name $(__NAME)

delete: ## helm delete
	helm del --purge $(__NAME)

package: ## Generate helm package (dist:../../docs)
	helm package --destination ../../docs/ .

index: ## Generate helm repository index.yaml
	cd ../../ && helm repo index --url $(__HELM_REPO_RUL) docs

add: ## Add helm repository
	helm repo add $(__NAME) $(__HELM_REPO_RUL)
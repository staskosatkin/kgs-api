
# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# docker compose tasks

.PHONY: package
package: ## Package jar with Maven
	./mvnw package -DskipTests

.PHONY: build
build: ## Build the image
	docker build -t staskosatkin/kgs-api .
	
.PHONY: push
push: ## Push the image
	docker push staskosatkin/kgs-api
	
	
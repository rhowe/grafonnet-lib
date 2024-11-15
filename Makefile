UID = $(shell id -u $(USER))
GID = $(shell id -g $(USER))

E2E_CYPRESS_BASE_VERSION ?= 18.12.1
E2E_GRAFANA_VERSION ?= 9.3.6
JSONNET_VERSION ?= 0.19.1

help:         # Show this message.
	@echo "\nAvailable Targets:\n"
	@sed -ne '/@sed/!s/# //p' $(MAKEFILE_LIST)

test:         # Run all unit tests.
	@docker run --rm \
		-w $$PWD \
		-v $$PWD:$$PWD \
		-u $(UID):$(GID) \
		--entrypoint bash \
		bitnami/jsonnet:$(JSONNET_VERSION) \
		tests.sh

test-update:  # Run all unit tests while copying test_output.json to compiled.json file.
	@docker run --rm \
		-w $$PWD \
		-v $$PWD:$$PWD \
		-u $(UID):$(GID) \
		--entrypoint bash \
		bitnami/jsonnet:$(JSONNET_VERSION) \
		tests.sh update

e2e:          # Run all end-to-end tests.
	GRAFANA_VERSION=${E2E_GRAFANA_VERSION} \
	CYPRESS_BASE_VERSION=${E2E_CYPRESS_BASE_VERSION} \
	docker-compose -f e2e/docker-compose.yml up \
		--abort-on-container-exit \
		--exit-code-from e2e

e2e-dev:      # Run e2e tests in Cypress test runner.
	GRAFANA_VERSION=${E2E_GRAFANA_VERSION} \
	DISPLAY=$$(ipconfig getifaddr en0):0 \
	docker-compose -f e2e/docker-compose.dev.yml up \
		--abort-on-container-exit \
		--exit-code-from e2e

e2e-npm-install:
	docker run --rm -it -v "$$(pwd)/e2e:/e2e" -w /e2e \
		-e CYPRESS_CACHE_FOLDER=/tmp "cypress/base:${E2E_CYPRESS_BASE_VERSION}" \
		npm install

gen-api-docs: # Generate api-docs.md from source code comments.
	@docker run --rm \
		-w $$PWD \
		-v $$PWD:$$PWD \
		trotttrotttrott/jsonnetdoc:ece56aa \
		grafonnet --markdown \
		> docs/api-docs.md

spec-import:  # Import generated libraries from https://github.com/grafana/dashboard-spec.
	svn export https://github.com/grafana/dashboard-spec/branches/_gen/_gen/7.0/jsonnet grafonnet-7.0 --force

.PHONY: help test test-update e2e e2e-dev e2e-npm-install gen-api-docs spec-import

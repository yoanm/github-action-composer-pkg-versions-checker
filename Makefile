.PHONY: configure
configure:
	$(eval version = $(shell $(MAKE) get-action-nodejs-version))
	. ~/.nvm/nvm.sh || true && nvm install $(version) && nvm use $(version)

.PHONY: install
install:
	yarn install

.PHONY: build
build: install compile package

.PHONY: compile
compile:
	npm run compile

.PHONY: package
package:
	npm run package

.PHONY: lint
lint:
	npm run lint

.PHONY: test
test:
	echo "Error: no test specified"
	exit 1

get-action-nodejs-version: ## Display node version configured on action.yml
	@grep -E "using:\s*'?node" action.yml | sed -e "s/^.*using: '*node\([0-9][0-9]\)'*.*$$/\1/"

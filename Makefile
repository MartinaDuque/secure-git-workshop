SHELL := /bin/bash
PACKAGES = git python3 jq curl make

ifeq ($(shell uname -s),Darwin)
	PKG_SYSTEM=brew
	EXTRA_ARG='' -e
endif

ifeq ($(shell uname -s),Linux)
	PKG_SYSTEM=apt
	#PKG_SYSTEM=yum
endif


setup:
	@if grep -r --color Makefile .gitignore; \
	then \
		sed -i $(EXTRA_ARG) 's/^Makefile/#Makefile/' .gitignore; \
	fi
	@grep -r --color Makefile .gitignore
	#$(foreach var,$(PACKAGES),$(PKG_SYSTEM) install $(var);)

versions:
	@git --version
	@docker --version
	@python3 -V
	@jq --version
	@curl --version
	@make --version

verify:
	@which git
	@which docker
	@which python3
	@which jq
	@which curl
	@which make

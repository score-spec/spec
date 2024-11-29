# Disable all the default make stuff
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

SCORE_EXAMPLES_DIR ?= ./samples

## Display help menu
.PHONY: help
help:
	@echo Documented Make targets:
	@perl -e 'undef $$/; while (<>) { while ($$_ =~ /## (.*?)(?:\n# .*)*\n.PHONY:\s+(\S+).*/mg) { printf "\033[36m%-30s\033[0m %s\n", $$2, $$1 } }' $(MAKEFILE_LIST) | sort

# ------------------------------------------------------------------------------
# NON-PHONY TARGETS
# ------------------------------------------------------------------------------

${GOPATH}/bin/jv:
ifeq ($(GOPATH),)
	$(error GOPATH must be set)
endif
	go install github.com/santhosh-tekuri/jsonschema/cmd/jv@latest

# ------------------------------------------------------------------------------
# PHONY TARGETS
# ------------------------------------------------------------------------------

.PHONY: .ALWAYS
.ALWAYS:

## Test that the score schema matches the json-schema reference
.PHONY: test-schema
test-schema: ${GOPATH}/bin/jv
	${GOPATH}/bin/jv --assert-format --assert-content https://json-schema.org/draft/2020-12/schema ./score-v1b1.json
	@echo "Schema is a valid jsonschema"

## Test that the given score examples in $SCORE_EXAMPLES_DIR match the schema
.PHONY: test-examples
test-examples: ${GOPATH}/bin/jv
ifeq ($(SCORE_EXAMPLES_DIR),)
	$(error SCORE_EXAMPLES_DIR must be set)
endif
	for f in $$(find ${SCORE_EXAMPLES_DIR} -name 'score*.yaml' -print); do ${GOPATH}/bin/jv --assert-format --assert-content ./score-v1b1.json $$f; done
	@echo "Schema matches all samples"

## Run all tests
.PHONY: test
test: test-schema test-examples

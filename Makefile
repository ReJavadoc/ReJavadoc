# Makefile for generating ReJavadoc binaries

# Output directory for generated files
OUTPUT ?= ./out

# Path to the protoc include directory
DIR ?= .

# Path to the protoc compiler
PROTOC ?= protoc

# Choice of language for the generated files
LANGUAGE ?= java

build:
	@mkdir -p $(OUTPUT)/$(LANGUAGE)
	@$(PROTOC) -I=${DIR} --$(LANGUAGE)_out=$(OUTPUT)/${LANGUAGE} $(shell find . -name '*.proto')

docs: export GOBIN=$(shell pwd)/bin
docs:
	@go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest
	@$(PROTOC) --plugin=bin/protoc-gen-doc --doc_out=docs --doc_opt=html,index.html $(shell find . -name '*.proto')

clean:
	@rm -rf $(OUTPUT)/$(LANGUAGE)
	@rm -rf docs/index.html
	@rm -rf bin
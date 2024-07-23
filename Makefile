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
	mkdir -p $(OUTPUT)/$(LANGUAGE)
	$(PROTOC) -I=${DIR} --$(LANGUAGE)_out=$(OUTPUT)/${LANGUAGE} $(shell find . -name '*.proto')

clean:
	rm -rf $(OUTPUT)/$(LANGUAGE)
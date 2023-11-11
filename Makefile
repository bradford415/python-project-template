## Makefile to automate commands like ci/cd, installing dependencies, and creating a virtual environment

## Excecutes all commands in a single shell (allows us to activate a virtual env and install dependencies in it)
.ONESHELL:

.PHONY: 

## Immediately set variables (only set at declaration time)
VENV_NAME := pytemplate
REQUIREMENTS := requirments.txt

## Recursively expanded variables
python_source = python

venv: ## Create virtual environment
	python -m venv .venv/${VENV_NAME} 

test:

require:

install:
	python -m pip install -e .	


create: ## Create virtual environment and install dependencies and the project itself  
	venv
	install






